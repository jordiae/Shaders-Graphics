#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;


void main()
{
    float A;
    if (vertex.y < 0.5)
      A = 0;
    else
      A = (vertex.y-0.5)*sin(time);
     

 
   mat3 m_rot = mat3(vec3(1,0,0),vec3(0,cos(A),sin(A)),vec3(0,-sin(A),cos(A)));

   vec3 vertexContortion = vec3(vertex.x,vertex.y-1,vertex.z);
   vertexContortion = m_rot*vertexContortion;
    vertexContortion.y += 1;


    frontColor = vec4(color,1.0);
    gl_Position = modelViewProjectionMatrix * vec4(vertexContortion, 1.0);
}

