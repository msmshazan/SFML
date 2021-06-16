precision mediump float;

uniform mat4 u_TextureMatrix;
uniform mat4 u_ModelViewMatrix;
uniform mat4 u_ProjectionMatrix;
attribute vec2 a_TexCoord;
attribute vec2 a_Vertex;
attribute vec4 a_Color;

void main()
{
    // Transform the vertex position
    gl_Position = u_ProjectionMatrix* u_ModelViewMatrix * vec4(a_Vertex,1.0,1.0);
}
