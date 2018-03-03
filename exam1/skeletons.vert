#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform int tiles = 1;

uniform float time;


void main()
{
    vec3 N = normalize(normalMatrix * normal);
    //frontColor = vec4(color,1.0) * N.z;
    frontColor = vec4(normalize(normalMatrix*normal).z);
    vec2 tc = tiles*texCoord;
    tc.s = tc.s/44 + 30/time;//int(30*time)%44;
  
    vtexCoord = tc;

    


    
    gl_Position = vec4(vertex, 1.0);
}
