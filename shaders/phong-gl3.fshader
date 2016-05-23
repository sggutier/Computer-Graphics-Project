#version 130

uniform vec3 uLight, uColor;

in vec3 vNormal;
in vec3 vPosition;

out vec4 fragColor;

void main() {
  vec3 tolight = normalize(uLight - vPosition);
  vec3 normal = normalize(vNormal);
  vec3 vReflect = reflect(-tolight, normal);
  const float refP = 16.0;

  const float ambient = 0.1;
  float diffuse = max(0.0, dot(normal, tolight));
  float diffuseI = 0.7;
  float specular = diffuse!=0.0? pow(max(0.0, dot(vReflect, tolight)), refP) : 0.0;
  float specularI = 0.5;
  vec3 intensity = uColor * (ambient + diffuseI*diffuse + specularI*specular);

  fragColor = vec4(intensity, 1.0);
}
