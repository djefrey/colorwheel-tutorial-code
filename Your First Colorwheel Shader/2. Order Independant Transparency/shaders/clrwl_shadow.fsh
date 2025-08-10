#version 330 compatibility

uniform sampler2D gtexture;

in vec2 texcoord;
in vec4 glcolor;

/* RENDERTARGETS: 0 */

void main() {
	vec4 color = texture(gtexture, texcoord);
	vec2 lmcoord;
	float ao;
	vec4 overlayColor;

	clrwl_computeFragment(color, color, lmcoord, ao, overlayColor);

	gl_FragData[0] = color;
}
