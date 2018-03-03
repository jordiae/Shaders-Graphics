#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

/*uniform vec3 boundingBoxMax;
uniform vec3 boundingBoxMin;*/

void main()
{
    // volem moure cada vertex de manera que quedi a 1 unitat del centre de coordenades, formant esfera
    /*vec3 centre = (boundingBoxMax+boundingBoxMin)/2; 
    vec3 dir = vertex-centre;
    dir = normalize(dir);
    vec3 v = centre+dir;*/
// no calia, directament normalitzant el vertex
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(normalize(vertex), 1.0);
}
