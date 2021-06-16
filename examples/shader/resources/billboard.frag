#version 100
precision mediump float;

uniform sampler2D u_Texture;

in vec2 tex_coord;

void main()
{
    // Read and apply a color from the texture
    gl_FragColor = texture2D(u_Texture, tex_coord);
}
