Scriptname Placeable_ItemAdjustmentScript extends ObjectReference

;/ BellCube's Changes & Notes

Formatted the whole thing! INDENTING FOR EVERYONE!!!

Used ASCII art as section header comments
(generate 'em at https://patorjk.com/software/taag/#p=display&h=0&v=0&f=Big%20Money-nw&t=%48%65%6c%6c%6f%20%66%72%6f%6d%20%42%65%6c%6c%43%75%62%65%21)

Removed the unused "abFade" and "abFadeOut" variables strewn throughout the code

/;


Actor Property PlayerREf Auto
GlobalVariable Property Placeable_Positioner_SKSE_Global Auto
;GlobalVariable Property Placeable_AutoLevel_Disabled Auto ; Defualt = (1.0)
Message Property MenuUi Auto
Message Property MenuUi_SKSE Auto
Message Property MenuUi_MakeStatic Auto
Message Property MenuUi_MakeStatic_SKSE Auto
Message Property MenuUi_Options Auto
Message Property MenuUi_Options_SKSE Auto
Message Property  MenuUi_Options_PositionerMenu Auto
Message Property  MenuUi_Options_PositionerMenu_SKSE Auto
Message Property Z_Ui Auto
Message Property Y_Ui Auto
Message Property X_Ui Auto
Message Property Rotate_Ui Auto
Message Property Z_Ui_SKSE Auto
Message Property Y_Ui_SKSE Auto
Message Property X_Ui_SKSE Auto
Message Property Rotate_Ui_SKSE Auto
MiscObject property MiscObj auto
Static Property StaticDummy Auto
Activator Property My_Activator_Static Auto
Spell Property Placeable_SKSE_Positioner_Toggle Auto
;Spell Property Placeable_Auto_Level_Object_Global_Toggle_Spell Auto


FormList Placeable_A_DeleteAll

;BELL: I saw you called Game.GetPayer() when picking up the item. Normaly I would've changed that to "Actor PlayerREF"
;      However, If you think about it logically, your Game.GetPlayer() is only called once per instance,
;      meaning that filling the PlayerREF variable OnInit() would take unnecessary processing time.


; Auto-Leveling System
Spell Placeable_Auto_Level_Object_Global_Toggle_Spell
GlobalVariable Placeable_AutoLevel_Disabled

Event OnInit()

    ;/ Auto-Level Toggle Spell /; Placeable_Auto_Level_Object_Global_Toggle_Spell = Game.GetFormFromFile(0x00DE456D, "LvxMagick - Skyrim - Settlement Builder.Esm") as Spell

    ;/   Delete All  Fomlist   /; Placeable_A_DeleteAll = Game.GetFormFromFile(0x00E26327, "LvxMagick - Skyrim - Settlement Builder.Esp") as Formlist

    ;/   Auto-Level Objects?   /; Placeable_AutoLevel_Disabled = Game.GetFormFromFile(0x00DD0161, "LvxMagick - Skyrim - Settlement Builder.Esm") as GlobalVariable
    ;debug.Notification(Placeable_AutoLevel_Disabled+": "+Placeable_AutoLevel_Disabled.GetValue())

    ;======================================================================================================================

    If (Placeable_AutoLevel_Disabled.GetValueInt() == 0)
        ;debug.Notification("Object Auto-Level Enabled")
        GoToState("Auto_Level")
    Else
        ;debug.Notification("Object Auto-Level Disabled")
    EndIf
EndEvent

State Auto_Level
    Event OnBeginState()
        If (Placeable_AutoLevel_Disabled.GetValue() == 1)
            ;debug.Notification("Object Auto-Leveled OFF")
        Else
            Self.SetAngle(0.0, 0.0, Self.GetAngleZ()) ; Default
            ;debug.Notification("Object Auto-Level System Working")
        EndIf
    EndEvent
EndState


Event OnActivate(ObjectReference akActionRef)

    ; BELL: Using an AND compareop (comparison operator) gives you nice, simple-to-understand IFs.
    If SKSE.GetVersion() > 0 && (Placeable_Positioner_SKSE_Global.GetValue() == 0.0)
        MenuUi_SKSE() ;use SKSE menu
        return
    else
        Menu() ;use regular menu
    EndIf
Endevent

; BELL: I like to use ASCII art because it's easy to see from a mile away.
;       Plus, when using VSCode (including GitHub.dev), it's readable on the minimap.


;/$\      $$\           $$\                 $$\      $$\
 $$$\    $$$ |          \__|                $$$\    $$$ |
 $$$$\  $$$$ | $$$$$$\  $$\ $$$$$$$\        $$$$\  $$$$ | $$$$$$\  $$$$$$$\  $$\   $$\
 $$\$$\$$ $$ | \____$$\ $$ |$$  __$$\       $$\$$\$$ $$ |$$  __$$\ $$  __$$\ $$ |  $$ |
 $$ \$$$  $$ | $$$$$$$ |$$ |$$ |  $$ |      $$ \$$$  $$ |$$$$$$$$ |$$ |  $$ |$$ |  $$ |
 $$ |\$  /$$ |$$  __$$ |$$ |$$ |  $$ |      $$ |\$  /$$ |$$   ____|$$ |  $$ |$$ |  $$ |
 $$ | \_/ $$ |\$$$$$$$ |$$ |$$ |  $$ |      $$ | \_/ $$ |\$$$$$$$\ $$ |  $$ |\$$$$$$  |
 \__|     \__| \_______|\__|\__|  \__|      \__|     \__| \_______|\__|  \__| \______/;


; BELL: There's no need to define aiButton as a Function parameter.
;       Instead, I defined it as a variable.
Function Menu()
    ;Debug.Notification("Legacy Positioner UI Active")

    Int aiButton = MenuUi.show()

    If     aiButton == 1
        Z_Menu()
    ElseIf aiButton == 2
        Y_Menu()
    ElseIf aiButton == 3
        X_Menu()

    ElseIf aiButton == 4
        Rotate_Menu()
        ;Debug.Notification("Object is facing "+ GetAngleZ()+" Degrees")
        Utility.wait(0.1)

    ElseIf aiButton == 5
        Auto_Level_Button()
        Debug.MessageBox("Level Button")

    ElseIf aiButton == 6
        Self.Disable(True)
        PlayerREF.addItem(MiscObj)
        Delete()

    ElseIf aiButton == 7   ; Options
        MenuUi_Options()

    ElseIf aiButton == 8
        MenuUi_MakeStatic()

    EndIf
EndFunction


;/$$$$$$\              $$\                       $$\                                      $$\
 $$  __$$\             $$ |                      $$ |                                     $$ |
 $$ /  $$ |$$\   $$\ $$$$$$\    $$$$$$\          $$ |       $$$$$$\  $$\    $$\  $$$$$$\  $$ |
 $$$$$$$$ |$$ |  $$ |\_$$  _|  $$  __$$\ $$$$$$\ $$ |      $$  __$$\ \$$\  $$  |$$  __$$\ $$ |
 $$  __$$ |$$ |  $$ |  $$ |    $$ /  $$ |\______|$$ |      $$$$$$$$ | \$$\$$  / $$$$$$$$ |$$ |
 $$ |  $$ |$$ |  $$ |  $$ |$$\ $$ |  $$ |        $$ |      $$   ____|  \$$$  /  $$   ____|$$ |
 $$ |  $$ |\$$$$$$  |  \$$$$  |\$$$$$$  |        $$$$$$$$\ \$$$$$$$\    \$  /   \$$$$$$$\ $$ |
 \__|  \__| \______/    \____/  \______/         \________| \_______|    \_/     \_______|\__|



$$$$$$$\              $$\       $$\
$$  __$$\             $$ |      $$ |
$$ |  $$ |$$\   $$\ $$$$$$\   $$$$$$\    $$$$$$\  $$$$$$$\
$$$$$$$\ |$$ |  $$ |\_$$  _|  \_$$  _|  $$  __$$\ $$  __$$\
$$  __$$\ $$ |  $$ |  $$ |      $$ |    $$ /  $$ |$$ |  $$ |
$$ |  $$ |$$ |  $$ |  $$ |$$\   $$ |$$\ $$ |  $$ |$$ |  $$ |
$$$$$$$  |\$$$$$$  |  \$$$$  |  \$$$$  |\$$$$$$  |$$ |  $$ |
\_______/  \______/    \____/    \____/  \______/ \__|  \_/;


    Function Auto_Level_Button()

    If (Placeable_AutoLevel_Disabled.GetValue() == 1)
    Self.SetAngle(0.0, 0.0, Self.GetAngleZ())


    Else

    debug.Messagebox("Object Auto-Level System Working - No need to use button.. You can turn off Automated Leveling Objects in the Options - Campfire Unleashed Spells.. Then this button will be active again")


    EndIf
    EndFunction




;/$$$$$$\         $$\      $$\
 \____$$ |        $$$\    $$$ |
    $$  /         $$$$\  $$$$ | $$$$$$\  $$$$$$$\  $$\   $$\
   $$  /  $$$$$$\ $$\$$\$$ $$ |$$  __$$\ $$  __$$\ $$ |  $$ |
  $$  /   \______|$$ \$$$  $$ |$$$$$$$$ |$$ |  $$ |$$ |  $$ |
 $$  /            $$ |\$  /$$ |$$   ____|$$ |  $$ |$$ |  $$ |
$$$$$$$$\         $$ | \_/ $$ |\$$$$$$$\ $$ |  $$ |\$$$$$$  |
\________|        \__|     \__| \_______|\__|  \__| \______/;


Function Z_Menu()
    Int aiButton

    While aiButton ; BELL: Using an Int as a condition checks If it isn't 0
        aiButton =  Z_Ui.show()

        If aiButton == 0 ; Exit Button
            Menu()
            return
        EndIf

        Self.DisableNoWait()
        If aiButton == 1
            SetPosition(X, Y, Z - 50)
        ElseIf aiButton == 2
            SetPosition(X, Y, Z - 30)
        ElseIf aiButton == 3
            SetPosition(X, Y, Z - 10)
        ElseIf aiButton == 4
            SetPosition(X, Y, Z - 1)
        ElseIf aiButton == 5
            SetPosition(X, Y, Z + 1)
        ElseIf aiButton == 6
            SetPosition(X, Y, Z + 10)
        ElseIf aiButton == 7
            SetPosition(X, Y, Z + 30)
        ElseIf aiButton == 8
            SetPosition(X, Y, Z + 50)
        EndIf
        Self.EnableNoWait()

    EndWhile
EndFunction


;/\     /$\         $$\      $$\
\$$\   /$  |        $$$\    $$$ |
 \$$\_/$  /         $$$$\  $$$$ | $$$$$$\  $$$$$$$\  $$\   $$\
  \$$$$  /  $$$$$$\ $$\$$\$$ $$ |$$  __$$\ $$  __$$\ $$ |  $$ |
   \$$  /   \______|$$ \$$$  $$ |$$$$$$$$ |$$ |  $$ |$$ |  $$ |
    $$ |            $$ |\$  /$$ |$$   ____|$$ |  $$ |$$ |  $$ |
    $$ |            $$ | \_/ $$ |\$$$$$$$\ $$ |  $$ |\$$$$$$  |
    \__|            \__|     \__| \_______|\__|  \__| \______/;


Function Y_Menu()
    Int aiButton

    While aiButton ; BELL: Using an Int as a condition checks If it isn't 0
        aiButton =  Y_Ui.show()

        If aiButton == 0 ; Exit Button
            Menu()
            return
        EndIf

        Self.DisableNoWait()
        If aiButton == 1
            SetPosition(X, Y - 50, Z)
        ElseIf aiButton == 2
            SetPosition(X, Y - 30, Z)
        ElseIf aiButton == 3
            SetPosition(X, Y - 10, Z)
        ElseIf aiButton == 4
            SetPosition(X, Y - 1, Z)
        ElseIf aiButton == 5
            SetPosition(X, Y + 1, Z)
        ElseIf aiButton == 6
            SetPosition(X, Y + 10, Z)
        ElseIf aiButton == 7
            SetPosition(X, Y + 30, Z)
        ElseIf aiButton == 8
            SetPosition(X, Y + 50, Z)
        EndIf
        Self.EnableNoWait()

    EndWhile
EndFunction

;/\   /-\         $$\      $$\
$$ |  $$ |        $$$\    $$$ |
\$$\ $$  |        $$$$\  $$$$ | $$$$$$\  $$$$$$$\  $$\   $$\
 \$$$$  / $$$$$$\ $$\$$\$$ $$ |$$  __$$\ $$  __$$\ $$ |  $$ |
 $$  $$<  \______|$$ \$$$  $$ |$$$$$$$$ |$$ |  $$ |$$ |  $$ |
$$  /\$$\         $$ |\$  /$$ |$$   ____|$$ |  $$ |$$ |  $$ |
$$ /  $$ |        $$ | \_/ $$ |\$$$$$$$\ $$ |  $$ |\$$$$$$  |
\__|  \__|        \__|     \__| \_______|\__|  \__| \______/;


Function X_Menu()
    Int aiButton

    While aiButton ; BELL: Using an Int as a condition checks If it isn't 0
        aiButton =  X_Ui.show()

        If aiButton == 0 ; Exit Button
            Menu()
            return
        EndIf

        If aiButton == 1
            SetPosition(X - 50, Y, Z)
        ElseIf aiButton == 2
            SetPosition(X - 30, Y, Z)
        ElseIf aiButton == 3
            SetPosition(X - 10, Y, Z)
        ElseIf aiButton == 4
            SetPosition(X - 1, Y, Z)
        ElseIf aiButton == 5
            SetPosition(X + 1, Y, Z)
        ElseIf aiButton == 6
            SetPosition(X + 10, Y, Z)
        ElseIf aiButton == 7
            SetPosition(X + 30, Y, Z)
        ElseIf aiButton == 8
            SetPosition(X + 50, Y, Z)
        EndIf
        Self.EnableNoWait()

    EndWhile
EndFunction

;/$$$$$$\              $$\                 $$\                     $$\      $$\
 $$  __$$\             $$ |                $$ |                    $$$\    $$$ |
 $$ |  $$ | $$$$$$\  $$$$$$\    $$$$$$\  $$$$$$\    $$$$$$\        $$$$\  $$$$ | $$$$$$\  $$$$$$$\  $$\   $$\
 $$$$$$$  |$$  __$$\ \_$$  _|   \____$$\ \_$$  _|  $$  __$$\       $$\$$\$$ $$ |$$  __$$\ $$  __$$\ $$ |  $$ |
 $$  __$$< $$ /  $$ |  $$ |     $$$$$$$ |  $$ |    $$$$$$$$ |      $$ \$$$  $$ |$$$$$$$$ |$$ |  $$ |$$ |  $$ |
 $$ |  $$ |$$ |  $$ |  $$ |$$\ $$  __$$ |  $$ |$$\ $$   ____|      $$ |\$  /$$ |$$   ____|$$ |  $$ |$$ |  $$ |
 $$ |  $$ |\$$$$$$  |  \$$$$  |\$$$$$$$ |  \$$$$  |\$$$$$$$\       $$ | \_/ $$ |\$$$$$$$\ $$ |  $$ |\$$$$$$  |
 \__|  \__| \______/    \____/  \_______|   \____/  \_______|      \__|     \__| \_______|\__|  \__| \______/;


Function Rotate_Menu()
    While abMenu
        Int aiButton =  Rotate_Ui.show()
        If aiButton == 0 ; Exit Button
            Menu()
            return
        EndIf

        Self.DisableNoWait()
        If aiButton == 1
            Self.SetAngle(0.0, 0.0, self.GetAngleZ() - 50.0)
        ElseIf aiButton == 2
            Self.SetAngle(0.0, 0.0, self.GetAngleZ() - 30.0)
        ElseIf aiButton == 3
            Self.SetAngle(0.0, 0.0, self.GetAngleZ() - 10.0)
        ElseIf aiButton == 4
            Self.SetAngle(0.0, 0.0, self.GetAngleZ() - 1.0)
        ElseIf aiButton == 5
            Self.SetAngle(0.0, 0.0, self.GetAngleZ() + 1.0)
        ElseIf aiButton == 6
            Self.SetAngle(0.0, 0.0, self.GetAngleZ() + 10.0)
        ElseIf aiButton == 7
            Self.SetAngle(0.0, 0.0, self.GetAngleZ() + 30.0)
        ElseIf aiButton == 8
            Self.SetAngle(0.0, 0.0, self.GetAngleZ() + 50.0)
        EndIf

        Self.EnableNoWait()
    EndWhile
EndFunction

;/$$$$$$\              $$\     $$\
 $$  __$$\             $$ |    \__|
 $$ /  $$ | $$$$$$\  $$$$$$\   $$\  $$$$$$\  $$$$$$$\   $$$$$$$\
 $$ |  $$ |$$  __$$\ \_$$  _|  $$ |$$  __$$\ $$  __$$\ $$  _____|
 $$ |  $$ |$$ /  $$ |  $$ |    $$ |$$ /  $$ |$$ |  $$ |\$$$$$$\
 $$ |  $$ |$$ |  $$ |  $$ |$$\ $$ |$$ |  $$ |$$ |  $$ | \____$$\
  $$$$$$  |$$$$$$$  |  \$$$$  |$$ |\$$$$$$  |$$ |  $$ |$$$$$$$  |
  \______/ $$  ____/    \____/ \__| \______/ \__|  \__|\_______/
           $$ |
           $$ |
           \__/;

Function MenuUi_Options()
    Int aiButton =  MenuUi_Options.show()

    If aiButton == 0
        Menu()
    ElseIf aiButton == 1
        MenuUi_Options_PositionerMenu()
    EndIf
EndFunction

;BELL: Assuming the menu's only options are 0 and 1, you can use a much more elegant system, like this one.
;/
Function MenuUi_Options()

    Int aiButton =  MenuUi_Options.show()

    If aiButton == 1
        MenuUi_Options_PositionerMenu()
        Return
    Else
        Menu()
    EndIf
EndFunction
/;


Function MenuUi_Options_PositionerMenu() ; Show Option Menu
    Int aiButton= MenuUi_Options_PositionerMenu.Show()

    If aibutton == 0
        MenuUi_Options()

    ElseIf aiButton== 1
        Placeable_SKSE_Positioner_Toggle.cast(PlayerRef)

    ElseIf aiButton == 2
        Placeable_Auto_Level_Object_Global_Toggle_Spell.Cast(PlayerRef)

    ; BELL: No use wasing the processing power to evaluate that ElseIF. If it does nothing, you can make it a comment instead.
    ; ElseIf aiButton == 3, do nothing

    EndIf

EndFunction


;/$$$$$\    $$\                 $$\     $$\                 $$\      $$\
$$  __$$\   $$ |                $$ |    \__|                $$$\    $$$ |
$$ /  \__|$$$$$$\    $$$$$$\  $$$$$$\   $$\  $$$$$$$\       $$$$\  $$$$ | $$$$$$\  $$$$$$$\  $$\   $$\
\$$$$$$\  \_$$  _|   \____$$\ \_$$  _|  $$ |$$  _____|      $$\$$\$$ $$ |$$  __$$\ $$  __$$\ $$ |  $$ |
 \____$$\   $$ |     $$$$$$$ |  $$ |    $$ |$$ /            $$ \$$$  $$ |$$$$$$$$ |$$ |  $$ |$$ |  $$ |
$$\   $$ |  $$ |$$\ $$  __$$ |  $$ |$$\ $$ |$$ |            $$ |\$  /$$ |$$   ____|$$ |  $$ |$$ |  $$ |
\$$$$$$  |  \$$$$  |\$$$$$$$ |  \$$$$  |$$ |\$$$$$$$\       $$ | \_/ $$ |\$$$$$$$\ $$ |  $$ |\$$$$$$  |
 \______/    \____/  \_______|   \____/ \__| \_______|      \__|     \__| \_______|\__|  \__| \______/;

; BELL: I removed the SKSE variant since no SKSE-exclusive functions exist in the SKSE version.

Function MenuUi_MakeStatic()
    Int aiButton = MenuUi_MakeStatic.show()

    ; BELL: Early Returns make code easier to parse
    If aiButton != 1
        return
    EndIf

    ;BELL: DisableNoWait() and Disable() have the same Function, only the "NoWait" one doesn't wait for the disable to finish.
    ;      There are quite a few of these in Papyrus.

    ; Start fading to give the illusion
    Self.DisableNoWait(True)

    Placeable_A_DeleteAll.AddForm(PlaceAtMe(StaticDummy)) ; Creates a StaticDummy and adds that to the Delete All list.
    ;/ Human-readable:
        ObjectReference newStatic = PlaceAtMe(StaticDummy)
        Placeable_A_DeleteAll.AddForm(newStatic)
    /;

    ;BELL: Fading takes a While, so we should wait for it to finish before deleting outselves
    ;      While technically takes slightly longer, it is near-impossible to replicate that delay otherwise
    ;      because it is rather dependant on framerate, which can vary greatly from setup-to-setup and even cell-to-cell
    ;      Therefore, duplicating the Function call and waiting for it to finish is the ideal solution
    Self.Disable(True)
    Sent.Delete()

EndFunction

;/$$$$$\  $$\   $$\  $$$$$$\  $$$$$$$$\       $$\      $$\           $$\
$$  __$$\ $$ | $$  |$$  __$$\ $$  _____|      $$$\    $$$ |          \__|
$$ /  \__|$$ |$$  / $$ /  \__|$$ |            $$$$\  $$$$ | $$$$$$\  $$\ $$$$$$$\
\$$$$$$\  $$$$$  /  \$$$$$$\  $$$$$\          $$\$$\$$ $$ | \____$$\ $$ |$$  __$$\
 \____$$\ $$  $$<    \____$$\ $$  __|         $$ \$$$  $$ | $$$$$$$ |$$ |$$ |  $$ |
$$\   $$ |$$ |\$$\  $$\   $$ |$$ |            $$ |\$  /$$ |$$  __$$ |$$ |$$ |  $$ |
\$$$$$$  |$$ | \$$\ \$$$$$$  |$$$$$$$$\       $$ | \_/ $$ |\$$$$$$$ |$$ |$$ |  $$ |
 \______/ \__|  \__| \______/ \________|      \__|     \__| \_______|\__|\__|  \__/;



Function MenuUi_SKSE()
   Int aiButton =  MenuUi_SKSE.show()


    ;Debug.Notification("SKSE Positioner Active")

    ;/    Move  Z   /; If aiButton == 1
        Z_Menu_SKSE()
    ;/    Move  Y   /; ElseIf aiButton == 2
        Y_Menu_SKSE()
    ;/    Move  X   /; ElseIf aiButton == 3
        X_Menu_SKSE()

    ;/    Rotate    /; ElseIf aiButton == 4
        Rotate_Menu_SKSE()
        ;Debug.Notification("Object is facing "+ GetAngleZ()+" Degrees")
        ;BELL: What purpose does the "Utility.wait(0.1)" that was here serve?

    ;/  Auto-Level  /; ElseIf aiButton == 5
        Auto_Level_Button()

    ;/    Pick Up   /; ElseIf aiButton == 6
       Self.DisableNoWait(True)
       PlayerREF.AddItem(MiscObj)

       ;BELL: I changed it to a "sandwhiched" disablement system,
       ;      where the item starts fading and, While it is fading, the item is added to the Player. Just a player conveinience.
       Self.Disable(True)
       Self.Delete()

    ;/    Options   /; ElseIf aiButton == 7
      MenuUi_Options_SKSE()

    ;/  Make Static /; ElseIf aiButton == 8
        MenuUi_MakeStatic()

    EndIf
EndFunction

;/$$$$$$$\        $$\      $$\                                      $$$$$$\  $$\   $$\  $$$$$$\  $$$$$$$$\
 \____$$  |       $$$\    $$$ |                                    $$  __$$\ $$ | $$  |$$  __$$\ $$  _____|
    $$  /         $$$$\  $$$$ | $$$$$$\  $$$$$$$\  $$\   $$\       $$ /  \__|$$ |$$  / $$ /  \__|$$ |
   $$  /  $$$$$$\ $$\$$\$$ $$ |$$  __$$\ $$  __$$\ $$ |  $$ |      \$$$$$$\  $$$$$  /  \$$$$$$\  $$$$$\
  $$  /   \______|$$ \$$$  $$ |$$$$$$$$ |$$ |  $$ |$$ |  $$ |       \____$$\ $$  $$<    \____$$\ $$  __|
 $$  /            $$ |\$  /$$ |$$   ____|$$ |  $$ |$$ |  $$ |      $$\   $$ |$$ |\$$\  $$\   $$ |$$ |
$$$$$$$$\         $$ | \_/ $$ |\$$$$$$$\ $$ |  $$ |\$$$$$$  |      \$$$$$$  |$$ | \$$\ \$$$$$$  |$$$$$$$$\
\________|        \__|     \__| \_______|\__|  \__| \______/        \______/ \__|  \__| \______/ \_______/;


;BELL: I know someone else made these for you but I still must compliment the formatting!
;      The only problem is the lack of While loops, so I optimized that.
;
;      Also, mine keeps the positioner until we're done. Quality of life.
;
;      These changes are copy-pasta'd over the position menu fmily.

Function Z_Menu_SKSE()
   Int aiButton =  Z_Ui_SKSE.show()

    Utility.Wait(0.1)
    Self.DisableNoWait()

    ; Make the positioner object
    ObjectReference PositionObject = Self.PlaceAtMe(StaticDummy, 1)
    PositionObject.SetMotionType(4)

    While aiButton ; Casting an Int to a Bool (e.g. using an Int as your condition) checks If it is non-zeo.


        If aiButton == 1
            Int ActivateKey = Input.GetMappedKey("Activate")
            While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object down until the activate key or left mouse button is released.

                PositionObject.TranslateTo(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ() - 5, PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ(), 500, 0)
            EndWhile
        ElseIf aiButton == 2
            Int ActivateKey = Input.GetMappedKey("Activate")
            While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object up until the activate key or left mouse button is released.

                PositionObject.TranslateTo(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ() + 5, PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ(), 500, 0)
            EndWhile
        EndIf

        Utility.Wait(0.1)
        aiButton =  Z_Ui_SKSE.show() ; The loop checks for it
    EndWhile


    ; Moves this object to the positioner
    Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())
    Self.EnableNoWait()

    ; ...and executes "you've outlived your usefulness" on the positioner object.
    PositionObject.Disable()
    PositionObject.Delete()

    ; Return to the main menu
    MenuUi_SKSE()

