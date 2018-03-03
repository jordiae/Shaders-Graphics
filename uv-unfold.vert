#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec2 Min=vec2(-1,-1);
uniform vec2 Max=vec2(1,1);

uniform vec3 boundingBoxMin; // cantonada minima de la capsa englobant 
uniform vec3 boundingBoxMax; // cantonada maxima de la capsa englobant



void main()
{
    // hem de projectar cada vertex sobre l'espai de coordenades de textura
    // 
    
    ///vec3 N = normalize(normalMatrix * normal);
    float vx = 2*(texCoord.s - Min.x)/(Max.x - Min.x)-1.0;
    float vy = 2*(texCoord.t - Min.y)/(Max.y - Min.y)-1.0;
    vec2 v = vec2(vx,vy);
    frontColor = vec4(color,1.0);// * N.z;
    vtexCoord = texCoord;
    gl_Position =vec4(v, 0.0,1.0); // he tret  modelViewProjectionMatrix * 
}
