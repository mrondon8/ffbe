/*
	AutoHotKey MACROS for FFBE
*/

;WindowSize=1024,576
;GlobalVariables
;Initial click for movement.
;AllApps=1195,207
clickMoveX := 675
clickMoveY := 400
deltaMove := 100

;All-Apps->FFBE->Wait for Loading Screen->Click to Start->Wait for Loading->
;Click World->Click Correct Continent->Click Island->Nagivate to Map->
;Click Correct Level->


global debug := false

/*
*	Main
*/

Loop
{
	startUp()
	checkStatus()

	;earthShrine()
	theHangingEdge(adv)
	;zadelWesterland()
	;marandaCoast()
	;marandaCoastZone1()
	;marandaCoastZone2()
	;Sleep 5000

	if(checkLowEnergy())
	{
		clickNo()
		Sleep 60000
	}


}

theHangingEdge(level){
	
	if(findVortex())
	{
		clickVortex()
		Sleep 1000
	}

	if(findHangingEdge())
	{
		clickHangingEdge()
	}


	if(level==adv && findAdv())
	{
		clickAdv()
	}

	if(level==pro && findPro())
	{
		clickPro()
	}

	if(isNext())
	{
		clickNext()
	}
	
	if(isFriend())
	{
		clickFriend()
	}

	if(isDepart())
	{
		clickDepart()
		Sleep 5000
	}

	if(checkFight())
	{
		while(checkFight()){
			autoBattleOn()
			Sleep 1000
			checkStatus()
		}
	}

	if(findClose())
	{
		clickClose()
	}

	if(isUnitExp())
	{
		clickUnitExp()
	}

	if(friendRequest())
	{
		dontRequest()
	}

	if(checkConnection())
	{
		clickOk()
	}

	if(isMainMenu())
	{
		scrollMenu()
	}
}

clickClose(){
	ImageSearch, FoundX, FoundY, 485, 115, 865, 700, *10 C:\AHK\FFBE\Images\close.png

	if(FoundX>0){
		Click %FoundX% %FoundY%
	}
	else
		return false
}

findClose(){
	ImageSearch, FoundX, FoundY, 485, 115, 865, 700, *10 C:\AHK\FFBE\Images\close.png

	if(FoundX>0){
		return true
	}
	else
		return false
}

clickPro(){
	ImageSearch, FoundX, FoundY, 485, 115, 865, 700, *10 C:\AHK\FFBE\Images\pro.png

	if(FoundX>0){
		Click %FoundX% %FoundY%
	}
	else
		return false
}

findPro(){
	ImageSearch, FoundX, FoundY, 485, 115, 865, 700, *10 C:\AHK\FFBE\Images\pro.png

	if(FoundX>0){
		return true
	}
	else
		return false
}

clickAdv(){
	ImageSearch, FoundX, FoundY, 485, 115, 865, 700, *10 C:\AHK\FFBE\Images\adv.png

	if(FoundX>0){
		Click %FoundX% %FoundY%
	}
	else
		return false
}

findAdv(){
	ImageSearch, FoundX, FoundY, 485, 115, 865, 700, *10 C:\AHK\FFBE\Images\adv.png

	if(FoundX>0){
		return true
	}
	else
		return false
}

clickHangingEdge(){
	ImageSearch, FoundX, FoundY, 485, 115, 865, 700, *10 C:\AHK\FFBE\Images\the_hanging_edge.png

	if(FoundX>0){
		Click %FoundX% %FoundY%
	}
	else
		return false
}

findHangingEdge(){
	ImageSearch, FoundX, FoundY, 485, 115, 865, 700, *10 C:\AHK\FFBE\Images\the_hanging_edge.png

	if(FoundX>0){
		return true
	}
	else
		return false
}

isMainMenu(){
	ImageSearch, FoundX, FoundY, 485, 175, 565, 275, C:\AHK\FFBE\Images\forge.png

	if(FoundX>0){
		return true
	}
	else
		return false
}

scrollMenu(){
	Click 675, 525, 0
	Click down
	Click 635, 525, 0
	Click up
	Sleep 1000
}