EndFunction


;/\     /$\         $$\      $$\                                      $$$$$$\  $$\   $$\  $$$$$$\  $$$$$$$$\
\$$\   /$  |        $$$\    $$$ |                                    $$  __$$\ $$ | $$  |$$  __$$\ $$  _____|
 \$$\_/$  /         $$$$\  $$$$ | $$$$$$\  $$$$$$$\  $$\   $$\       $$ /  \__|$$ |$$  / $$ /  \__|$$ |
  \$$$$  /  $$$$$$\ $$\$$\$$ $$ |$$  __$$\ $$  __$$\ $$ |  $$ |      \$$$$$$\  $$$$$  /  \$$$$$$\  $$$$$\
   \$$  /   \______|$$ \$$$  $$ |$$$$$$$$ |$$ |  $$ |$$ |  $$ |       \____$$\ $$  $$<    \____$$\ $$  __|
    $$ |            $$ |\$  /$$ |$$   ____|$$ |  $$ |$$ |  $$ |      $$\   $$ |$$ |\$$\  $$\   $$ |$$ |
    $$ |            $$ | \_/ $$ |\$$$$$$$\ $$ |  $$ |\$$$$$$  |      \$$$$$$  |$$ | \$$\ \$$$$$$  |$$$$$$$$\
    \__|            \__|     \__| \_______|\__|  \__| \______/        \______/ \__|  \__| \______/ \_______/;


