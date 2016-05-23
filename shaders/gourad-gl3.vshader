#version 130

uniform mat4 uProjMatrix;
uniform mat4 uModelViewMatrix;
uniform mat4 uNormalMatrix;
uniform vec3 uLight;

in vec3 aPosition;
in vec3 aNormal;

out float intensity;

void main() {
  vec3 vNormal = vec3(uNormalMatrix * vec4(aNormal, 0.0));

  // send position (eye coordinates) to fragment shader
  vec4 tPosition = uModelViewMatrix * vec4(aPosition, 1.0);
  vec3 vPosition = vec3(tPosition);
  gl_Position = uProjMatrix * tPosition;

  vec3 tolight = normalize(uLight - vPosition);
  vec3 normal = normalize(vNormal);
  vec3 vReflect = reflect(-tolight, normal);
  const float refP = 16.0;

  const float ambient = 0.1;
  float diffuse = max(0.0, dot(normal, tolight));
  float diffuseI = 0.7;
  float specular = diffuse!=0.0? pow(max(0.0, dot(vReflect, tolight)), refP) : 0.0;
  float specularI = 0.5;
  intensity = ambient + diffuseI*diffuse + specularI*specular;
}
