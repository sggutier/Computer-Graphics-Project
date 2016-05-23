#version 130

uniform vec3 uColor;

in float intensity;

out vec4 fragColor;

void main() {
  fragColor = vec4(uColor * intensity, 1.0);
}
