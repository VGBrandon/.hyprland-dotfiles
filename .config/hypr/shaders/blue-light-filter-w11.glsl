#version 320 es

precision mediump float;

uniform sampler2D tex;
out vec4 fragColor;

void main() {
    vec2 uv = gl_FragCoord.xy / vec2(textureSize(tex, 0)); // Normaliza las coordenadas
    vec4 color = texture(tex, uv);

    // Ajuste de canales para reducir la luz azul
    color.r *= 1.0;
    color.g *= 0.8;
    color.b *= 0.6;
    fragColor = color;
}
