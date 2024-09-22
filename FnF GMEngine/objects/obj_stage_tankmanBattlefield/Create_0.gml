zoom = 0.8
// Fuck working on this I'm so sick of porting things
texgroup = "tankmanBattlefield"

bf = instance_create_depth(0, 0, -1, obj_character, {charid : "bf"})
gf = instance_create_depth(0, 0, -1, obj_character, {charid : "gf"})
dad = instance_create_depth(0, 0, -1, obj_character, {charid : "dad"})

bf.pos = [790.5, 100]
bf.camoffset = [-220, -100]

dad.pos = [530.5, 296]
dad.camoffset = [250, -100]

gf.pos = [300, 0]
gf.camoffset = [0, 0]

videoplaying = false

curvid = "test"

switch global.cursong {

	case "ugh":
	curvid = "ughCutscene"
	break;
	
	case "guns":
	curvid = "gunsCutscene"
	break;
	
	case "stress":
	curvid = "stressCutscene"
	break;
	
}

skycolor = make_color_rgb(227, 162, 109)
smokeleft = create_animated_stagesprite(spr_stg_tank_leftsmoke, -200, 0, false, false)
smokeright = create_animated_stagesprite(spr_stg_tank_rightsmoke, 1100, -100, false, false)
watchtower = create_animated_stagesprite(spr_stg_tank_watchtower, 100, 50, true, false)
tankroller = create_animated_stagesprite(spr_stg_tank_tank, 300, 300, false, false)

tankbopper1 = create_animated_stagesprite(spr_stg_tank_tankman_1, -500, 650, true, false)
tankbopper2 = create_animated_stagesprite(spr_stg_tank_tankman_2, -300, 750, true, false)
tankbopper3 = create_animated_stagesprite(spr_stg_tank_tankman_3, 360, 980, true, false)
tankbopper4 = create_animated_stagesprite(spr_stg_tank_tankman_4, 1050, 1240, true, false)
tankbopper5 = create_animated_stagesprite(spr_stg_tank_tankman_5, 1200, 900, true, false)
tankbopper6 = create_animated_stagesprite(spr_stg_tank_tankman_6, 1550, 700, true, false)

function draw_stage() {

	draw_sprite_ext(spr_stg_tank_sky, 0, get_parallax_coords(false, -400, 1), get_parallax_coords(true, -400, 1), 1, 1, 0, c_white, 1)
	draw_rectangle_color(-500, -1000, 2900, 3000, skycolor, skycolor, skycolor, skycolor, false)
	draw_sprite_ext(spr_stg_tank_mountains, 0, get_parallax_coords(false, -280, 0.8), get_parallax_coords(true, -20, 0.8), 1.2, 1.2, 0, c_white, 1)
	draw_sprite_ext(spr_stg_tank_buildings, 0, get_parallax_coords(false, -180, 0.7), get_parallax_coords(true, 0, 0.7), 1.1, 1.1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_tank_ruins, 0, get_parallax_coords(false, -180, 0.65), get_parallax_coords(true, 0, 0.65), 1.1, 1.1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_tank_clouds, 0, get_parallax_coords(false, 0, 0.6), get_parallax_coords(true, 0, 0.6), 1, 1, 0, c_white, 1)
	draw_sprite_ext(smokeleft.sprite_index, smokeleft.image_index, get_parallax_coords(false, -200, 0.6), get_parallax_coords(true, 0, 0.6), 1, 1, 0, c_white, 1)
	draw_sprite_ext(smokeright.sprite_index, smokeright.image_index, get_parallax_coords(false, 1100, 0.6), get_parallax_coords(true, -100, 0.6), 1, 1, 0, c_white, 1)
	draw_sprite_ext(watchtower.sprite_index, watchtower.image_index, get_parallax_coords(false, 100, 0.5), get_parallax_coords(true, 50, 0.5), 1, 1, 0, c_white, 1)
	draw_sprite_ext(tankroller.sprite_index, tankroller.image_index, get_parallax_coords(false, 300	, 0.5), get_parallax_coords(true, 300, 0.5), 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_stg_tank_ground, 0, -420, -150, 1.15, 1.15, 0, c_white, 1)
	
	gf.draw_character()
	bf.draw_character()
	dad.draw_character()
	
	// THIS SHIT WONT FUCKING WORK I AM SO SICK OF WORKING ON THIS
	draw_sprite_ext(tankbopper1.sprite_index, tankbopper1.image_index, get_parallax_coords(false, tankbopper1.x, 0.7), get_parallax_coords(true, tankbopper1.y, 0.5), 1, 1, 0, c_white, 1)
	draw_sprite_ext(tankbopper3.sprite_index, tankbopper3.image_index, get_parallax_coords(false, tankbopper3.x, 0.5), get_parallax_coords(true, tankbopper3.y, 0.5), 1, 1, 0, c_white, 1)
	draw_sprite_ext(tankbopper4.sprite_index, tankbopper4.image_index, get_parallax_coords(false, tankbopper4.x, 2.5), get_parallax_coords(true, tankbopper4.y, 1.5), 1, 1, 0, c_white, 1)
	draw_sprite_ext(tankbopper5.sprite_index, tankbopper5.image_index, get_parallax_coords(false, tankbopper5.x, 0.5), get_parallax_coords(true, tankbopper5.y, 0.5), 1, 1, 0, c_white, 1)
	draw_sprite_ext(tankbopper6.sprite_index, tankbopper6.image_index, get_parallax_coords(false, tankbopper6.x, 0.5), get_parallax_coords(true, tankbopper6.y, 0.5), 1, 1, 0, c_white, 1)
	draw_sprite_ext(tankbopper2.sprite_index, tankbopper2.image_index, get_parallax_coords(false, tankbopper2.x, 1), get_parallax_coords(true, tankbopper2.y, 0.8), 1, 1, 0, c_white, 1)
	
}

function stage_beat_hit() {
	with (obj_AnimatedStageSprite) {animated_beat()}
}

/*
function run_self(amount) {
  pid = 0; args = ""; environ = EnvironmentGetVariable("GAME_INSTANCE");
  game_instance = ((environ != "") ? int64(environ) + 1 : 1);
  EnvironmentSetVariable("GAME_INSTANCE", string(game_instance));
  info = ProcInfoFromProcId(ProcIdFromSelf());
  cmdsize = CommandLineLength(info);
  for (i = 0; i < cmdsize; i++) args += "\"" + CommandLine(info, i) + "\" ";
  if (game_instance <= amount) pid = ProcessExecuteAsync(args);
  FreeProcInfo(info); return pid;
}

function get_self() {
  environ = EnvironmentGetVariable("GAME_INSTANCE");
  game_instance = ((environ != "") ? int64(environ) + 1 : 1);
  return game_instance;
}

window_set_caption("Game Instance #" + string(get_self()));
pid = run_self(1);

FreeExecutedProcessStandardOutput(pid);
FreeExecutedProcessStandardInput(pid);
*/