zadelWesterland(){
	;First Check if you are at the main menu screen
	if(findWorld()){
		clickWorld()
	}

	;Check if at continent screen.
	if(findGrandshelt()){
		clickGrandshelt()
	}

	;Check if at island screen.
	if(findLanzeltIsles()){
		clickLanzeltIsles()
	}

	if(checkWestersand()){
		clickWestersand()
		;Sleep while mission screen loads or else clicks will start happening too fast
		Sleep 5000
	}

	if(findWestersandExplo()){
		clickWestersandExplo()
	}

	if(inLanzelt()){
		Loop 20
			moveUpRight(0)
		Loop 10
			moveLeft(0)
	}

	if(isNext())
	{
		clickNext()
	}
	
	if(isFriend())
	{
		clickFriend()
	}

	if(isDepart())
	{
		clickDepart()
		Sleep 10000
	}

	
	if(isExplorationMap())
	{
		westersandZone1()
		westersandMoveZone2()
		westersandZone2()
		westersandBoss()
	}

	if(isUnitExp())
	{
		clickUnitExp()
	}

	if(friendRequest())
	{
		dontRequest()
	}

	if(checkConnection())
	{
		clickOk()
	}

}

castCura(){
	;Menu
	Click 835, 685
	Sleep 1000
	
	;Magic
	Click 535, 660
	Sleep 1000
	
	;2nd Character
	Click 525, 350
	Sleep 1000

	;1st Spell
	Click 525, 230
	Sleep 1000

	;1st Char
	Click 525, 230
	Sleep 1000

	;2nd Char
	Click 525, 350
	Sleep 1000
	
	;3rd Char
	Click 535, 440
	Sleep 1000

	;4rth Char
	Click 715, 245
	Sleep 1000

	;5th Char
	Click 715, 350
	Sleep 1000

	;6th Char
	Click 715, 440
	Sleep 1000

	;Back
	Click 825, 650
	Sleep 1000
	;Back
	Click 825, 650
	Sleep 1000
	;Back
	Click 825, 650
	Sleep 1000
	;Back
	Click 825, 650
	Sleep 1000
}

checkCura(count, battle)
{
	if(Mod(count,battle)==0)
	{
		return true
	}
	return false
}

westersandZone1(){
	countOne = 0

	while(countOne<14)
	{
		checkStatus()
		moveLeft(2000)
		checkStatus()
		moveRight(2000)
		checkStatus()
		if(checkFight())
		{
			countOne++

			while(checkFight()){
				autoBattleOn()
				Sleep 1000
				checkStatus()
			}
		}
	}
}

westersandMoveZone2(){
	checkStatus()
	moveRight(10000)
	moveRight(10000)
	Sleep 10000
	moveRight(10000)
	moveRight(10000)
	moveUpRight(100000)
	moveUpRight(100000)
	moveUpLeft(10000)
	moveUpLeft(10000)
	moveUpRight(10000)
	moveUpRight(10000)
	moveLeft(10000)
	moveLeft(10000)
	moveUp(10000)
	moveUp(10000)
	moveLeft(10000)
	moveLeft(10000)
	moveUp(10000)
	moveUp(10000)
	moveUpRight(10000)
	moveUpRight(10000)
}

westersandZone2(){
countTwo = 0

	while(countOne<15)
	{
		checkStatus()
		moveRight(2000)
		checkStatus()
		moveLeft(2000)
		checkStatus()
		if(checkFight())
		{
			countOne++

			while(checkFight()){
				autoBattleOn()
				Sleep 1000
				checkStatus()
			}
		}
	}	
}

westersandBoss(){
	checkStatus()
	Click 675, 365
	moveRight(10000)
	Sleep 5000
	moveRight(10000)
	moveUpRight(10000)
	moveLeft(10000)
	moveUpRight(10000)
	moveUpLeft(10000)
	moveRight(10000)
	moveDownRight(10000)
	moveLeft(10000)
	moveUp(10000)
	moveDownLeft(20000)
	moveUp(10000)
	moveLeft(10000)
	moveDownRight(10000)
	moveUp(10000)
	moveRight(10000)
	moveDownLeft(10000)
	moveUp(10000)
	moveLeft(10000)
	moveUp(10000)

	;BossBattle
	;Click Yes
	Click 785, 225
	Sleep 3000
	Click 785, 225
	Sleep 3000
	while(checkFight())
	{
		autoBattleOn()
		Sleep 1000
		checkStatus()
	}
	Sleep 2000
	Click 675, 365
	Sleep 2000
	Click 675, 365
	Sleep 2000
	Click 785, 295
	Sleep 10000
}