Function Y_Menu_SKSE()
   Int aiButton =  Y_Ui_SKSE.show()

    Utility.Wait(0.1)
    Self.DisableNoWait()

    ; Make the positioner object
    ObjectReference PositionObject = Self.PlaceAtMe(StaticDummy, 1)
    PositionObject.SetMotionType(4)

    While aiButton ; Casting an Int to a Bool (e.g. using an Int as your condition) checks If it is non-zeo.


        If aiButton == 1
            Int ActivateKey = Input.GetMappedKey("Activate")
            While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object down until the activate key or left mouse button is released.

                PositionObject.TranslateTo(PositionObject.GetPositionX(), PositionObject.GetPositionY() - 5, PositionObject.GetPositionZ(), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ(), 500, 0)
            EndWhile
        ElseIf aiButton == 2
            Int ActivateKey = Input.GetMappedKey("Activate")
            While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object up until the activate key or left mouse button is released.

                PositionObject.TranslateTo(PositionObject.GetPositionX(), PositionObject.GetPositionY() + 5, PositionObject.GetPositionZ(), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ(), 500, 0)
            EndWhile
        EndIf

        Utility.Wait(0.1)
        aiButton =  Y_Ui_SKSE.show() ; The loop checks for it
    EndWhile


    ; Moves this object to the positioner
    Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())
    Self.EnableNoWait()

    ; ...and executes "you've outlived your usefulness" on the positioner object.
    PositionObject.Disable()
    PositionObject.Delete()

    ; Return to the main menu
    MenuUi_SKSE()

