#version 330 core

in vec4 frontColor;
in vec3 N;

out vec4 fragColor;

uniform float threshold = 0.3;

void main()
{
    //fragColor = 2.0*frontColor;
    fragColor = vec4(N.z);
    if (N.z < threshold) fragColor = vec4(0);
}
