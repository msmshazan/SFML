#version 100
precision mediump float;

uniform sampler2D u_Texture;
uniform float blur_radius;
varying vec4 v_Color;
varying vec2 v_TexCoord;
void main()
{
    vec2 offx = vec2(blur_radius, 0.0);
    vec2 offy = vec2(0.0, blur_radius);

    vec4 pixel = texture2D(u_Texture, v_TexCoord.xy)               * 4.0 +
                 texture2D(u_Texture, v_TexCoord.xy - offx)        * 2.0 +
                 texture2D(u_Texture, v_TexCoord.xy + offx)        * 2.0 +
                 texture2D(u_Texture, v_TexCoord.xy - offy)        * 2.0 +
                 texture2D(u_Texture, v_TexCoord.xy + offy)        * 2.0 +
                 texture2D(u_Texture, v_TexCoord.xy - offx - offy) * 1.0 +
                 texture2D(u_Texture, v_TexCoord.xy - offx + offy) * 1.0 +
                 texture2D(u_Texture, v_TexCoord.xy + offx - offy) * 1.0 +
                 texture2D(u_Texture, v_TexCoord.xy + offx + offy) * 1.0;

    gl_FragColor =  v_Color * (pixel / 16.0);
}
