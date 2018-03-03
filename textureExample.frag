#version 330 core

uniform sampler2D colorMap0; // unit 0
uniform sampler2D colorMap1; // unit 1s
uniform float w = 0.5;
uniform float time;

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;

void main()
{
    //fragColor = frontColor;
    //vec4 c0 = texture(colorMap0,vtexCoord);
    vec4 c0 = texture(colorMap0,vtexCoord+vec2(time,0)); // temps segons s, 0 t
    //vec4 c1 = texture(colorMap1,vtexCoord);
    vec4 c1 = texture(colorMap1,vtexCoord+vec2(time,0));
    //fragColor = texture(colorMap, 4.0*vtexCoord);
    //fragColor = 0.5*(c0+c1);
    fragColor = mix(c0,c1,w);
}
