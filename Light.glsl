#pragma language glsl3
#pragma debug(on)

uniform vec2 lightpos;
uniform float lightradius;
uniform vec4 lightcolor;

vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords )
{

  float dist=pow(lightpos.x -screen_coords.x,2)+pow(lightpos.y -screen_coords.y,2);
  float distprc =min(1,dist/pow(lightradius,2));
  vec4 distv=vec4(1,1,1,1-distprc);
  vec4 texturecolor=Texel(tex,texture_coords);
  return color*distv;
}
