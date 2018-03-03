#version 330 core

in vec4 frontColor;
//in vec3 N;
out vec4 fragColor;

in vec3 vCoordEyeSpace;


void main()
{
    //fragColor = frontColor;
    //vec3 Nn = normalize(N);
    
    /*vec3 dx = dFdx(gl_FragCoord.xyz);
    vec3 dy = dFdy(gl_FragCoord.xyz);*/
    vec3 dx = dFdx(vCoordEyeSpace);
    vec3 dy = dFdy(vCoordEyeSpace);
    vec3 Nn = normalize(cross(dx,dy));
    fragColor = frontColor*Nn.z;
}

