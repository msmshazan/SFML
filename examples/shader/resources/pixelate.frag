#version 100
precision mediump float;

uniform sampler2D u_Texture;
uniform float pixel_threshold;
varying vec2 v_TexCoord;
varying vec4 v_Color;
void main()
{
    float factor = 1.0 / (pixel_threshold + 0.001);
    vec2 pos = floor(v_TexCoord.xy * factor + 0.5) / factor;
    gl_FragColor = texture2D(u_Texture, pos) * v_Color;
}
