#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Global Constants
global scroll_right_village_x := 1420
global scroll_right_village_y := 70
global view_village_x := 1470
global view_village_y := 100
global click_to_trade_x := 1625
global click_to_trade_y := 130
global click_view_map_x := 1420
global click_view_map_y := 100
global trade_food_x		:= 580
global trade_food_y		:= 420

;trade values
global lowest_apples_x		:= 1050
global lowest_apples_y		:= 530
global lowest_cheese_x		:= 1050
global lowest_cheese_y		:= 570
global lowest_meat_x		:= 1050
global lowest_meat_y		:= 610
global lowest_bread_x		:= 1050
global lowest_bread_y		:= 650
global lowest_vegetables_x	:= 1050
global lowest_vegetables_y	:= 690
global lowest_ale_x			:= 1050
global lowest_ale_y 		:= 770

global highest_apples_x	:= 1010
global highest_apples_y	:= 530
global highest_cheese_x	:= 1010
global highest_cheese_y	:= 570
global highest_meat_x		:= 1010 
global highest_meat_y		:= 610
global highest_bread_x		:= 1010
global highest_bread_y		:= 650
global highest_vegetables_x := 1010
global highest_vegetables_y := 690
global highest_ale_x		:= 1010
global highest_ale_y		:= 770

global sell_button_x		:= 1325
global sell_button_y		:= 720

;recruit values
global click_to_make_troops_x := 1670
global click_to_make_troops_y := 130
global peasants_x 			:= 475
global peasants_y 			:= 600
global archer_x				:= 735
global archer_y				:= 600

;timers
global sleep_timer			:= 2000
global move_timer			:= 200
global click_timer			:= 500
global sell_food_timer		:= 300000

;------------------------------Start of Program

Loop{
	startUp()
	sell_food()
}

f12::Pause
;------------------------------End of Program

sell_food(){
	Loop 10 {
		

		click_view_villages()

		click_recruit()
		click_recruit_archers()

		click_trade()
		click_trade_food()
		
		;Ale
		click_lowest_highest(6)
		click_sell_button()

		;Apples
		click_lowest_highest(1)
		click_sell_button()

		;Cheese
		click_lowest_highest(2)
		click_sell_button()

		;Meat
		click_lowest_highest(3)
		click_sell_button()

		;Bread
		click_lowest_highest(4)
		click_sell_button()

		;Vegetables
		click_lowest_highest(5)
		click_sell_button()

		click_next_village()
	}
	click_view_map()
	Sleep sell_food_timer
}


startUp(){
	IfWinActive, Stronghold Kingdoms - USA 5
	{
		return true
	}
	else
	{
		WinActivate, Stronghold Kingdoms - USA 5
		Sleep 1000
	}
}

click_view_map(){
	ClickXY(click_view_map_x, click_view_map_y)
}

click_view_villages(){
	ClickXY(view_village_x, view_village_y)
}

click_trade(){
	ClickXY(click_to_trade_x, click_to_trade_y)
}

click_recruit(){
	ClickXY(click_to_make_troops_x, click_to_make_troops_y)
}

click_recruit_archers(){
	ClickXY(archer_x, archer_y)	
}


click_trade_food(){
	ClickXY(trade_food_x, trade_food_y)
}

click_next_village(){
	ClickXY(scroll_right_village_x, scroll_right_village_y)
}

click_sell_button(){
	ClickXY(sell_button_x, sell_button_y)
}

click_lowest_highest(f){
	click_lowest(f)	
	click_highest(f)
	click_lowest(f)
	click_highest(f)
}

click_lowest(f){
	if(f == 1){
		ClickXY(lowest_apples_x, lowest_apples_y)
	}
	else if(f == 2){
		ClickXY(lowest_cheese_x, lowest_cheese_y)
	}
	else if(f == 3){
		ClickXY(lowest_meat_x, lowest_meat_y)
	}
	else if(f == 4){
		ClickXY(lowest_bread_x, lowest_bread_y)
	}
	else if(f == 5){
		ClickXY(lowest_vegetables_x, lowest_vegetables_y)
	}
	else if(f == 6){
		ClickXY(lowest_ale_x, lowest_ale_y)
	}
}

click_highest(f){
	if(f == 1){
		ClickXY(highest_apples_x, highest_apples_y)
	}
	else if(f == 2){
		ClickXY(highest_cheese_x, highest_cheese_y)
	}
	else if(f == 3){
		ClickXY(highest_meat_x, highest_meat_y)
	}
	else if(f == 4){
		ClickXY(highest_bread_x, highest_bread_y)
	}
	else if(f == 5){
		ClickXY(highest_vegetables_x, highest_vegetables_y)
	}
	else if(f == 6){
		ClickXY(highest_ale_x, highest_ale_y)
	}
}

ClickXY(x, y){
	MouseMove, x, y, 100
	Sleep move_timer
	Click %x%, %y%
	Sleep click_timer
}