marandaCoastZone1(){
	countOne = 0

	while(countOne<15)
	{
		checkStatus()
		moveDown(2000)
		moveUp(2000)
		
		if(checkFight())
		{
			countOne++
			autoBattleOn()
			while(checkFight())
			{
				checkStatus()
				;Sleep 1000
			}
			Sleep 2000
			Click 675, 365
			Sleep 1000
			if(checkCura(countOne, 3))
			{
				castCura()
			}
		}
	}

	;MsgBox, Zone One Clear Moving to the next Zone

	;Moving to Zone 2
	moveUp(5000)
	moveLeft(1000)
	moveDownLeft(5000)
	moveUp(3000)
	moveUpRight(1000)
	moveLeft(1000)
	moveDownLeft(5000)
	moveUp(2000)
	moveUpRight(3000)
	moveLeft(1000)
	moveDownLeft(3000)
	moveUp(1000)
	moveUpRight(3000)
	moveUpLeft(2000)
	moveLeft(3000)
	moveUp(3000)
	moveDownLeft(2000)
}

marandaCoastZone2(){
	;In Zone 2
	Sleep 2000
	moveLeft(50)
	
	countTwo = 0
	while(countTwo<14)
	{
		checkStatus()
		moveDown(1000)
		moveUp(1000)
		
		if(checkFight())
		{
			countTwo++
			autoBattleOn()
			while(checkFight())
			{
				checkStatus()
				;Sleep 1000
			}
			Sleep 2000
			Click 675, 365
			Sleep 1000

			if(checkCura(countTwo, 3))
			{
				castCura()
			}
		}
	}

	;Moving to Boss
	;MsgBox, Zone Two Clear Moving to the next Zone	
	moveDown(1000)
	moveUpRight(2000)
	Sleep 2000
	moveLeft(1000)
	Sleep 2000
	moveLeft(5000)
	moveDown(1000)
	moveRight(5000)
	moveDown(3000)
	moveDownLeft(5000)
	moveUpLeft(1000)
	moveLeft(5000)
	moveUp(5000)
	moveDownLeft(5000)
	moveDownLeft(5000)
	moveRight(5000)
	moveUpLeft(5000)
	moveRight(2000)
	moveUp(5000)
	moveLeft(5000)
	moveUp(4000)

	;BossBattle
	;Click Yes
	Click 785, 225
	Sleep 3000
	Click 785, 225
	Sleep 3000
	autoBattleOn()
	while(checkFight())
	{
		Sleep 1000
	}
	Sleep 2000
	Click 675, 365
	Sleep 2000
	Click 675, 365
	Sleep 2000
	Click 785, 225
	Sleep 2000

	moveUpRight(5000)
	moveDownRight(3000)
	moveLeft(3000)
	moveDown(3000)
	moveLeft(3000)
	moveUpRight(3000)
	Click 785, 225
	Sleep 10000
}


f12::Pause

/*
*
*/

checkStatus(){
	if(isFfbeRunning() == false)
	{
		checkAllApps()
		checkFfbeApp()
		checkStatus()
	}
}

checkFight(){
	ImageSearch, FoundX, FoundY, 765, 665, 860, 715, C:\AHK\FFBE\Images\menu.png

	if(FoundX>0){
		return true
	}
	else
		return false			
}

isExplorationMap(){
	ImageSearch, FoundX, FoundY, 480, 60, 870, 720, *20 C:\AHK\FFBE\Images\map.png
	
	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox isExplorationMap Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox isExplorationMap could not be found on the screen.
		else
		    MsgBox isExplorationMap was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		return true
	}

	ImageSearch, FoundX, FoundY, 480, 60, 870, 720, *20 C:\AHK\FFBE\Images\explo_menu.png
	
	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox isExplorationMap Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox isExplorationMap could not be found on the screen.
		else
		    MsgBox isExplorationMap was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		return true
	}

	return false	
}

clickMarandaCoastExp(){
	ImageSearch, FoundX, FoundY, 485, 215, 850, 520, *10 C:\AHK\FFBE\Images\mara_exploration.png

	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox Click Maranda Coast Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox Click Maranda Coast Icon could not be found on the screen.
		else
		    MsgBox Click Maranda Coast The icon was found at %FoundX%x%FoundY%.
	}
	
	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}

	ImageSearch, FoundX, FoundY, 485, 215, 850, 520, *10 C:\AHK\FFBE\Images\mara_exploration1.png
	
	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox Click Maranda Coast1 Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox Click Maranda Coast1 Icon could not be found on the screen.
		else
		    MsgBox Click Maranda Coast1 The icon was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}

	return false	
}

