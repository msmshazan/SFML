precision mediump float;

uniform mat4 u_TextureMatrix;
uniform mat4 u_ModelViewMatrix;
uniform mat4 u_ProjectionMatrix;
varying vec4 v_Color;
varying vec2 v_TexCoord;
attribute vec2 a_TexCoord;
attribute vec2 a_Vertex;
attribute vec4 a_Color;
uniform vec2 storm_position;
uniform float storm_total_radius;
uniform float storm_inner_radius;

void main()
{
    vec4 vertex = u_ModelViewMatrix * vec4(a_Vertex,1.0,1.0);
    vec2 offset = vertex.xy - storm_position;
    float len = length(offset);
    if (len < storm_total_radius)
    {
        float push_distance = storm_inner_radius + len / storm_total_radius * (storm_total_radius - storm_inner_radius);
        vertex.xy = storm_position + normalize(offset) * push_distance;
    }

    gl_Position = u_ProjectionMatrix * vertex;
		gl_PointSize = 1.0;
    v_TexCoord = (u_TextureMatrix * vec4(a_TexCoord,1.0,1.0)).xy;
    v_Color = a_Color;
}
