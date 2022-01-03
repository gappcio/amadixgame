function item_stack(iitem, amount, xx, ready){
	
	if ready == undefined{ready = 0;}
	var slots = obj_inventory.inv_slots;
	var inv = obj_inventory.ds_inventory;
	var itemall = obj_inventory.ds_item_all;
	var am = amount;
	//var flag = false;
	
		var i = 0;
		var flag = false;
		repeat(slots){
			if (!flag){
				if (ready){
					if (inv[# ITEM, i] == item.none){
						inv[# ITEM, i] = iitem;
						inv[# AMOUNT, i] = amount;
						inv[# TYPE, i] = itemall[# TYPE, iitem];
						inv[# MAXSTACK, i] = itemall[# MAXSTACK, iitem];
						inv[# HP, i] = itemall[# HP, iitem];
						inv[# STAMINA, i] = itemall[# STAMINA, iitem];
						inv[# LEVEL, i] = itemall[# LEVEL, iitem];
						inv[# DAMAGE, i] = itemall[# DAMAGE, iitem];
						inv[# DEFENCE, i] = itemall[# DEFENCE, iitem];
						inv[# EFFECT1, i] = itemall[# EFFECT1, iitem];
						inv[# EFFECT2, i] = itemall[# EFFECT2, iitem];
						inv[# EFFECT3, i] = itemall[# EFFECT3, iitem];
						flag = true;
					}else{
						i++;	
					}
				}else{
					if (inv[# ITEM, i] == iitem) && !(inv[# AMOUNT, i] == itemall[# MAXSTACK, iitem]){
						if (inv[# AMOUNT, i] + am > itemall[# MAXSTACK, iitem]){
							am = (inv[# AMOUNT, i] + amount) - itemall[# MAXSTACK, iitem];
							inv[# AMOUNT, i] = itemall[# MAXSTACK, iitem];
							item_stack(iitem, am, 0, false);
							flag = true;
						}else{
							inv[# AMOUNT, i]+=amount;
							flag = true;
						}
					}else{
						i++;
						if (i >= slots){
							item_stack(iitem, am, 0, true);
						}
					}
				}
			}
		}

}