findMarandaCoastExp(){

	ImageSearch, FoundX, FoundY, 485, 215, 850, 520, *10 C:\AHK\FFBE\Images\mara_exploration.png

	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox Find Maranda Coast Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox Find Maranda Coast Icon could not be found on the screen.
		else
		    MsgBox Find Maranda Coast The icon was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		return true
	}

	ImageSearch, FoundX, FoundY, 485, 215, 850, 520, *10 C:\AHK\FFBE\Images\mara_exploration1.png
	
	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox Find Maranda Coast1 Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox Find Maranda Coast1 Icon could not be found on the screen.
		else
		    MsgBox Find Maranda Coast1 The icon was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		return true
	}

	;MsgBox, Didn't Find Coast
	return false	
}

marandaCoast(){
	if(findMarandaCoastExp())
	{
		clickMarandaCoastExp()
	}

	if(isNext())
	{
		clickNext()
	}
	
	if(isFriend())
	{
		clickFriend()
	}

	if(isDepart())
	{
		clickDepart()
		Sleep 5000
	}

	if(isExplorationMap())
	{
		marandaCoastZone1()	
		marandaCoastZone2()
	}

	if(isUnitExp())
	{
		clickUnitExp()
	}

	if(friendRequest())
	{
		dontRequest()
	}

	if(checkConnection())
	{
		clickOk()
	}
}

clickNo(){
	ImageSearch, FoundX, FoundY, 500, 125, 850, 700, *40 C:\AHK\FFBE\Images\no.png

	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox Click No  Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox Click No Icon could not be found on the screen.
		else
		    MsgBox Click No The icon was found at %FoundX%x%FoundY%.
	}
	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}
	else
		return false			
}

checkLowEnergy(){
	ImageSearch, FoundX, FoundY, 500, 125, 850, 700, *40 C:\AHK\FFBE\Images\low_energy.png
	
	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox Low Energy Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox Low Energy Icon could not be found on the screen.
		else
		    MsgBox Low Energy The icon was found at %FoundX%x%FoundY%.
	}

	if(FoundX > 0)
		return true

	return false
}

clickOk(){
	ImageSearch, FoundX, FoundY, 500, 125, 850, 700, C:\AHK\FFBE\Images\ok.png

	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}
	else
		return false			
}

checkConnection(){
	ImageSearch, FoundX, FoundY, 500, 125, 850, 700, C:\AHK\FFBE\Images\connection.png

	if(FoundX>0){
		return true
	}
	else
		return false			
}

dontRequest(){
	ImageSearch, FoundX, FoundY, 500, 500, 655, 555, C:\AHK\FFBE\Images\dont_request.png

	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}
	else
		return false			
}

friendRequest(){
	ImageSearch, FoundX, FoundY, 500, 500, 655, 555, C:\AHK\FFBE\Images\dont_request.png

	if(FoundX>0){
		return true
	}
	else
		return false			
}

clickUnitExp(){
	Click 530, 200			
}

isUnitExp(){
	ImageSearch, FoundX, FoundY, 585, 115, 665, 138, C:\AHK\FFBE\Images\unit_exp.png

	if(FoundX>0){
		return true
	}
	else
		return false			
}

clickDepart(){
	ImageSearch, FoundX, FoundY, 635, 600, 710, 625, C:\AHK\FFBE\Images\depart.png

	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}
	else
		return false			
}

isDepart(){
	ImageSearch, FoundX, FoundY, 635, 600, 710, 625, C:\AHK\FFBE\Images\depart.png

	if(FoundX>0){
		return true
	}
	else
		return false			
}

clickFriend(){
	ImageSearch, FoundX, FoundY, 485, 215, 850, 520, C:\AHK\FFBE\Images\rank.png

	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}
	else
		return false			
}

isFriend(){
	ImageSearch, FoundX, FoundY, 485, 215, 850, 520, C:\AHK\FFBE\Images\rank.png

	if(FoundX>0){
		return true
	}
	else
		return false			
}

