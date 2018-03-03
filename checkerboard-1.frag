#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 texC;


vec3 black = vec3(0,0,0);
vec3 white = vec3(1,1,1);
vec3 grey = vec3(0.8,0.8,0.8); 

void main()
{


    vec2 texCN = vec2(floor(texC.s*8.0),floor(texC.t*8.0));
    if ((mod(texCN.x,2) == 0) && (mod(texCN.y,2) == 0) )
       fragColor = vec4(grey,1);
    else if ((mod(texCN.x,2) == 0) && (mod(texCN.y,2) == 1) )
       fragColor = vec4(black,1);
    else if ((mod(texCN.x,2) == 1) && (mod(texCN.y,2) == 0) )
       fragColor = vec4(black,1);
    else 
       fragColor = vec4(grey,1);



}
