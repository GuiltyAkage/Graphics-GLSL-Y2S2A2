#version 430 core

layout (location = 0) in vec3 position;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec2 texCoord;

out vec2 TexCoord;
out vec3 Normal;
out vec3 FragPos;

layout (std140) uniform Matrices
{
    mat4 projection;
    mat4 view;
};

uniform mat4 model;
uniform mat4 normalMatrix;

void main (void)
{
	gl_Position = projection * view * model * vec4(position, 1.0);
	FragPos = vec3(model* vec4(position, 1.0f));
	Normal = normalize(mat3(normalMatrix) * normal);
	TexCoord = vec2(texCoord.x, 1.0 - texCoord.y);
}