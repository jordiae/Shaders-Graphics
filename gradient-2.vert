#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;


vec3 red = vec3(1,0,0);
vec3 yellow = vec3(1,1,0);
vec3 green = vec3(0,1,0);
vec3 cian = vec3(0,1,1);
vec3 blue = vec3(0,0,1);

uniform mat4 projectionMatrix;



void main()
{   
    vec4 v = modelViewProjectionMatrix*vec4(vertex,1.0);
    float minY = 0;
    float maxY = 1;
    float y = 2*((v.y/v.w-minY)/(maxY-minY)+1); //trams. y va avancant des de 0 fins a l altura total que hi hagi
    // ara estem normalitzant entre -1 i 1
    // w: perque estava en clipspace. ndc
    vec3 c;
    if (y < 1)
        c = mix(red,yellow,fract(y));
    else if (y < 2)
        c = mix(yellow,green,fract(y));
    else if (y < 3)
        c = mix(green,cian,fract(y));
    else if (y < 4)
        c = mix(cian,blue,fract(y));
    else  // per que >=? Perque es arriscat fer comparacions amb floatss
        c = blue;
    vec3 N = normalize(normalMatrix * normal);
    //frontColor = vec4(color,1.0) * z;
    frontColor = vec4(c,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