EndFunction


;/$\   /$\         $$\      $$\                                      $$$$$$\  $$\   $$\  $$$$$$\  $$$$$$$$\
  $$|  |$|         $$$\    $$$ |                                    $$  __$$\ $$ | $$  |$$  __$$\ $$  _____|
  \$\_/$ |         $$$$\  $$$$ | $$$$$$\  $$$$$$$\  $$\   $$\       $$ /  \__|$$ |$$  / $$ /  \__|$$ |
   \$$$  / $$$$$$\ $$\$$\$$ $$ |$$  __$$\ $$  __$$\ $$ |  $$ |      \$$$$$$\  $$$$$  /  \$$$$$$\  $$$$$\
  $$  $$<  \______|$$ \$$$  $$ |$$$$$$$$ |$$ |  $$ |$$ |  $$ |       \____$$\ $$  $$<    \____$$\ $$  __|
 $$  /\$$\         $$ |\$  /$$ |$$   ____|$$ |  $$ |$$ |  $$ |      $$\   $$ |$$ |\$$\  $$\   $$ |$$ |
 $ /   $$ |        $$ | \_/ $$ |\$$$$$$$\ $$ |  $$ |\$$$$$$  |      \$$$$$$  |$$ | \$$\ \$$$$$$  |$$$$$$$$\
