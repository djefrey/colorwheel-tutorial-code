#version 330 compatibility

uniform sampler2D lightmap;
uniform sampler2D gtexture;

in vec2 lmcoord;
in vec2 texcoord;
in vec4 glcolor;
in vec3 normal;

/* RENDERTARGETS: 0,1,2 */

void main() {
	vec4 color = texture(gtexture, texcoord);
	vec2 lmcoord;
	float ao;
	vec4 overlayColor;

	clrwl_computeFragment(color, color, lmcoord, ao, overlayColor);
	color.rgb = mix(color.rgb, overlayColor.rgb, overlayColor.a);

	gl_FragData[0] = color;
	gl_FragData[1] = vec4(lmcoord, 0.0, 1.0);
	gl_FragData[2] = vec4(normal * 0.5 + 0.5, 1.0);
}
