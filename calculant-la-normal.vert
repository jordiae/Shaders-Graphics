#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;
//out vec3 N;
// partim de basic lighting 2, illuminacio per fragment, pero aquest
// cop sense poder passar N

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform mat4 modelViewMatrix;

out vec3 vCoordEyeSpace;

void main()
{
    //N = normalize(normalMatrix * normal);
    //N = normalMatrix * normal;
    
    vCoordEyeSpace = (modelViewMatrix*vec4(vertex,1.0)).xyz;
    
    frontColor = vec4(color,1.0);// * N.z;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}


