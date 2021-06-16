precision mediump float;

uniform float wave_phase;
uniform vec2 wave_amplitude;
varying vec4 v_Color;
varying vec2 v_TexCoord;
uniform mat4 u_TextureMatrix;
uniform mat4 u_ModelViewMatrix;
uniform mat4 u_ProjectionMatrix;
attribute vec2 a_TexCoord;
attribute vec2 a_Vertex;
attribute vec4 a_Color;

void main()
{
    vec4 vertex = vec4(a_Vertex,1.0,1.0);
    vertex.x += cos(a_Vertex.y * 0.02 + wave_phase * 3.8) * wave_amplitude.x
              + sin(a_Vertex.y * 0.02 + wave_phase * 6.3) * wave_amplitude.x * 0.3;
    vertex.y += sin(a_Vertex.x * 0.02 + wave_phase * 2.4) * wave_amplitude.y
              + cos(a_Vertex.x * 0.02 + wave_phase * 5.2) * wave_amplitude.y * 0.3;

    gl_Position = u_ProjectionMatrix*u_ModelViewMatrix * vertex;
    v_TexCoord = (u_TextureMatrix * vec4(a_TexCoord,1.0,1.0)).xy;
    v_Color = a_Color;
}
