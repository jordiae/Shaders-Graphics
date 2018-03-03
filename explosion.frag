#version 330 core

uniform sampler2D explosion;
uniform float time;

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;

void main()
{
    //fragColor = frontColor;
//color.a*color
    
    int frame_s = int(30*time)%48; // 48 frames, 1/30 segons.
    int frame_t = -(int(30*time)%48)/8; // la fila s'ha de moure nomes un cop hagi estat tota recorreguda

    vec2 vtc = vec2(vtexCoord.x*(1./8), vtexCoord.y*(1./6)); // 8 colunes, 6 files
    fragColor = frontColor*texture(explosion,vtc+vec2(frame_s*1./8,frame_t*1./6 -1./6)); // -1./6 perque comenci al 0, no al 40
    fragColor = fragColor.a * fragColor;
}

// sin (wt + phi)s
