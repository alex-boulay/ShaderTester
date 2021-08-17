#pragma language glsl3
#pragma debug(on)

uniform vec2 lightpos;
uniform float lightradius;

vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords )
{

  float dist=sqrt(pow(lightpos.x -screen_coords.x,2)+pow(lightpos.y -screen_coords.y,2));
  float distprc = 1 - min(1,dist/lightradius);
  return color+distprc;
}
