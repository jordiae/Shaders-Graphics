#version 330 core

uniform sampler2D colorMap;
uniform float speed = 0.1;
uniform float time;

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;

void main()
{
    //fragColor = frontColor;
    fragColor = frontColor*texture(colorMap,vtexCoord+vec2(time*speed,time*speed));
}


