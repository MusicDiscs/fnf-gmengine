x = base_x + offsets[0]
y = base_y + offsets[1]

offsets = obj_offseteditor_handler.animlist[obj_offseteditor_handler.curanimnum][1]
image_xscale = scale
if flip == true {
	x = base_x + offsets[0] + sprite_get_width(asset_get_index("spr_chr_" + curchar + "_idle"))
	image_xscale = scale * -1
}
image_yscale = scale
sprite_index = curpath