|_|    \__|        \__|     \__| \_______|\__|  \__| \______/        \______/ \__|  \__| \______/ \_______/;


FunctionX_Menu_SKSE()
   Int aiButton =  X_Ui_SKSE.show()

    Utility.Wait(0.1)
    Self.DisableNoWait()

    ; Make the positioner object
    ObjectReference PositionObject = Self.PlaceAtMe(StaticDummy, 1)
    PositionObject.SetMotionType(4)

    While aiButton ; Casting an Int to a Bool (e.g. using an Int as your condition) checks If it is non-zeo.


        If aiButton == 1
            Int ActivateKey = Input.GetMappedKey("Activate")
            While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object down until the activate key or left mouse button is released.

                PositionObject.TranslateTo(PositionObject.GetPositionX() - 5, PositionObject.GetPositionY(), PositionObject.GetPositionZ(), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ(), 500, 0)
            EndWhile
        ElseIf aiButton == 2
            Int ActivateKey = Input.GetMappedKey("Activate")
            While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object up until the activate key or left mouse button is released.

                PositionObject.TranslateTo(PositionObject.GetPositionX() + 5, PositionObject.GetPositionY(), PositionObject.GetPositionZ(), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ(), 500, 0)
            EndWhile
        EndIf

        Utility.Wait(0.1)
        aiButton =  X_Ui_SKSE.show() ; The loop checks for it
    EndWhile


    ; Moves this object to the positioner
    Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())
    Self.EnableNoWait()

    ; ...and executes "you've outlived your usefulness" on the positioner object.
    PositionObject.Disable()
    PositionObject.Delete()

    ; Return to the main menu
    MenuUi_SKSE()

