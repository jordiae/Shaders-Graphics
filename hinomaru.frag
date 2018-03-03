#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 texC;


vec3 red = vec3(1,0,0);
vec3 white = vec3(1,1,1); 

void main()
{   
    if (distance(texC,vec2(0.5,0.5))  <= 0.2)
      fragColor = vec4(red,1);
    else 
      fragColor = vec4(white,1);



}
