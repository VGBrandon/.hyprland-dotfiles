import { App, Astal, Gtk, Gdk } from "astal/gtk3";
import { Variable, GLib, bind } from "astal";
import Hyprland from "gi://AstalHyprland";
import Wp from "gi://AstalWp";

const hyprland = Hyprland.get_default();

for (const client of hyprland.get_clients()) {
  print(client.title);
}
const time = Variable<string>("").poll(
  1000,
  () => GLib.DateTime.new_now_local().format("%H:%M")!
);

const date = Variable<string>("").poll(
  1000,
  () => GLib.DateTime.new_now_local().format("%A %e")!
);

function AudioSlider() {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!;

  return (
    <button className="AudioSlider" css="min-width: 140px">
      <icon icon={bind(speaker, "volumeIcon")} />
      <slider
        hexpand
        onDragged={({ value }) => (speaker.volume = value)}
        value={bind(speaker, "volume")}
      />
    </button>
  );
}

function FocusedClient() {
  const hypr = Hyprland.get_default();
  const focused = bind(hypr, "focusedClient");

  return (
    <button className="Focused" visible={focused.as(Boolean)}>
      {focused.as(
        (client) =>
          client && (
            <label
              label={bind(client, "class").as((v) => v.split(".").pop()!)}
            />
          )
      )}
    </button>
  );
}

const isFilterActive = Variable<boolean>(false);

// Leer estado del archivo al iniciar
try {
  const contents = GLib.file_get_contents(
    GLib.build_filenamev([GLib.get_home_dir(), ".config", "hyprshade", "state"])
  );

  const text = imports.byteArray.toString(contents[1]);
  isFilterActive.set(text.includes("actived=true"));
} catch (e) {
  print("No se pudo leer el estado del filtro");
}
function HyprshadeToggleButton() {
  return (
    <button
      className={bind(isFilterActive).as((v) => (v ? "active-filter" : ""))}
      onClicked={() => {
        const newState = !isFilterActive();
        isFilterActive.set(newState);

        GLib.spawn_command_line_async(
          `${GLib.get_home_dir()}/.hyprland-dotfiles/scripts/hyprshade-toggle.sh`
        );
      }}
    >
      <label label={bind(isFilterActive).as((v) => (v ? "󰔡" : "󰔢"))} />
    </button>
  );
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      className="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={App}
    >
      <centerbox>
        <button onClicked="wofi --show drun" halign={Gtk.Align.START}>
          <label label="󰣇" />
        </button>
        <button onClicked={() => print("hora")} halign={Gtk.Align.CENTER}>
          <label label={time()} />
        </button>

        <box halign={Gtk.Align.END}>
          <FocusedClient />
          <button onClicked={() => print("fecha")}>
            <label label={date()} />
          </button>
          <HyprshadeToggleButton />
          <button onClicked="echo apagar"></button>
        </box>
      </centerbox>
    </window>
  );
}
