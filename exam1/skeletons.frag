#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;

uniform sampler2D skeleton;

void main()
{   
    fragColor = frontColor*texture(skeleton,vtexCoord);
}