EndFunction

;/$$$$$\              $$\                 $$\                      $$$$$$\  $$\   $$\  $$$$$$\  $$$$$$$$\
|$  __$$\             $$ |                $$ |                    $$  __$$\ $$ | $$  |$$  __$$\ $$  _____|
|$ |  $$ | $$$$$$\  $$$$$$\    $$$$$$\  $$$$$$\    $$$$$$\        $$ /  \__|$$ |$$  / $$ /  \__|$$ |
/$$$$$$  /$$  __$$\ \_$$  _|   \____$$\ \_$$  _|  $$  __$$\       \$$$$$$\  $$$$$  /  \$$$$$$\  $$$$$\
|$  __$$< $$ /  $$ |  $$ |     $$$$$$$ |  $$ |    $$$$$$$$ |       \____$$\ $$  $$<    \____$$\ $$  __|
|$ |  $$ |$$ |  $$ |  $$ |$$\ $$  __$$ |  $$ |$$\ $$   ____|      $$\   $$ |$$ |\$$\  $$\   $$ |$$ |
|$ |  $$ |\$$$$$$  |  \$$$$  |\$$$$$$$ |  \$$$$  |\$$$$$$$\       \$$$$$$  |$$ | \$$\ \$$$$$$  |$$$$$$$$\
\__|  \__| \______/    \____/  \_______|   \____/  \_______|       \______/ \__|  \__| \______/ \_______/;


