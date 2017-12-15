#include <stdbool.h>
#include "print.h"
#include "maths.h"
#include "ray_cast.h"

void ray_cast_run()
{
	vec2f_t  delta;
	vec2f_t  dist;
	vec2i_t  step;
	vec2i_t  map_pos;
	vec2i_t  last_map_pos;
	float    curr_dist;
	float    angle;
	uint32_t offset;
	bool     side;
	bool     last_side;

	for (int32_t x = 0; x < (int32_t)window_g.width; ++x) {
		angle = data_g.player.angle + x * ((float)data_g.player.FOV / window_g.width);
		if (angle > 360.0f)
			angle -= 360.0f;

		if (angle <= 90.0f || angle >= 270.0f) {
			step.x  = 1;
			delta.x = 1.0f / cosf(TO_RAD(angle));
			dist.x  = (1.0f - (data_g.player.pos.x - (int32_t)data_g.player.pos.x)) * delta.x;
		} else {
			step.x  = -1;
			delta.x = -1.0f / cosf(TO_RAD(angle));
			dist.x  = (data_g.player.pos.x - (int32_t)data_g.player.pos.x) * delta.x;
		}

		if (angle <= 180.0f) {
			step.y  = 1;
			delta.y = 1.0f / sinf(TO_RAD(angle));
			dist.y  = (1.0f - (data_g.player.pos.y - (int32_t)data_g.player.pos.y)) * delta.y;
		} else {
			step.y  = -1;
			delta.y = -1.0f / sinf(TO_RAD(angle));
			dist.y  = (data_g.player.pos.y - (int32_t)data_g.player.pos.y) * delta.y;
		}

		map_pos.x = data_g.player.pos.x;
		map_pos.y = data_g.player.pos.y;

		do {
			if (dist.x < dist.y) {
				side       = false;
				dist.x    += delta.x;
				map_pos.x += step.x;
			} else {
				side       = true;
				dist.y    += delta.y;
				map_pos.y += step.y;
			}
		} while (!data_g.map.data[map_pos.y * data_g.map.width + map_pos.x]);

		if (side) {
			curr_dist = ((int32_t)(map_pos.y - (-1 + step.y) / 2) - data_g.player.pos.y)
				/ sinf(TO_RAD(angle)) * data_g.fish_eye[x];
		} else {
			curr_dist = ((int32_t)(map_pos.x - (-1 + step.x) / 2) - data_g.player.pos.x)
				/ cosf(TO_RAD(angle)) * data_g.fish_eye[x];
		}

		offset = (uint32_t)(window_g.height - data_g.player.dist_to_plane / curr_dist) / 2;
		if (offset > window_g.height / 2)
			offset = 0;

		for (uint32_t y = 0; y < offset; ++y) {
			window_set_pixel(&window_g, x, y);
			window_set_pixel(&window_g, x, window_g.height - y);
		}

		if (x) {
			if (last_map_pos.x != map_pos.x || last_map_pos.y != map_pos.y || last_side != side) {
				last_map_pos = map_pos;
				last_side = side;
				for (uint32_t y = offset; y < window_g.height - offset; ++y)
					window_set_pixel(&window_g, x, y);
			}
		} else {
			last_map_pos = map_pos;
			last_side = side;
		}
	}
}
