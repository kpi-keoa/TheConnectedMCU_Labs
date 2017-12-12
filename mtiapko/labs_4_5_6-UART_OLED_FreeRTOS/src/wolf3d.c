#include "print.h"
#include "wolf3d.h"
#include "ray_cast.h"

input_t       input_g;
window_t      window_g;
wolf3d_data_t data_g; 

void check_collision(float new_x, float new_y)
{
	vec2f_t new_pos = {
		.x = data_g.player.pos.x + new_x,
		.y = data_g.player.pos.y + new_y
	};

	if (!data_g.map.data[(int32_t)data_g.player.pos.y * data_g.map.width + (int32_t)new_pos.x])
		data_g.player.pos.x = new_pos.x;
	if (!data_g.map.data[(int32_t)new_pos.y * data_g.map.width + (int32_t)data_g.player.pos.x])
		data_g.player.pos.y = new_pos.y;
}

FRESULT wolf3d_create()
{
	if (print_create() || input_create(&input_g) || window_create(&window_g))
		return FUNC_ERROR;

	return FUNC_OK;
}
void wolf3d_run()
{
	float   angle;
	float   fish_eye_mem[WINDOW_WIDTH];
	uint8_t data[12 * 10]  = {
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 0, 0, 0, 0, 0, 1, 0, 0, 0,
		1, 1, 0, 1, 0, 0, 1, 0, 0, 0,
		1, 1, 0, 1, 1, 1, 1, 0, 0, 0,
		1, 0, 0, 1, 0, 0, 1, 1, 0, 0,
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		1, 0, 0, 1, 0, 1, 1, 0, 0, 0,
		1, 0, 0, 1, 0, 0, 0, 0, 0, 0,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	};

	PRINT_MESSAGE("Loading...\n");
	data_g.player.pos.x         = 3.7f;
	data_g.player.pos.y         = 5.7f;
	data_g.player.angle         = 0.0f;
	data_g.player.FOV           = 60;
	data_g.player.dist_to_plane = (window_g.width / 2) / tanf(TO_RAD(data_g.player.FOV / 2.0f));
	data_g.player.move_speed    = 0.025f;
	data_g.player.strafe_speed  = 0.1f;
	data_g.player.rotate_speed  = 0.35f;

	data_g.map.width  = 10;
	data_g.map.height = 12;
	data_g.map.data   = data;

	data_g.fish_eye = fish_eye_mem;
	for (uint32_t i = 0; i < window_g.width; ++i)
		data_g.fish_eye[i] = cosf(TO_RAD((1.0f - (float)i / (window_g.width / 2))
			* (data_g.player.FOV / 2)));

	PRINT_MESSAGE("Running...\n");
	while (true) {
		data_g.player.angle += input_g.dx * data_g.player.rotate_speed;
		if (data_g.player.angle > 360.0f)
			data_g.player.angle -= 360.0f;
		else if (data_g.player.angle < 0.0f)
			data_g.player.angle += 360.0f;

		if (input_g.key[FORWARD_KEY]) {
			angle = data_g.player.angle + (int32_t)(data_g.player.FOV / 2);
			check_collision(data_g.player.move_speed * cosf(TO_RAD(angle)),
				data_g.player.move_speed * sinf(TO_RAD(angle)));
		}
		if (input_g.key[BACKWARD_KEY]) {
			angle = data_g.player.angle + (int32_t)(data_g.player.FOV / 2);
			check_collision(-data_g.player.move_speed * cosf(TO_RAD(angle)),
				-data_g.player.move_speed * sinf(TO_RAD(angle)));
		}

		for (uint32_t i = 0; i < window_g.height * window_g.width / 32; ++i)
			((uint32_t*)window_g.data)[i] = 0xFFFFFFFF;

		ray_cast_run();
		window_draw(&window_g);
	}
}
