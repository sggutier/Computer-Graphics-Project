#version 130

uniform vec3 uLight, uColor;

in vec3 vNormal;
in vec3 vPosition;

out vec4 fragColor;

void main() {
  vec3 tolight = normalize(uLight - vPosition);
  vec3 normal = normalize(vNormal);

  const float ambient = 0.1;
  float diffuse = max(0.0, dot(normal, tolight));
  vec3 intensity = uColor * min(1.0, diffuse + ambient);

  fragColor = vec4(intensity, 1.0);
}
