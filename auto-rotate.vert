#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float speed; // velocitat angular en rad/s

uniform float time;

void main()
{
    float phi = speed * time;
    mat3 m = mat3(vec3(cos(phi),0,-sin(phi)),vec3(0,1,0),vec3(sin(phi),0,cos(phi))); 
    vec3 v = m*vertex;
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(v, 1.0);
}