clickNext(){
	ImageSearch, FoundX, FoundY, 485, 215, 850, 700, C:\AHK\FFBE\Images\next.png

	if(FoundX>0){
		Click %FoundX%, %FoundY%
		return true
	}

	ImageSearch, FoundX, FoundY, 500, 475, 820, 675, C:\AHK\FFBE\Images\next1.png

	if(FoundX>0){
		Click %FoundX%, %FoundY%
		return true
	}

	ImageSearch, FoundX, FoundY, 500, 475, 820, 675, C:\AHK\FFBE\Images\next2.png

	if(FoundX>0){
		Click %FoundX%, %FoundY%
		return true
	}

	return false			
}

isNext(){
	ImageSearch, FoundX, FoundY, 485, 215, 850, 700, C:\AHK\FFBE\Images\next.png

	if(FoundX>0){
		return true
	}

	ImageSearch, FoundX, FoundY, 500, 475, 820, 675, C:\AHK\FFBE\Images\next1.png

	if(FoundX>0){
		return true
	}

	ImageSearch, FoundX, FoundY, 500, 475, 820, 675, C:\AHK\FFBE\Images\next2.png

	if(FoundX>0){
		Click %FoundX%, %FoundY%
		return true
	}	

	return false			
}

clickEarthShrineExit(){
	ImageSearch, FoundX, FoundY, 485, 215, 850, 520, C:\AHK\FFBE\Images\exit.png

	if(FoundX>0){
		Click %FoundX%, %FoundY%
		return true
	}

	ImageSearch, FoundX, FoundY, 485, 215, 850, 520, C:\AHK\FFBE\Images\earth_shrine_exit.png

	if(FoundX>0){
		Click %FoundX%, %FoundY%
		return true
	}

	ImageSearch, FoundX, FoundY, 485, 215, 850, 520, C:\AHK\FFBE\Images\earth_shrine_exit2.png
	
	if(FoundX>0){
		return true
	}
	
	return false		
}

findEarthShrineExit(){
	ImageSearch, FoundX, FoundY, 485, 215, 850, 520, C:\AHK\FFBE\Images\exit.png
	
	if(FoundX>0){
		return true
	}

	ImageSearch, FoundX, FoundY, 485, 215, 850, 520, C:\AHK\FFBE\Images\earth_shrine_exit.png
	
	if(FoundX>0){
		return true
	}

	ImageSearch, FoundX, FoundY, 485, 215, 850, 520, C:\AHK\FFBE\Images\earth_shrine_exit2.png
	
	if(FoundX>0){
		return true
	}

	return false	
}


clickWestersandExplo(){
	ImageSearch, FoundX, FoundY, 485, 205, 860, 580, *120 C:\AHK\FFBE\Images\westersand_explo.png

	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox clickWestersandExplo Isles Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox clickWestersandExplo Isles Icon could not be found on the screen.
		else
		    MsgBox clickWestersandExplo Isles The icon was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}
	return false
}

findWestersandExplo(){
	ImageSearch, FoundX, FoundY, 485, 205, 860, 580, *120 C:\AHK\FFBE\Images\westersand_explo.png

	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox findWestersandExplo Isles Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox findWestersandExplo Isles Icon could not be found on the screen.
		else
		    MsgBox findWestersandExplo Isles The icon was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		return true
	}
	return false
}

clickWestersand(){
	ImageSearch, FoundX, FoundY, 485, 205, 860, 580, *120 C:\AHK\FFBE\Images\westersand.png

	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox CheckWestersand Isles Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox CheckWestersand Isles Icon could not be found on the screen.
		else
		    MsgBox CheckWestersand Isles The icon was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}
	return false
}

checkWestersand(){
	ImageSearch, FoundX, FoundY, 485, 205, 860, 580, *120 C:\AHK\FFBE\Images\westersand.png

	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox CheckWestersand Isles Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox CheckWestersand Isles Icon could not be found on the screen.
		else
		    MsgBox CheckWestersand Isles The icon was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		return true
	}
	return false
}

inLanzelt(){
	ImageSearch, FoundX, FoundY, 550, 160, 630, 200, *120 C:\AHK\FFBE\Images\in_lanzelt_isle.png

	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox inLzenzelt Isles Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox inLzenzelt Isles Icon could not be found on the screen.
		else
		    MsgBox inLzenzelt Isles The icon was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		return true
	}
	return false
}

