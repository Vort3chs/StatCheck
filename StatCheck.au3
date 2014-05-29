#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Global $Radio1, $Radio2, $Radio3, $Radio4, $Radio5, $CustURL, $CustIP, $Input1, $Input5, $IPAddress1, $Label5, $rTimeOut, $TimeOut, $rTimeVal, $rTimeValv

MainGUI()

Func MainGUI()
   $Form1 = GUICreate("StatCheck", 619, 402, 192, 124)
$Label1 = GUICtrlCreateLabel("> This program checks the status of a web server, if you don't have an internet connection, or for some", 8, 8, 488, 17)
$Label2 = GUICtrlCreateLabel("reason something is preventing only you from getting a response from a webserver, than these results", 16, 24, 478, 17)
$Label3 = GUICtrlCreateLabel("don't actually reflect the status of  the server!", 16, 40, 224, 17)
$Radio1 = GUICtrlCreateRadio("DarkRP Reloaded game server", 56, 120, 321, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$Radio2 = GUICtrlCreateRadio("DarkRP Reloaded TeamSpeak", 56, 144, 337, 17)
$Radio3 = GUICtrlCreateRadio("DarkRP Reloaded Website", 56, 168, 289, 17)
$Radio4 = GUICtrlCreateRadio("Custom URL:", 56, 192, 81, 17)
$Radio5 = GUICtrlCreateRadio("Custom IP address:", 56, 216, 105, 17)
$Label4 = GUICtrlCreateLabel("Check:", 56, 104, 38, 17)
$Input1 = GUICtrlCreateInput("Input custom URL", 144, 192, 121, 21)
$IPAddress1 = _GUICtrlIpAddress_Create($Form1, 168, 216, 177, 19, -1, $WS_EX_STATICEDGE)
_GUICtrlIpAddress_Set($IPAddress1, "0.0.0.0")
$Button1 = GUICtrlCreateButton("Check Status!", 208, 272, 193, 41)
$Button2 = GUICtrlCreateButton("Help!", 504, 0, 57, 25)
$Button3 = GUICtrlCreateButton("About!", 560, 0, 57, 25)
$Button4 = GUICtrlCreateButton("Advanced Settings", 56, 240, 121, 17)
$Label5 = GUICtrlCreateLabel(" ", 199, 320, 207, 17, $SS_CENTER)
GUISetState(@SW_SHOW)

While 1
	  Switch GUIGetMsg()
		 Case $GUI_EVENT_CLOSE
			Exit
		 Case $Button3
			AboutGUI()
		 Case $Button1
			Button1()
		 Case $Button4
			AdvSetGUI()
		 Case $Button2
			HelpGUI()
	  EndSwitch
   WEnd
EndFunc   ;==>MainGUI

Func AboutGUI()
   $About_GUI = GUICreate("About!", 620, 438, 262, 223)
$Label1 = GUICtrlCreateLabel("All code, and main GUI design by: Vort3chs", 160, 24, 310, 24)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label2 = GUICtrlCreateLabel("Original idea came from: Pdog1111", 160, 152, 313, 24, $SS_CENTER)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label5 = GUICtrlCreateLabel("Thank you for checking out StatCheck, if you have any questions or comments, please contact me @ my github. :)", 40, 248, 535, 17)
$Button2 = GUICtrlCreateButton("PDog's Member Page", 232, 184, 177, 33)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetTip(-1, "Go to PDog's DarkRP reloaded forum profile page!")
GUICtrlSetCursor (-1, 0)
$Button1 = GUICtrlCreateButton("http://github.com/vort3chs", 232, 56, 177, 33)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetTip(-1, "Go to Vort3chs' GitHub")
GUISetState(@SW_SHOW)

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			GUIDelete($About_GUI)
			ExitLoop
		 Case $Button1
			ShellExecute("http://github.com/vort3chs")
		 Case $Button2
			ShellExecute("http://darkrpreloaded.com/index.php?/user/2689-pdog1111/")
	EndSwitch
   WEnd
EndFunc   ;==>AboutGUI

Func AdvSetGUI()
   $Adv_Settings = GUICreate("Advanced:", 362, 135, 192, 124)
$Label1 = GUICtrlCreateLabel("Custom timeout (ms):", 64, 24, 101, 17)
$Label2 = GUICtrlCreateLabel("The default timeout value is 5000ms (5 seconds)", 0, 56, 360, 17, $SS_CENTER)
$TimeOut = GUICtrlCreateInput("0", 168, 24, 81, 21)
$Button1 = GUICtrlCreateButton("Ok!", 160, 104, 73, 25)
GUISetState(@SW_SHOW)
While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			GUIDelete($Adv_Settings)
			ExitLoop
		 Case $Button1
			GUIDelete($Adv_Settings)
			ExitLoop
	EndSwitch
   WEnd
EndFunc   ;==>AdvSetGUI

Func HelpGUI()
   $Help_GUI = GUICreate("Help:", 443, 152, 192, 124)
$Button1 = GUICtrlCreateButton("CLICK HERE FOR HELP!!!", 8, 8, 425, 105)
GUICtrlSetFont(-1, 18, 400, 0, "MS Sans Serif")
$Button2 = GUICtrlCreateButton("Done", 184, 120, 89, 25)
GUISetState(@SW_SHOW)

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			GUIDelete($Help_GUI)
			ExitLoop
		 Case $Button1
			ShellExecute("http://darkrpreloaded.com/index.php?/topic/4215-server-checker/#entry44364")
		 Case $Button2
			GUIDelete($Help_GUI)
			ExitLoop
	EndSwitch
WEnd
EndFunc   ;==>HelpGUI

Func Button1()
   $rTimeVal = GUICtrlRead($TimeOut)
   Switch  $rTimeVal
	  Case 0
		 $rTimeValv = 0
		 If GUICtrlRead($Radio1) = $GUI_CHECKED Then GMStat()
		 If GUICtrlRead($Radio2) = $GUI_CHECKED Then TSStat()
		 If GUICtrlRead($Radio3) = $GUI_CHECKED Then WSStat()
		 If GUICtrlRead($Radio4) = $GUI_CHECKED Then CustStat()
		 If GUICtrlRead($Radio5) = $GUI_CHECKED Then CustIPStat()
	  Case <> 0
		 $rTimeValv = 1
		 If GUICtrlRead($Radio1) = $GUI_CHECKED Then GMStat()
		 If GUICtrlRead($Radio2) = $GUI_CHECKED Then TSStat()
		 If GUICtrlRead($Radio3) = $GUI_CHECKED Then WSStat()
		 If GUICtrlRead($Radio4) = $GUI_CHECKED Then CustStat()
		 If GUICtrlRead($Radio5) = $GUI_CHECKED Then CustIPStat()
   EndSwitch
EndFunc   ;==>Button1

Func GMStat()
   GUICtrlSetData($Label5,"Checking...")
   $rTimeOut = GUICtrlRead($TimeOut)
   Switch $rTimeValv
	  Case 0
		 Ping("192.223.30.11", 5000)
	  Case 1
		 Ping("192.223.30.11", $rTimeOut)
   EndSwitch

   If @error <> 0 Then
	  GUICtrlSetData($Label5,"There was an error!")
   Else
	  GUICtrlSetData($Label5,"The game server is up!")
   EndIf
EndFunc   ;==>GMStat

Func TSStat()
   GUICtrlSetData($Label5,"Checking...")
   $rTimeOut = GUICtrlRead($TimeOut)
   Ping("ts3.darkrpreloaded.com", 5000)
   Switch $rTimeValv
	  Case 0
		 Ping("ts3.darkrpreloaded.com", 5000)
	  Case 1
		 Ping("ts3.darkrpreloaded.com", $rTimeOut)
   EndSwitch
   If @error <> 0 Then
	  GUICtrlSetData($Label5,"There was an error!")
   Else
	  GUICtrlSetData($Label5,"The TeamSpeak server is up!")
   EndIf

EndFunc   ;==>TSStat

Func WSStat()
   GUICtrlSetData($Label5,"Checking...")
   $rTimeOut = GUICtrlRead($TimeOut)
   Ping("darkrpreloaded.com", 5000)
   Switch $rTimeValv
	  Case 0
		 Ping("darkrpreloaded.com", 5000)
	  Case 1
		 Ping("darkrpreloaded.com", $rTimeOut)
   EndSwitch
   If @error <> 0 Then
	  GUICtrlSetData($Label5,"There was an error!")
   Else
	  GUICtrlSetData($Label5,"The web site is up!")
   EndIf
EndFunc   ;==>WSStat

Func CustStat()
   GUICtrlSetData($Label5,"Checking...")
   $CustURL = GuiCtrlRead($Input1)
   $rTimeOut = GUICtrlRead($TimeOut)
   Switch $rTimeValv
	  Case 0
		 Ping("$CustURL", 5000)
	  Case 1
		 Ping("$CustURL", $rTimeOut)
   EndSwitch
   If @error <> 0 Then
	  GUICtrlSetData($Label5,"There was an error!")
   Else
	  GUICtrlSetData($Label5,"The webserver is up!")
   EndIf
EndFunc   ;==>CustStat

Func CustIPStat()
   GUICtrlSetData($Label5,"Checking...")
   $CustIP = GuiCtrlRead($IPAddress1)
   $rTimeOut = GUICtrlRead($TimeOut)
   Switch $rTimeValv
	  Case 0
		 Ping($CustIP, 5000)
	  Case 1
		 Ping($CustIP, $rTimeOut)
   EndSwitch
   If @error <> 0 Then
	  GUICtrlSetData($Label5,"There was an error!")
   Else
	  GUICtrlSetData($Label5,"The server responded!")
   EndIf
EndFunc   ;==>CustIPStat
