uniform mat4 u_ModelViewMatrix;
uniform mat4 u_ProjectionMatrix;
attribute vec4 a_TexCoord;
attribute vec4 a_Vertex;
attribute vec4 a_Color;
varying vec3 v_normal;
varying vec4 v_Color;

void main()
{
    gl_Position  = u_ProjectionMatrix * u_ModelViewMatrix *  a_Vertex;
    v_Color = a_Color;
    v_normal = vec3(a_TexCoord.xy, 1.0);
}
