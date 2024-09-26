//if !variable_instance_exists(self, nid) {nid = 2}

if nid < 4 {isbf = true}
else {isbf = false}

image_xscale = 0.7
image_yscale = 0.7

isacc = global.clientprefs.gameplay.accuratenoteanim

lastspeed = 1

if isbf == true {skin = obj_input_handler.noteskin[0]}
else {skin = obj_input_handler.noteskin[1]}

oppanim = "strum"
curanim = "strum"

cover_exist = false

cover = undefined

if isbf == true {keybind = dir}

function create_cover() {
	if cover == undefined {cover = instance_create_depth(x, y, -1, obj_note_splash, {ishold : true, dir : dir, isbf : isbf, nid : nid})}
	else if cover.holdstate == 1 {cover.reset_holdcover()}
}

function destroy_cover() {

	if cover != undefined {cover.end_holdcover()}
	
}

sprite_index = struct_get(struct_get(skin, dir), curanim)