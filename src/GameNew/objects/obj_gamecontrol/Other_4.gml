
load_room();

if (newRoom == -1) exit;
if !instance_exists(obj_amadix) instance_create_layer(128, 128, "Instances", obj_amadix);
if instance_exists(obj_amadix){
	obj_amadix.x = newX;
	obj_amadix.y = newY;
	obj_amadix.facing = oldfacing;
	obj_amadix.running = oldrunning;
	with (obj_amadix){
		switch(facing){
			case index_facing.right: scr_setPlayerFacingAnim(index_facing.right);		break;	
			case index_facing.left: scr_setPlayerFacingAnim(index_facing.left);			break;	
			case index_facing.up: scr_setPlayerFacingAnim(index_facing.up);				break;	
			case index_facing.down: scr_setPlayerFacingAnim(index_facing.down);			break;	
			case -1: scr_setPlayerFacingAnim(index_facing.right);						break;	
		}
		
	}
}