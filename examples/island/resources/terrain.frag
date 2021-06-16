#version 100

precision highp float;

varying vec3 v_normal;
varying vec4 v_Color;
uniform float lightFactor;

void main()
{
    vec3 lightPosition = vec3(-1.0, 1.0, 1.0);
    vec3 eyePosition = vec3(0.0, 0.0, 1.0);
    vec3 halfVector = normalize(lightPosition + eyePosition);
    float intensity = lightFactor + (1.0 - lightFactor) * dot(normalize(v_normal), normalize(halfVector));
    gl_FragColor = v_Color * vec4(intensity, intensity, intensity, 1.0);
}
