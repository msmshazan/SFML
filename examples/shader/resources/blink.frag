#version 100
precision mediump float;

uniform sampler2D u_Texture;
uniform float blink_alpha;
varying vec4 v_Color;

void main()
{
    vec4 pixel = v_Color;
    pixel.a = blink_alpha;
    gl_FragColor = pixel;
}