findLanzeltIsles(){
	ImageSearch, FoundX, FoundY, 485, 325, 650, 550, *120 C:\AHK\FFBE\Images\lanzelt_isles.png
	
	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox Find Lzenzelt Isles Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox Find Lzenzelt Isles Icon could not be found on the screen.
		else
		    MsgBox Find Lzenzelt Isles The icon was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		return true
	}

	ImageSearch, FoundX, FoundY, 490, 210, 850, 420, *120 C:\AHK\FFBE\Images\lanzelt.png

	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox Find Lzenzelt Isles Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox Find Lzenzelt Isles Icon could not be found on the screen.
		else
		    MsgBox Find Lzenzelt Isles The icon was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		return true
	}	

		return false	
}

clickLanzeltIsles(){
	;Click 650, 265

	ImageSearch, FoundX, FoundY, 485, 325, 650, 550, *120 C:\AHK\FFBE\Images\lanzelt_isles.png

	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox Click Lzenzelt Isles Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox Click Lzenzelt Isles Icon could not be found on the screen.
		else
		    MsgBox Click Lzenzelt Isles The icon was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}

	ImageSearch, FoundX, FoundY, 490, 210, 850, 420, *120 C:\AHK\FFBE\Images\lanzelt.png

	if(debug==true)
	{
		if ErrorLevel = 2
		    MsgBox Click Lzenzelt Isles Could not conduct the search.
		else if ErrorLevel = 1
		    MsgBox Click Lzenzelt Isles Icon could not be found on the screen.
		else
		    MsgBox Click Lzenzelt Isles The icon was found at %FoundX%x%FoundY%.
	}

	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}

		return false
}


clickGrandsheltIsles(){
	;Click 750, 330

	ImageSearch, FoundX, FoundY, 475, 55, 875, 710, *40 C:\AHK\FFBE\Images\grandshelt_isles.png

	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}
	else
		return false

}

findGrandsheltIsles(){
	ImageSearch, FoundX, FoundY, 475, 55, 875, 710, *40 C:\AHK\FFBE\Images\grandshelt_isles.png
	
	if(FoundX>0){
		return true
	}
	else
		return false	
}

clickGrandshelt(){
	;Click 650, 265

	ImageSearch, FoundX, FoundY, 490, 210, 850, 420, *40 C:\AHK\FFBE\Images\grandshelt.png

	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}
	else
		return false
}

findGrandshelt(){
;	return true

	ImageSearch, FoundX, FoundY, 490, 210, 850, 420, *40 C:\AHK\FFBE\Images\grandshelt.png
	;MsgBox, %FoundX%, %FoundY%
	if(FoundX>0){
		return true
	}
	else
		return false

}

clickVortex(){
	ImageSearch, FoundX, FoundY, 475, 450, 875, 625, *10 C:\AHK\FFBE\Images\vortex.png
	
	if(FoundX>0){	
		Click %FoundX% %FoundY%
	}
	else
		return false	
}

findVortex(){
	ImageSearch, FoundX, FoundY, 475, 450, 875, 625, *10 C:\AHK\FFBE\Images\vortex.png
	
	if(FoundX>0){	
		return true
	}
	else
		return false	
}

clickWorld(){
	ImageSearch, FoundX, FoundY, 475, 450, 875, 625, *10 C:\AHK\FFBE\Images\world.png

	if(FoundX>0){
		Click %FoundX%, %FoundY%
	}
	else
		return false	
}

findWorld(){
	ImageSearch, FoundX, FoundY, 475, 450, 875, 625, *10 C:\AHK\FFBE\Images\world.png
	
	if(FoundX>0){	
		return true
	}
	else
		return false	
}

checkFfbeApp(){
	allAppsArray := findFfbeApp()
	
	if(allAppsArray != false)
	{
		x := allAppsArray[1]
		y := allAppsArray[2]
		Click %x%, %y%
		Sleep 10000
		Click 675, 300
		Sleep 5000
		Click 675, 300
		Sleep 30000
	}
	Sleep 1000

}

checkAllApps(){
	allAppsArray := findAllApps()
	if(allAppsArray != false)
	{
		x := allAppsArray[1]
		y := allAppsArray[2]
		Click %x%, %y% 
	}
	Sleep 5000
}

startUp(){
	IfWinActive, BlueStacks App Player
	{
		return true
	}
	else
	{
		WinActivate, BlueStacks App Player
		Sleep 1000
	}
}

