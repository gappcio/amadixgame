#region Work out if all of our text elements have stopped fading in

var _complete = true;
var _i = 0;
repeat(array_length(text_elements))
{
    if (text_elements[_i].typist.get_state() < 1.0)
    {
        _complete = false;
        break;
    }
    
    ++_i;
}

#endregion


if (_complete){
    //If all of the text element have faded in, allow for user input
    
    if (ChatterboxIsWaiting(chatterbox)){
		waitArrow = true;
		
        if (mouse_check_button_pressed(mb_left)){
		    ChatterboxContinue(chatterbox);
		    refresh_text_elements();
        }
    }else if (ChatterboxGetOptionCount(chatterbox)){
		waitArrow = false;
        var _index = undefined;
        if (keyboard_check_pressed(ord("1"))) _index = 0;
        if (keyboard_check_pressed(ord("2"))) _index = 1;
        if (keyboard_check_pressed(ord("3"))) _index = 2;
        if (keyboard_check_pressed(ord("4"))) _index = 3;
        
        if (_index != undefined){
            //If the player pressed a number key, choose the corresponding option
            ChatterboxSelect(chatterbox, _index);
            //Always update your text elements after advancing chatterbox!
            refresh_text_elements();
        }
    }else{
		waitArrow = false;	
	}
}
else{
	waitArrow = false;
	
    //If the text elements *haven't* all finished fading in...
    if (mouse_check_button_pressed(mb_left)){
        //...and the player has pressed space then tell our Scribble typisy to skip the fade in and just display all the text
        var _i = 0;
        repeat(array_length(text_elements)){
            text_elements[_i].typist.skip();
            ++_i;
        }
    }
}

switch(myPortrait){
	case "-1":
		if (choiceStop == "0"){
			boxType = 2;
			textfix = 32;
			choiceAnim = false;
			choiceAnimDone = false;
		}else{
			boxType = 3;
			choiceAnim = true;
		}
	break;
	case "spr_portrait_amadix":
		boxType = 0;	
		textfix = 64;
		choiceAnim = false;
		choiceAnimDone = false;
	break;
	default:
		if (choiceStop == "0"){
			boxType = 1;	
			textfix = 0;
			choiceAnim = false;
			choiceAnimDone = false;
		}else{
			boxType = 3;
			choiceAnim = true;
		}
	break;
}



var _mid = 24;

if (choiceAnim){
	choicebox1_x = lerp(choicebox1_x, choicebox1_tox, .3);
	choicebox2_x = lerp(choicebox2_x, choicebox2_tox, .3);
	choiceport_x = lerp(choiceport_x, choiceport_tox, .3);
	
	if ((round(choicebox1_x) >= choicebox1_tox + _mid) && (round(choicebox1_x) <= choicebox1_tox + _mid + 8)){
		choiceAnimMid = true;	
	}
	if (round(choicebox1_x) == choicebox1_tox){

		choicebox1_x = choicebox1_fromx;
		choicebox2_x = choicebox2_fromx;
		choiceport_x = choiceport_fromx;
		
		choiceAnimDone = true;
		choiceAnimMid = false;
		choiceAnim = false;
	}
	
}
if (choiceAnimDone){
	choiceAnim = false;
	textfix = 160;	
}