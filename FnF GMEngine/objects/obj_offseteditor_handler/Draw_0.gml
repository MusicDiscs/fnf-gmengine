draw_sprite_tiled(spr_tiled_bg, 0, -3000, -3000)

gpu_set_tex_filter(filteron)
draw_sprite_ext(ghostsprite, ghostframe, ghostx, ghosty, ghostscale[0], ghostscale[1], 0, c_white, ghostalpha)
gpu_set_tex_filter(global.clientprefs.graphics.smoothing)

//draw_sprite(spr_chr_bf_idle, 0, 500, 500)