isFfbeRunning(){
	ImageSearch, FoundX, FoundY, 0, 0, 940, 40, *10 C:\AHK\FFBE\Images\ffbe_app_tab.png

	if(FoundX>0){
		return true
	}
	else
		return false
}

findFfbeApp(){
	ImageSearch, FoundX, FoundY, 100, 100, 1250, 450, C:\AHK\FFBE\Images\ffbeapp.png

	if(FoundX>0){
		array := Object()
		array.Insert(FoundX)
		array.Insert(FoundY)
		return array
	}
	else
		return false
}

findAllApps(){
	ImageSearch, FoundX, FoundY, 1150, 100, 1270, 230, C:\AHK\FFBE\Images\apps.png
	if(FoundX>0){
		array := Object()
		array.Insert(FoundX)
		array.Insert(FoundY)
		return array
	}
	else
		return false
}

dontRequestFriend(){
	Click 575, 525
}

topFriend(){
	Click 525, 275
}

earthShrine(){
	if(findWorld() == true)
	{
		clickWorld()
		Sleep 5000
		clickGrandshelt()
		Sleep 5000
		clickGrandSheltIsles()
		Sleep 5000
		Click 670, 550, 0
		Click down
		Sleep 1000
		Click 850, 550
		Click up
		Sleep 1000
		Click 575, 510
		Sleep 5000

	}


	if(findEarthShrineExit())
	{
		clickEarthShrineExit()
	}

	if(isNext())
	{
		clickNext()
	}
	
	if(isFriend())
	{
		clickFriend()
	}

	if(isDepart())
	{
		clickDepart()
		Sleep 5000
		Click 535, 690
		Sleep 5000
	}

	if(isUnitExp())
	{
		clickUnitExp()
	}

	if(friendRequest())
	{
		dontRequest()
	}

	if(checkConnection())
	{
		clickOk()
	}

	Sleep 100
}

denOfTheBeast(){
	Click 650, 365	
}

autoBattleOn(){
	 Click 525, 700
}

/*
clickNext(){
	Click 675, 625
}
*/

;Click and Drag
moveUp(timer){
	checkStatus()
	Click 675, 365, 0
	Click down
	;Sleep 500
	Click 675, 335, 0
	Sleep timer
	Click up
	if(isFfbeRunning()==false){
		moveUp(timer)
	}	
}

;Click and Drag
moveDown(timer){
	checkStatus()
	Click 675, 365, 0
	Click down
	;Sleep 500
	Click 675, 395, 0
	Sleep timer
	Click up
	if(isFfbeRunning()==false){
		moveDown(timer)
	}	
}

;Click and Drag
moveLeft(timer){
	checkStatus()
	Click 675, 365, 0
	Click down
	;Sleep 500
	Click 645, 365, 0
	Sleep timer
	Click up
	if(isFfbeRunning()==false){
		moveLeft(timer)
	}	
}


;Click and Drag
moveRight(timer){
	checkStatus()
	Click 675, 365, 0
	Click down
	;Sleep 500
	Click 705, 365, 0
	Sleep timer
	Click up
	if(isFfbeRunning()==false){
		moveRight(timer)
	}
}

;Click and Drag
moveUpRight(timer){
	checkStatus()
	Click 675, 365, 0
	Click down
	;Sleep 500
	Click 705, 335, 0
	Sleep timer
	Click up
	if(isFfbeRunning()==false){
		moveUpRight(timer)
	}	
}

;Click and Drag
moveDownRight(timer){
	checkStatus()
	Click 675, 365, 0
	Click down
	;Sleep 500
	Click 705, 395, 0
	Sleep timer
	Click up
	if(isFfbeRunning()==false){
		moveDownRight(timer)
	}
}

;Click and Drag
moveDownLeft(timer){
	checkStatus()
	Click 675, 365, 0
	Click down
	;Sleep 500
	Click 635, 395, 0
	Sleep timer
	Click up
	if(isFfbeRunning()==false){
		moveDownLeft(timer)
	}
}

;Click and Drag
moveUpLeft(timer){
	checkStatus()
	Click 675, 365, 0
	Click down
	;Sleep 500
	Click 635, 335, 0
	Sleep timer
	Click up
	if(isFfbeRunning()==false){
		moveUpLeft(timer)
	}
}