#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform float xmin = -6;
uniform float xmax = 6;
uniform float ymin = -2;
uniform float ymax = 2;

vec3 R = vec3(1,0,0);
vec3 G = vec3(0,1,0);
vec3 B = vec3(0,0,1);

void main()
{  
    float x, y, Y;
    vec3 c;
    x = (vertex.x+1)/2; // entre 0 i 1, sabem que vertex.x estara entre -1 i 1 segons enunciat

    //tenim un valor entre 0 i 1, el volem passar a entre xmax i xmin
    x = x*(xmax-xmin) + xmin;
  
    if (vertex.z == -2) {
      y = sin(x);
      c = R;
    }
    else if (vertex.z == 0) {
      y = 2*exp(-x*x/6);
      c = G;
    }
    else if (vertex.z == 2) {
      y = sin(2*x);
      c = B;
    }
     
    // tenim un valor y entre ymin i ymax, el volem passar a entre -1 i 1

    Y = 2*(y - ymin)/(ymax-ymin)-1;
     
    
    vec4 v = vec4(vertex.x,vertex.y+Y,0,1);
    

    frontColor = vec4(c,1.0);
    gl_Position = v;
}
