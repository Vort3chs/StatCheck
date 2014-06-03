#cs
    Created for the community of DarkRPReloaded.
    I know what you're thinking, what's the point of this. . . Well, there isn'tuch point to is, it's just a nice little            hing to have sitting around.
    This program works by a very simple concept, it pings the status of a server and gets its information.
#ce

#RequireAdmin ;;Need this to read/write/create config file in ProgramFiles.

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Date.au3>
#include <Inet.au3>

Global $CustURL, $CustIP, $rTimeOut, $TimeOut, $T, $T1, $T2, $T3, $T4, $IPValue, $IPStat, $GSStat, $WSStat, $TSStat, $URLStat, $fPos, $TimeVal, $InfoVal, $HostVal

MainGUI()

Func MainGUI()
$TimeOut = 5000

Global $Form1_1 = GUICreate("StatCheck v1.05", 619, 405, 570, 397)
Global $Label1 = GUICtrlCreateLabel("> This program checks the status of a web server, if you don't have an internet connection, or for some", 8, 24, 488, 17)
Global $Label2 = GUICtrlCreateLabel("reason something is preventing only you from getting a response from a webserver, than these results", 16, 40, 478, 17)
Global $Label3 = GUICtrlCreateLabel("don't actually reflect the status of  the server!", 16, 56, 224, 17)
Global $Radio1 = GUICtrlCreateRadio("DarkRP Reloaded game server(192.223.30.11)", 56, 120, 321, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $Radio2 = GUICtrlCreateRadio("DarkRP Reloaded TeamSpeak(ts3.darkrpreloaded.com)", 56, 144, 337, 17)
Global $Radio3 = GUICtrlCreateRadio("DarkRP Reloaded website(http://darkrpreloaded.com/)", 56, 168, 289, 17)
Global $Radio4 = GUICtrlCreateRadio("Custom URL:", 56, 192, 81, 17)
Global $Radio5 = GUICtrlCreateRadio("Custom IP address:", 56, 216, 111, 17)
Global $Label4 = GUICtrlCreateLabel("Check:", 56, 104, 38, 17)
Global $Input1 = GUICtrlCreateInput("Input custom URL", 144, 192, 121, 21)
Global $Button1 = GUICtrlCreateButton("Check Status!", 208, 272, 193, 41)
GUICtrlSetCursor (-1, 0)
Global $Button2 = GUICtrlCreateButton("Help!", 504, 0, 57, 25)
Global $Button3 = GUICtrlCreateButton("About!", 560, 0, 57, 25)
Global $Button4 = GUICtrlCreateButton("Advanced Settings", 56, 240, 121, 17)
GUICtrlSetCursor (-1, 0)
Global $Label5 = GUICtrlCreateLabel("", 199, 320, 207, 17, $SS_CENTER)
Global $Label6 = GUICtrlCreateLabel("Created by: Vort3chs", 0, 0, 103, 17)
Global $Input6 = GUICtrlCreateInput("", 167, 216, 25, 21)
Global $Input2 = GUICtrlCreateInput("", 202, 216, 25, 21)
Global $Input3 = GUICtrlCreateInput("", 239, 216, 25, 21)
Global $Input4 = GUICtrlCreateInput("", 279, 216, 25, 21)
Global $Label7 = GUICtrlCreateLabel("<--- Input custom IP", 306, 219, 96, 17)
Global $Label8 = GUICtrlCreateLabel(".", 194, 213, 7, 33)
GUICtrlSetFont(-1, 19, 400, 0, "MS Sans Serif")
Global $Label10 = GUICtrlCreateLabel(".", 268, 213, 7, 33)
GUICtrlSetFont(-1, 19, 400, 0, "MS Sans Serif")
Global $Label11 = GUICtrlCreateLabel(".", 230, 213, 6, 33)
GUICtrlSetFont(-1, 19, 400, 0, "MS Sans Serif")
Global $Label9 = GUICtrlCreateLabel("", 200, 342, 204, 17, $SS_CENTER)
Global $Button5 = GUICtrlCreateButton("More Info", 272, 360, 65, 17)
GUICtrlSetState($Button5, $GUI_HIDE)
GUICtrlSetCursor (-1, 0)
GUICtrlSetTip(-1, "More info about last ping")
Global $Button6 = GUICtrlCreateButton("Clear Labels", 272, 376, 65, 17)
GUICtrlSetState($Button6, $GUI_HIDE)
GUICtrlSetCursor (-1, 0)
Global $Button7 = GUICtrlCreateButton("Options", 448, 0, 57, 25)
GUICtrlSetCursor (-1, 0)
GUISetState(@SW_SHOW)
If FileExists(@ProgramFilesDir & "\StatCheckSettings.txt") = 0 Then
   FileWriteLine(@ProgramFilesDir & "\StatCheckSettings.txt", @DesktopDir & "\log.txt")
EndIf

While 1
	  Switch GUIGetMsg()
		 Case $GUI_EVENT_CLOSE
			ExitLoop
		 Case $Button3
			GUICtrlSetState($Button3, $GUI_DISABLE)
			AboutGUI()
			GUICtrlSetState($Button3, $GUI_ENABLE)
		 Case $Button1
			Button1()
		 Case $Button4
			$TimeOut = InputBox("Advanced:","Default timeout value = 5000ms (5 seconds)" & @CRLF & @CRLF & "Custom timeout value(ms):", "5000","",249,147)
		 Case $Button6
			ClearLabels()
		 Case $Button2
			ShellExecute("http://vortechs.site11.com/Help.html")
		 Case $Button5
			MoreInfo()
		 Case $Button7
			GUICtrlSetState($Button7, $GUI_DISABLE)
			OptionGUI()
			GUICtrlSetState($Button7, $GUI_ENABLE)
	  EndSwitch
   WEnd
EndFunc   ;==>MainGUI

Func AboutGUI()
   $About_GUI = GUICreate("About!", 620, 438, 262, 223)
$Label24 = GUICtrlCreateLabel("All code, and main GUI design by: Vort3chs", 160, 24, 310, 24)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label78 = GUICtrlCreateLabel("Original idea came from: Pdog1111", 160, 152, 313, 24, $SS_CENTER)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
$Label70 = GUICtrlCreateLabel("Thank you for checking out StatCheck, if you have any questions or comments, please contact me @ my github.", 40, 248, 535, 17)
$Button69 = GUICtrlCreateButton("PDog's Member Page", 232, 184, 177, 33)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetTip(-1, "Go to PDog's DarkRP reloaded forum profile page!")
GUICtrlSetCursor (-1, 0)
$Button68 = GUICtrlCreateButton("http://github.com/vort3chs", 232, 56, 177, 33)
GUICtrlSetColor(-1, 0x0000FF)
GUICtrlSetTip(-1, "Go to Vort3chs' GitHub")
GUISetState()

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			GUIDelete($About_GUI)
			ExitLoop
		 Case $Button68
			ShellExecute("http://github.com/vort3chs")
		 Case $Button69
			ShellExecute("http://darkrpreloaded.com/index.php?/user/2689-pdog1111/")
	EndSwitch
   WEnd
EndFunc   ;==>AboutGUI

;;Func AdvSetGUI()
;;   $Adv_Settings = GUICreate("Advanced:", 362, 135, 192, 124)
;;$Label1 = GUICtrlCreateLabel("Custom timeout (ms):", 64, 24, 101, 17)
;;$Label2 = GUICtrlCreateLabel("The default timeout value is 5000ms (5 seconds)", 0, 56, 360, 17, $SS_CENTER)
;;$TimeOut = GUICtrlCreateInput("0", 168, 24, 81, 21)
;;$Button1 = GUICtrlCreateButton("Ok!", 160, 104, 73, 25)
;;GUISetState()
;;While 1
;;	Switch GUIGetMsg()
;;		Case $GUI_EVENT_CLOSE
;;			GUIDelete($Adv_Settings)
;;			ExitLoop
;;		 Case $Button1
;;			GUIDelete($Adv_Settings)
;;			ExitLoop
;;	EndSwitch
;;   WEnd
;;EndFunc   ;==>AdvSetGUI GONE FOR NOW, KIND OF POINTLESS!

Func OptionGUI()
   Global $Option_GUI = GUICreate("Options", 588, 155, 516, 612)
Global $Input1766 = GUICtrlCreateInput("", 104, 70, 433, 21)
Global $Label198798 = GUICtrlCreateLabel("Log File Directory:", 16, 72, 87, 17)
Global $Label11111 = GUICtrlCreateLabel("Default log file directory is the desktop, to change this enter a new directory and hit 'apply'", 77, 30, 431, 17)
Global $Button1754 = GUICtrlCreateButton("Apply", 191, 116, 199, 24)
GUISetState(@SW_SHOW)

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			GUIDelete($Option_GUI)
			ExitLoop
		 Case $Button1754
			$SetDir = GUICtrlRead($Input1766)
			FileDelete(@ProgramFilesDir & "\StatCheckSettings.txt")
			FileWriteLine(@ProgramFilesDir & "\StatCheckSettings.txt", $SetDir)
	EndSwitch
WEnd
EndFunc

Func Button1()
   $InfoVal = 0
   GUICtrlSetState($Button6, $GUI_SHOW)
   GUICtrlSetColor($Label5, 0x000000)
   GUICtrlSetColor($Label9, 0x000000)
   GUICtrlSetData($Label9,"")
   GUICtrlSetData($Label5,"")
   $T = "."
   $T2 = GuiCtrlRead($Input6)
   $T3 = GuiCtrlRead($Input2)
   $T4 = GuiCtrlRead($Input3)
   $T5 = GuiCtrlRead($Input4)

   $IPValue = $T2 & $T & $T3 & $T & $T4 & $T & $T5

   If $TimeOut = 5000 Then
		 $TimeVal = 0
		 If GUICtrlRead($Radio1) = $GUI_CHECKED Then GMStat()
		 If GUICtrlRead($Radio2) = $GUI_CHECKED Then TSStat()
		 If GUICtrlRead($Radio3) = $GUI_CHECKED Then WSStat()
		 If GUICtrlRead($Radio4) = $GUI_CHECKED Then CustStat()
		 If GUICtrlRead($Radio5) = $GUI_CHECKED Then CustIPStat()
   EndIf
   If $TimeOut <> 5000 Then
		 $TimeVal = 1
		 If GUICtrlRead($Radio1) = $GUI_CHECKED Then GMStat()
		 If GUICtrlRead($Radio2) = $GUI_CHECKED Then TSStat()
		 If GUICtrlRead($Radio3) = $GUI_CHECKED Then WSStat()
		 If GUICtrlRead($Radio4) = $GUI_CHECKED Then CustStat()
		 If GUICtrlRead($Radio5) = $GUI_CHECKED Then CustIPStat()
   EndIf
EndFunc   ;==>Button1

Func GMStat()
   $InfoVal = 1
   GUICtrlSetData($Label5,"Checking...")
   Switch $TimeVal
	  Case 0
		 $GSStat = Ping("192.223.30.11", 5000)
	  Case 1
		 $GSStat = Ping("192.223.30.11", $TimeOut)
   EndSwitch
   If @error <> 0 Then
	  Switch @error
		 Case 1
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Host is offline!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogGSFalse()
		 Case 2
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Host is unreachable!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogGSFalse()
		 Case 3
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Bad destination!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogGSFalse()
		 Case 4
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Unknown Error Occured!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogGSFalse()
	  EndSwitch
   Else
	  GUICtrlSetColor($Label5, 0x00FF00)
	  GUICtrlSetColor($Label9, 0x00FF00)
	  GUICtrlSetData($Label5,"The game server is up!")
	  GUICtrlSetData($Label9,"Response time(ms): " & $GSStat)
	  GUICtrlSetState($Button5, $GUI_SHOW)
	  LogGSTrue()
   EndIf
EndFunc   ;==>GMStat

Func TSStat()
   $InfoVal = 2
   GUICtrlSetData($Label5,"Checking...")
   Switch $TimeVal
	  Case 0
		 $TSStat = Ping("ts3.darkrpreloaded.com", 5000)
	  Case 1
		 $TSStat = Ping("ts3.darkrpreloaded.com", $TimeOut)
   EndSwitch
   If @error <> 0 Then
	  Switch @error
		 Case 1
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Host is offline!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogTSFalse()
		 Case 2
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Host is unreachable!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogTSFalse()
		 Case 3
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Bad destination!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogTSFalse()
		 Case 4
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Unknown Error Occured!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogTSFalse()
	  EndSwitch
   Else
	  GUICtrlSetColor($Label5, 0x00FF00)
	  GUICtrlSetColor($Label9, 0x00FF00)
	  GUICtrlSetData($Label5,"The TeamSpeak server is up!")
	  GUICtrlSetData($Label9,"Response time(ms): " & $TSStat)
	  GUICtrlSetState($Button5, $GUI_SHOW)
	  LogTSTrue()
   EndIf
EndFunc   ;==>TSStat

Func WSStat()
   $InfoVal = 3
   GUICtrlSetData($Label5,"Checking...")
   Switch $TimeVal
	  Case 0
		 $WSStat = Ping("darkrpreloaded.com", 5000)
	  Case 1
		 $WSStat = Ping("darkrpreloaded.com", $TimeOut)
   EndSwitch
   If @error <> 0 Then
	  Switch @error
		 Case 1
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Host is offline!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogWSFalse()
		 Case 2
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Host is unreachable!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogWSFalse()
		 Case 3
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Bad destination!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogWSFalse()
		 Case 4
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Unknown Error Occured!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogWSFalse()
	  EndSwitch
   Else
	  GUICtrlSetColor($Label5, 0x00FF00)
	  GUICtrlSetColor($Label9, 0x00FF00)
	  GUICtrlSetData($Label5,"The website is up!")
	  GUICtrlSetData($Label9,"Response time(ms): " & $WSStat)
	  GUICtrlSetState($Button5, $GUI_SHOW)
	  LogWSTrue()
   EndIf
EndFunc   ;==>WSStat

Func CustStat()
   $InfoVal = 4
   GUICtrlSetData($Label5,"Checking...")
   $CustURL = GuiCtrlRead($Input1)
   If $CustURL = "Input custom URL" Then $CustURL = "NULL VALUE"
   Switch $TimeVal
	  Case 0
		 $URLStat = Ping($CustURL, 5000)
	  Case 1
		 $URLStat = Ping($CustURL, $TimeOut)
   EndSwitch
   If @error <> 0 Then
	  Switch @error
		 Case 1
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Host is offline!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogURLFalse()
		 Case 2
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Host is unreachable!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogURLFalse()
		 Case 3
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Bad destination!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogURLFalse()
		 Case 4
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Unknown Error Occured!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogURLFalse()
	  EndSwitch
   Else
	  GUICtrlSetColor($Label5, 0x00FF00)
	  GUICtrlSetColor($Label9, 0x00FF00)
	  GUICtrlSetData($Label5,"The webserver responded!")
	  GUICtrlSetData($Label9,"Response time(ms): " & $URLStat)
	  GUICtrlSetState($Button5, $GUI_SHOW)
	  LogURLTrue()
   EndIf
EndFunc   ;==>CustStat

Func CustIPStat()
   $InfoVal = 5
   GUICtrlSetData($Label5,"Checking...")
   If $IPValue = "..." Then $IPValue = "NULL VALUE"
   Switch $TimeVal
	  Case 0
		 $IPStat = Ping($IPValue, 5000)
	  Case 1
		 $IPStat = Ping($IPValue, $TimeOut)
   EndSwitch
   If @error <> 0 Then
	  Switch @error
		 Case 1
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Host is offline!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogIPFalse()
		 Case 2
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Host is unreachable!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogIPFalse()
		 Case 3
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Bad destination!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogIPFalse()
		 Case 4
			GUICtrlSetColor($Label9, 0xFF0000)
			GUICtrlSetColor($Label5, 0xFF0000)
			GUICtrlSetData($Label5,"ERROR: Unknown Error Occured!")
			GUICtrlSetData($Label9,"Response time(ms): ERROR!^")
			LogIPFalse()
	  EndSwitch
   Else
	  GUICtrlSetColor($Label5, 0x00FF00)
	  GUICtrlSetColor($Label9, 0x00FF00)
	  GUICtrlSetData($Label5,"The server responded!")
	  GUICtrlSetData($Label9,"Response time(ms): " & $IPStat)
	  GUICtrlSetState($Button5, $GUI_SHOW)
	  LogIPTrue()
   EndIf
EndFunc   ;==>CustIPStat

Func LogGSTrue()
   $LogDir = FileReadLine(@ProgramFilesDir & "\StatCheckSettings.txt",1)
   FileWriteLine($LogDir, "You checked the status of the DarkRPReloaded game server @ " & _Now() & "(System Time) a response from the server was recieved in " & $GSStat & "ms!" & @CRLF & @CRLF)
EndFunc

Func LogGSFalse()
   $LogDir = FileReadLine(@ProgramFilesDir & "\StatCheckSettings.txt",1)
   FileWriteLine($LogDir, "You checked the status of the DarkRPReloaded game server @ " & _Now() & "(System Time) a response from the server was NOT recieved the server is probably down!" & @CRLF & @CRLF)
EndFunc

Func LogTSTrue()
   $LogDir = FileReadLine(@ProgramFilesDir & "\StatCheckSettings.txt",1)
   FileWriteLine($LogDir, "You checked the status of the DarkRPReloaded TeamSpeak server @ " & _Now() & "(System Time) a response from the server was recieved in " & $TSStat & "ms!" & @CRLF & @CRLF)
EndFunc

Func LogTSFalse()
   $LogDir = FileReadLine(@ProgramFilesDir & "\StatCheckSettings.txt",1)
   FileWriteLine($LogDir, "You checked the status of the DarkRPReloaded TeamSpeak server @ " & _Now() & "(System Time) a response from the server was NOT recieved, the server is probably down!" & @CRLF & @CRLF)
EndFunc

Func LogWSTrue()
   $LogDir = FileReadLine(@ProgramFilesDir & "\StatCheckSettings.txt",1)
   FileWriteLine($LogDir, "You checked the status of the DarkRPReloaded website @ " & _Now() & "(System Time) a response from the server was recieved in " & $WSStat & "ms!" & @CRLF & @CRLF)
EndFunc

Func LogWSFalse()
   $LogDir = FileReadLine(@ProgramFilesDir & "\StatCheckSettings.txt",1)
   FileWriteLine($LogDir, "You checked the status of the DarkRPReloaded website @ " & _Now() & "(System Time) a response from the server was NOT recieved, the server is probably down!" & @CRLF & @CRLF)
EndFunc

Func LogURLTrue()
   $LogDir = FileReadLine(@ProgramFilesDir & "\StatCheckSettings.txt",1)
   FileWriteLine($LogDir, "You checked the status of " & $CustURL & " @ " & _Now() & "(System Time) a response from the server was recieved in " & $URLStat & "ms!" & @CRLF & @CRLF)
EndFunc

Func LogURLFalse()
   $LogDir = FileReadLine(@ProgramFilesDir & "\StatCheckSettings.txt",1)
   FileWriteLine($LogDir, "You checked the status of " & $CustURL & " @ " & _Now() & "(System Time) a response from the server was NOT recieved, the server is probably down!" & @CRLF & @CRLF)
EndFunc

Func LogIPTrue()
   $LogDir = FileReadLine(@ProgramFilesDir & "\StatCheckSettings.txt",1)
   FileWriteLine($LogDir, "You checked the status of " & $IPValue & " @ " & _Now() & "(System Time) a response from the server was recieved in " & $IPStat & "ms!" & @CRLF & @CRLF)
EndFunc

Func LogIPFalse()
   $LogDir = FileReadLine(@ProgramFilesDir & "\StatCheckSettings.txt",1)
   FileWriteLine($LogDir, "You checked the status of " & $IPValue & " @ " & _Now() & "(System Time) a response from the server was NOT recieved, the server is probably down!" & @CRLF & @CRLF)
EndFunc

Func ClearLabels()
   			GUICtrlSetData($Label5,"")
			GUICtrlSetData($Label9,"")
			GUICtrlSetState($Button6, $GUI_HIDE)
			GUICtrlSetState($Button5, $GUI_HIDE)
EndFunc

Func MoreInfo()
   TCPStartup()
   Switch $InfoVal
	  Case 1 ;;GMStat()
	     $HostVal = _TCPIpToName("192.223.30.11")
		 MsgBox(0,"More Info!", "Round-trip time: " & $GSStat & "ms" & @CRLF & @CRLF & "Hostname: " & $HostVal & @CRLF & @CRLF & "IP Address: 192.223.30.11")
	  Case 2 ;;TSStat()
	     $HostVal = TCPNameToIp("ts3.darkrpreloaded.com")
		 MsgBox(0,"More Info!", "Round-trip time: " & $TSStat & "ms" & @CRLF & @CRLF & "Hostname: " & _TCPIpToName("216.52.148.11") & @CRLF & @CRLF & "IP Address: " & $HostVal)
	  Case 3 ;;WSStat()
	     $HostVal = TCPNameToIp("darkrpreloaded.com")
		 MsgBox(0,"More Info!", "Round-trip time: " & $WSStat & "ms" & @CRLF & @CRLF & "Hostname: " & _TCPIpToName("208.146.35.22") & @CRLF & @CRLF & "IP Address: " & $HostVal)
	  Case 4 ;;CustStat()
	     $HostVal = TCPNameToIp($CustURL)
		 MsgBox(0,"More Info!", "Round-trip time: " & $URLStat & "ms" & @CRLF & @CRLF & "Hostname: " & _TCPIpToName($HostVal) & @CRLF & @CRLF & "IP Address: " & $HostVal)
	  Case 5 ;;CustIPStat()
	     $HostVal = _TCPIpToName($IPValue)
		 MsgBox(0,"More Info!", "Round-trip time: " & $IPStat & "ms" & @CRLF & @CRLF & "Hostname: " & _TCPIpToName($IPValue) & @CRLF & @CRLF & "IP Address: " & $IPValue)
	  EndSwitch
EndFunc
