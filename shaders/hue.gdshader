shader_type canvas_item;

// code from https://www.statox.fr/posts/2021/04/color_picker_shaders/?utm_campaign=color_picker_demo
// https://gist.github.com/yiwenl/745bfea7f04c456e0101
vec3 hsb2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void fragment() {
	COLOR.rgb = hsb2rgb(vec3(UV.x, 1, 1));
}
