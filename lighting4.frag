#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec3 N;
in vec4 P;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform mat4 modelViewMatrix;

uniform vec4 lightAmbient;  // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse;  // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
uniform vec4 lightPosition; // similar a gl_LightSource[0].position; en eye space
uniform vec4 matAmbient;    // similar a gl_FrontMaterial.ambient 
uniform vec4 matDiffuse;    // similar a gl_FrontMaterial.diffuse 
uniform vec4 matSpecular;   // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess

void main()
{
    vec3 Nn = normalize(N);


    vec3 L = normalize(lightPosition-P).xyz;
    vec3 OBS = vec3(0,0,0);// sabem que en eye space obs es a 0,0,0
    vec3 V = normalize(OBS-P.xyz);
    vec3 R = 2*max(0.0,dot(Nn,L))*Nn-L;
 
    fragColor = matAmbient*lightAmbient+matDiffuse*lightDiffuse*max(0.0,dot(Nn,L))+matSpecular*lightSpecular*pow(max(0.0,dot(R,V)),matShininess);;
}