Function Rotate_Menu_SKSE()
   Int aiButton =  Rotate_Ui_SKSE.show()

    Utility.Wait(0.1)
    Self.DisableNoWait()

    ; Make the positioner object
    ObjectReference PositionObject = Self.PlaceAtMe(StaticDummy, 1)
    PositionObject.SetMotionType(4)

    While aiButton ; Casting an Int to a Bool (e.g. using an Int as your condition) checks If it is non-zeo.


        If aiButton == 1
            Int ActivateKey = Input.GetMappedKey("Activate")
            While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object down until the activate key or left mouse button is released.

                PositionObject.TranslateTo(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ(), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ() - 5, 500, 0)
            EndWhile
        ElseIf aiButton == 2
            Int ActivateKey = Input.GetMappedKey("Activate")
            While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object up until the activate key or left mouse button is released.

                PositionObject.TranslateTo(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ(), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ() + 5, 500, 0)
            EndWhile
        EndIf

        Utility.Wait(0.1)
        aiButton =  Rotate_Ui_SKSE.show() ; The loop checks for it
    EndWhile

    ; Moves this object to the positioner
    Self.SetAngle(PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ())
    Self.EnableNoWait()

    ; ...and executes "you've outlived your usefulness" on the positioner object.
    PositionObject.Disable()
    PositionObject.Delete()

    ; Return to the main menu
    MenuUi_SKSE()

EndFunction


;/$$$$$$\              $$\     $$\                                      $$$$$$\  $$\   $$\  $$$$$$\  $$$$$$$$\
 $$  __$$\             $$ |    \__|                                    $$  __$$\ $$ | $$  |$$  __$$\ $$  _____|
 $$ /  $$ | $$$$$$\  $$$$$$\   $$\  $$$$$$\  $$$$$$$\   $$$$$$$\       $$ /  \__|$$ |$$  / $$ /  \__|$$ |
 $$ |  $$ |$$  __$$\ \_$$  _|  $$ |$$  __$$\ $$  __$$\ $$  _____|      \$$$$$$\  $$$$$  /  \$$$$$$\  $$$$$\
 $$ |  $$ |$$ /  $$ |  $$ |    $$ |$$ /  $$ |$$ |  $$ |\$$$$$$\         \____$$\ $$  $$<    \____$$\ $$  __|
 $$ |  $$ |$$ |  $$ |  $$ |$$\ $$ |$$ |  $$ |$$ |  $$ | \____$$\       $$\   $$ |$$ |\$$\  $$\   $$ |$$ |
  $$$$$$  |$$$$$$$  |  \$$$$  |$$ |\$$$$$$  |$$ |  $$ |$$$$$$$  |      \$$$$$$  |$$ | \$$\ \$$$$$$  |$$$$$$$$\
  \______/ $$  ____/    \____/ \__| \______/ \__|  \__|\_______/        \______/ \__|  \__| \______/ \_______/;
           $$ |
           $$ |
           \__|


Function MenuUi_Options_SKSE()

        Int aiButton =  MenuUi_Options_SKSE.show()
        
        ;/         Back        /; If aiButton == 0
            MenuUi_SKSE()

        ;/ Positioning Options /; ElseIf aiButton==1
            MenuUi_Options_PositionerMenu()

        ;/  Toggle Auto-Level  /;ElseIf aiButton == 2
            Placeable_Auto_Level_Object_Global_Toggle_Spell.cast(PlayerRef)

        ;/      Delete All     /; ElseIf aiButton == 3

            ;BELL: You should make this into a message (yes, they can be notifications too).
            ;      It's easier for translators and prevents you from having to edit the script should you ever want to change it.

            ; Use_Lesser_Power_Msg.Show()
            Debug.Notification("Use the Skyrim Settelement Builder Options: Lesser Power To Delete All")

        EndIf
EndFunction


Function MenuUi_Options_PositionerMenu_SKSE() ; Show Option Menu
    Int aiButton= MenuUi_Options_PositionerMenu_SKSE.Show()

    ;BELL: You can use the commented-out code when you add more options. Or, you can expand this. Either way works.
    If aibutton == 1
        Placeable_SKSE_Positioner_Toggle.cast(PlayerRef)
    Else
        MenuUi_Options_SKSE()
    EndIf


    ;/
    If aibutton == 0
        MenuUi_Options_SKSE()

    ElseIf aiButton == 1
        Placeable_SKSE_Positioner_Toggle.cast(PlayerRef)
    EndIf
    /;
EndFunction


;/$\      $$\  $$$$$$\  $$\   $$\ $$$$$$$$\        $$$$$$\  $$$$$$$$\  $$$$$$\  $$$$$$$$\ $$$$$$\  $$$$$$\
 $$$\    $$$ |$$  __$$\ $$ | $$  |$$  _____|      $$  __$$\ \__$$  __|$$  __$$\ \__$$  __|\_$$  _|$$  __$$\
 $$$$\  $$$$ |$$ /  $$ |$$ |$$  / $$ |            $$ /  \__|   $$ |   $$ /  $$ |   $$ |     $$ |  $$ /  \__|
 $$\$$\$$ $$ |$$$$$$$$ |$$$$$  /  $$$$$\          \$$$$$$\     $$ |   $$$$$$$$ |   $$ |     $$ |  $$ |
 $$ \$$$  $$ |$$  __$$ |$$  $$<   $$  __|          \____$$\    $$ |   $$  __$$ |   $$ |     $$ |  $$ |
 $$ |\$  /$$ |$$ |  $$ |$$ |\$$\  $$ |            $$\   $$ |   $$ |   $$ |  $$ |   $$ |     $$ |  $$ |  $$\
 $$ | \_/ $$ |$$ |  $$ |$$ | \$$\ $$$$$$$$\       \$$$$$$  |   $$ |   $$ |  $$ |   $$ |   $$$$$$\ \$$$$$$  |
 \__|     \__|\__|  \__|\__|  \__|\________|       \______/    \__|   \__|  \__|   \__|   \______| \______/;

