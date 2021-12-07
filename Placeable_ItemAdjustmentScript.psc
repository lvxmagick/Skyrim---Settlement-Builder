Scriptname Placeable_ItemAdjustmentScript extends ObjectReference  


Actor Property PlayerREf Auto
GlobalVariable Property Placeable_Positioner_SKSE_Global Auto
;GlobalVariable Property Placeable_Auto_Leveling_Items Auto ; Defualt = (1.0)
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


;----------------------------------------Auto - Object Leveling - System ----------------------------------------------------------------------------
Spell Placeable_Auto_Level_Object_Global_Toggle_Spell
GlobalVariable Placeable_Auto_Leveling_Items

Event OnInit() ; This event will run once, when the script is initialized
 


;---------------------------Auto-Level-Toggle-Spell-------------------
Placeable_Auto_Level_Object_Global_Toggle_Spell = Game.GetFormFromFile(0x00DE456D, "LvxMagick - Skyrim - Settlement Builder.Esm") as Spell
    


;---------------------------------------------Delete All Fomlist-------------------------------------------------------
Placeable_A_DeleteAll = Game.GetFormFromFile(0x00E26327, "LvxMagick - Skyrim - Settlement Builder.Esp") as Formlist 
;======================================================================================================================

 ;-------------------------Auto-Level-Object--------------------------    
    Placeable_Auto_Leveling_Items = Game.GetFormFromFile(0x00DD0161, "LvxMagick - Skyrim - Settlement Builder.Esm") as GlobalVariable
    ;debug.Notification(Placeable_Auto_Leveling_Items+": "+Placeable_Auto_Leveling_Items.GetValue())
   
If (Placeable_Auto_Leveling_Items.GetValue() == 0)
    GoToState("Auto_Level")
    

     Else
      ;GetValueint
    ; DO Nothing
    ;debug.Notification("Object Auto-Level Not Working")
 EndIf
EndEvent

State Auto_Level
Event OnBeginState()
    If (Placeable_Auto_Leveling_Items.GetValue() == 1)
    
    ;debug.Notification("Object Auto-Leveled OFF")

   Else

     Self.SetAngle(0.0, 0.0, Self.GetAngleZ()) ; Default
    ;debug.Notification("Object Auto-Level System Working")
    

    EndIf
EndEvent
EndState


Event OnActivate(ObjectReference akActionRef)
  If SKSE.GetVersion() > 0                                   ;is SKSE present
    If (Placeable_Positioner_SKSE_Global.GetValue() == 0.0)    ;is SKSE menu choice selected
      MenuUi_SKSE()                                              ;use SKSE menu
    Else                                                       ;otherwise 
      Menu()                                                     ;use regular menu
    EndIf
  Else                                                       ;otherwise
    Menu()                                                     ;use regular menu
EndIf
Endevent

  
;--------------------------------------------------------------------------------------------Main Menu--------------------------------------------------------------------------
 
 Function Menu(int aiButton = 0)
   aiButton = MenuUi.show()
      ;Debug.Notification("Legacy Positioner UI Active")
    If aiButton == 1
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
       Self.Disable(true)
       Game.GetPlayer().addItem(MiscObj)
       Delete()
      
   
    ElseIf aiButton == 7   ; Options
      MenuUi_Options()

    ElseIf aiButton == 8
     MenuUi_MakeStatic() 
     


EndIf
EndFunction


;------------------------------------------------------------------------Auto-Level_Button Function-----------------------------------------------------------------

    Function Auto_Level_Button()

    If (Placeable_Auto_Leveling_Items.GetValue() == 1)
    Self.SetAngle(0.0, 0.0, Self.GetAngleZ())
    

    Else
      
    debug.Messagebox("Object Auto-Level System Working - No need to use button.. You can turn off Automated Leveling Objects in the Options - Campfire Unleashed Spells.. Then this button will be active again")
    

    EndIf
    EndFunction




;---------------------------------------------------------------------------------------------------------Z_Menu---------------------------------------------------------------------

Function Z_Menu(Bool abMenu = True, int aiButton = 0, bool abFadeOut = False)

   While abMenu
   If aiButton != -1 ; Wait for input (this can prevent problems if recycling the aiButton argument in submenus)  
   aiButton =  Z_Ui.show()
     If aiButton == 0
     abMenu = False
     Menu()
   ElseIf aiButton == 1
       SetPosition(X , Y, Z *1 - 50)
       Self.Enable()
   ElseIf aiButton == 2
       SetPosition(X , Y, Z*1 - 30 )
       Self.Enable()
    ElseIf aiButton == 3
      SetPosition(X , Y, Z*1 - 10)
      Self.Enable()
    ElseIf aiButton == 4
      SetPosition(X , Y, Z*1 - 1)
      Self.Enable()
    ElseIf aiButton == 5
      SetPosition(X , Y, Z*1 + 1)
      Self.Enable()
    ElseIf aiButton == 6
      SetPosition(X , Y, Z*1 + 10)
      Self.Enable()
    ElseIf aiButton == 7
      SetPosition(X , Y, Z*1 + 30)
      Self.Enable()
     ElseIf aiButton == 8
      SetPosition(X , Y, Z*1 + 50)
      Self.Enable()
    EndIf
    EndIf
    EndWhile
EndFunction

;----------------------------------------------------------------------------------------------------Y_Menu--------------------------------------------------------------------------

Function Y_Menu(Bool abMenu = True, int aiButton = 0, bool abFadeOut = False)
   While abMenu
   If aiButton != -1 ; Wait for input (this can prevent problems if recycling the aiButton argument in submenus)   
   aiButton =  Y_Ui.show()
     If aiButton == 0
     abMenu = False
     Menu()
    ElseIf aiButton == 1
       SetPosition(X ,Y *1 - 50, Z)
       Self.Enable()
    ElseIf aiButton == 2
       SetPosition(X ,Y *1 - 30, Z)
        Self.Enable()
    ElseIf aiButton == 3
      SetPosition(X ,Y  *1 - 10, Z)
       Self.Enable()
    ElseIf aiButton == 4
      SetPosition(X ,Y *1 - 1, Z)
      Self.Enable()
     ElseIf aiButton == 5
      SetPosition(X ,Y  *1 + 1, Z)
      Self.Enable()
    ElseIf aiButton == 6
      SetPosition(X ,Y *1 + 10, Z)
      Self.Enable()
    ElseIf aiButton == 7
      SetPosition(X ,Y *1 + 30, Z)
      Self.Enable()
    ElseIf aiButton == 8
      SetPosition(X ,Y *1 + 50, Z)
      Self.Enable()

    EndIf
    EndIf
    EndWhile
EndFunction

;---------------------------------------------------------------------------------------------X_Menu-----------------------------------------------------------------------------------

Function X_Menu(Bool abMenu = True, int aiButton = 0, bool abFadeOut = False)
   While abMenu
   If aiButton != -1 ; Wait for input (this can prevent problems if recycling the aiButton argument in submenus)   
   aiButton =  X_Ui.show()
       If aiButton == 0
     abMenu = False
     Menu()
     ElseIf aiButton == 1
       SetPosition(X *1 - 50, Y, Z)
       Self.Enable()
    ElseIf aiButton == 2
       SetPosition(X *1 - 30, Y, Z)
       self.Enable()
    ElseIf aiButton == 3
      SetPosition(X *1 - 10, Y, Z)
      Self.Enable()
    ElseIf aiButton == 4
      SetPosition(X *1 - 1, Y, Z)
      Self.Enable()
    ElseIf aiButton == 5
      SetPosition(X *1 + 1, Y, Z)
      Self.Enable()
    ElseIf aiButton == 6
      SetPosition(X *1 + 10, Y, Z)
      Self.Enable()
     ElseIf aiButton == 7
      SetPosition(X *1 + 30, Y, Z)
      Self.Enable()
    ElseIf aiButton == 8
      SetPosition( X *1 + 50, Y, Z)
      Self.Enable()


    EndIf
    EndIf
    EndWhile
EndFunction

;--------------------------------------------------------------------------------------Rotate_Menu------------------------------------------------------------------------------- 

Function Rotate_Menu(Bool abMenu = True, int aiButton = 0, bool abFadeOut = False)
   While abMenu
   If aiButton != -1 ; Wait for input (this can prevent problems if recycling the aiButton argument in submenus)   
   aiButton =  Rotate_Ui.show()
      If aiButton == 0
     abMenu = False
     Menu()

    ElseIf aiButton == 1
        Self.SetAngle(0.0, 0.0, self.GetAngleZ() - 50.0)
        Self.Enable()    
     
    ElseIf aiButton == 2
        Self.SetAngle(0.0, 0.0, self.GetAngleZ() - 30.0)
        Self.Enable()   
     
    ElseIf aiButton == 3
        Self.SetAngle(0.0, 0.0, self.GetAngleZ() - 10.0)
        Self.Enable()    
               
    ElseIf aiButton == 4
        Self.SetAngle(0.0, 0.0, self.GetAngleZ() - 1.0)
        Self.Enable()    
 
    ElseIf aiButton == 5
        Self.SetAngle(0.0, 0.0, self.GetAngleZ() + 1.0)
        Self.Enable()   
 
    ElseIf aiButton == 6
        Self.SetAngle(0.0, 0.0, self.GetAngleZ() + 10.0)
        Self.Enable()    
     
    ElseIf aiButton == 7
        Self.SetAngle(0.0, 0.0, self.GetAngleZ() + 30.0)
        Self.Enable()   

    ElseIf aiButton == 8
           Self.SetAngle(0.0, 0.0, self.GetAngleZ() + 50.0)
       Self.Enable()   
    
    EndIf
    EndIf
    EndWhile
EndFunction

;------------------------------------------------------------------------------------Options_Menu----------------------------------------------------------------------------

Function MenuUi_Options( int aiButton = 0, bool abFadeOut = False)
     If aiButton != -1 ; Wait for input (this can prevent problems if recycling the aiButton argument in submenus)   
   aiButton =  MenuUi_Options.show()
      If aiButton == 0
      Menu()
   
   ElseIf aiButton==1
   MenuUi_Options_PositionerMenu()
   
EndIf
EndIf
EndFunction


Function MenuUi_Options_PositionerMenu( int aiButton = 0, bool abFadeOut = False) ; Show Option Menu
      If aiButton != -1 ; Wait for input (this can prevent problems if recycling the aiButton argument in submenus)
aiButton= MenuUi_Options_PositionerMenu.Show()
  If aibutton == 0
  MenuUi_Options()

   ElseIf aiButton== 1
Placeable_SKSE_Positioner_Toggle.cast(PlayerRef)

   ElseIf aiButton == 2
Placeable_Auto_Level_Object_Global_Toggle_Spell.Cast(PlayerRef)
    
   ElseIf aiButton == 3
      

EndIf
EndIf

EndFunction
   

;--------------------------------------------------------------------------------------------Static_Menu---------------------------------------------------------------------


Function MenuUi_MakeStatic(int aiButton = 0) ;Make Static
      aiButton = MenuUi_MakeStatic.show()

    If aiButton == 1
    DisableNoWait(True)
    Self.Disable(true)
    Self.PlaceatMe(StaticDummy)       
    Delete()
    EndIf

EndFunction 




    
      
   
 
;-------------------------------------------------------------------------------------------SKSE Main Menu -----------------------------------------------------------------------





Function MenuUi_SKSE(bool abFadeIn = false)
   Int aiButton =  MenuUi_SKSE.show()       
      

       ;Debug.Notification("SKSE Positioner Active")
    If aiButton == 1
        Z_Menu_SKSE()
    ElseIf aiButton == 2
        Y_Menu_SKSE()
    ElseIf aiButton == 3
        X_Menu_SKSE()
    
      ElseIf aiButton == 4
    Rotate_Menu_SKSE()
    ;Debug.Notification("Object is facing "+ GetAngleZ()+" Degrees")
    Utility.wait(0.1)
 
     
     ElseIf aiButton == 5
        Auto_Level_Button()
        
  
    
      ElseIf aiButton == 6
       Self.Disable(true)
       game.getPlayer().addItem(MiscObj)
       Delete()
     
     ElseIf aiButton == 7   ; Options
      MenuUi_Options_SKSE()


    ElseIf aiButton == 8
     MenuUi_MakeStatic_SKSE() 
       
EndIf
EndFunction

;----------------------------------------------------------------------------Z_SKSE_Menu--------------------------------------------------------------------------------------------------------------------------------------

Function Z_Menu_SKSE(bool abFadeIn = false)
   Int aiButton =  Z_Ui_SKSE.show()


    Utility.Wait(0.1)
    Self.Disable()
    ObjectReference PositionObject = Self.PlaceAtMe(StaticDummy, 1)
    PositionObject.SetMotionType(4) ;static
   
    If aiButton == 0
        
        Utility.Wait(0.1)
        Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())  ;Make sure the MISC object Disapears 
        PositionObject.Disable()
        PositionObject.Delete()
        Self.Enable()   
        MenuUi_SKSE();------Back

    ElseIf aiButton == 1
        ;Self.Enable()
        Int ActivateKey = Input.GetMappedKey("Activate")
        While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object down until the activate key or left mouse button is released. 
            
            PositionObject.TranslateTo(PositionObject.GetPositionX(), PositionObject.GetPositionY(), (PositionObject.GetPositionZ() - 5), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ(), 500, 0)    
        EndWhile
        
        Utility.Wait(0.1)
        Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())
        PositionObject.Disable()
        Self.Enable()
        PositionObject.Delete()
        
        Z_Menu_SKSE(abFadeIn) ;re-opens menu
   
    ElseIf aiButton == 2
        Int ActivateKey = Input.GetMappedKey("Activate")
        While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object up until the activate key or left mouse button is released. 
            
            PositionObject.TranslateTo(PositionObject.GetPositionX(), PositionObject.GetPositionY(), (PositionObject.GetPositionZ() + 5), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ(), 500, 0)    
        EndWhile
        
        Utility.Wait(0.1)
        Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())
        PositionObject.Disable()
        Self.Enable()
        PositionObject.Delete()
        
        Z_Menu_SKSE(abFadeIn) ;re-opens menu
    Endif
EndFunction
 
;---------------------------------------------------------------------------------Function_Y_SKSE-------------------------------------
 
Function Y_Menu_SKSE(bool abFadeIn = false)
   Int aiButton =  Y_Ui_SKSE.show()


    Utility.Wait(0.1)
    Self.Disable()
    ObjectReference PositionObject = Self.PlaceAtMe(StaticDummy, 1)
    PositionObject.SetMotionType(4) ;static
   
    If aiButton == 0
        Utility.Wait(0.1)
        Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())  ;Make sure the MISC object Disapears 
        PositionObject.Disable()
        PositionObject.Delete()
        Self.Enable()   
        MenuUi_SKSE();------Back
           
   
    ElseIf aiButton == 1
        ;Self.Enable()
        Int ActivateKey = Input.GetMappedKey("Activate")
        While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object down until the activate key or left mouse button is released. 
            
            PositionObject.TranslateTo(PositionObject.GetPositionX(), (PositionObject.GetPositionY() - 5), PositionObject.GetPositionZ(), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ(), 500, 0)    
        EndWhile
        
        Utility.Wait(0.1)
        Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())
        PositionObject.Disable()
        Self.Enable()
        PositionObject.Delete()
        
        Y_Menu_SKSE(abFadeIn) ;re-opens menu
   
    ElseIf aiButton == 2
        Int ActivateKey = Input.GetMappedKey("Activate")
        While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object up until the activate key or left mouse button is released. 
            
            PositionObject.TranslateTo(PositionObject.GetPositionX(), (PositionObject.GetPositionY() + 5), PositionObject.GetPositionZ(), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ(), 500, 0)    
        EndWhile
        
        Utility.Wait(0.1)
        Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())
        PositionObject.Disable()
        Self.Enable()
        PositionObject.Delete()
        
        Y_Menu_SKSE(abFadeIn) ;re-opens menu
    Endif
EndFunction
 
    
;----------------------------------------------------------------------------------Funtion_X_SKSE-----------------------------------------------------------
 
 
 
Function X_Menu_SKSE(bool abFadeIn = false)
   Int aiButton =  X_Ui_SKSE.show()


    Utility.Wait(0.1)
    Self.Disable()
    ObjectReference PositionObject = Self.PlaceAtMe(StaticDummy, 1)
    PositionObject.SetMotionType(4) ;static
   
    If aiButton == 0
        Utility.Wait(0.1)
        Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())  ;Make sure the MISC object Disapears 
        PositionObject.Disable()
        PositionObject.Delete()
        Self.Enable()   
        MenuUi_SKSE();-------Back
           
   
    ElseIf aiButton == 1
        ;Self.Enable()
        Int ActivateKey = Input.GetMappedKey("Activate")
        While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object down until the activate key or left mouse button is released. 
            
            PositionObject.TranslateTo( (PositionObject.GetPositionX() - 5), PositionObject.GetPositionY(), PositionObject.GetPositionZ(), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ(), 500, 0)    
        EndWhile
        
        Utility.Wait(0.1)
        Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())
        PositionObject.Disable()
        Self.Enable()
        PositionObject.Delete()
        
        X_Menu_SKSE(abFadeIn) ;re-opens menu
   
    ElseIf aiButton == 2
        Int ActivateKey = Input.GetMappedKey("Activate")
        While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object up until the activate key or left mouse button is released. 
            
            PositionObject.TranslateTo( (PositionObject.GetPositionX() + 5), PositionObject.GetPositionY(), PositionObject.GetPositionZ(), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ(), 500, 0)    
        EndWhile
        
        Utility.Wait(0.1)
        Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())
        PositionObject.Disable()
        Self.Enable()
        PositionObject.Delete()
        
        X_Menu_SKSE(abFadeIn) ;re-opens menu
    Endif
EndFunction
 
;--------------------------------------------------------------------------------Rotate_SKSE------------------------------------------------------------------
 
Function Rotate_Menu_SKSE(bool abFadeIn = false)
   Int aiButton =  Rotate_Ui_SKSE.show()
   
    Utility.Wait(0.1)
    Self.Disable()
    ObjectReference PositionObject = Self.PlaceAtMe(StaticDummy, 1)
    PositionObject.SetMotionType(4) ;static




   
    Utility.Wait(0.1)
    Self.Disable()
       

    If aiButton == 0
        Utility.Wait(0.1)
        Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())  ;Make sure the MISC object Disapears 
        PositionObject.Disable()
        PositionObject.Delete()
        Self.Enable()   
        MenuUi_SKSE();------Back
   
    ElseIf aiButton == 1
        ;Self.Enable()
        Int ActivateKey = Input.GetMappedKey("Activate")
        While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object down until the activate key or left mouse button is released. 
            
            PositionObject.TranslateTo(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ(), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ() - 5, 500, 0)    
        EndWhile
        
        Utility.Wait(0.1)
        Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())
        Self.SetAngle(PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ())
        PositionObject.Disable()
        Self.Enable()
        PositionObject.Delete()
        
       Rotate_Menu_SKSE(abFadeIn) ;Re- opens menu



   
    ElseIf aiButton == 2
        Int ActivateKey = Input.GetMappedKey("Activate")
        While Input.IsKeyPressed(ActivateKey) || Input.IsKeyPressed(256) ;moves object up until the activate key or left mouse button is released. 
            
            PositionObject.TranslateTo(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ(), PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ() + 5, 500, 0)    
        EndWhile
        
        Utility.Wait(0.1)
        Self.SetPosition(PositionObject.GetPositionX(), PositionObject.GetPositionY(), PositionObject.GetPositionZ())
        PositionObject.Disable()
        Self.SetAngle(PositionObject.GetAngleX(), PositionObject.GetAngleY(), PositionObject.GetAngleZ())
        Self.Enable()
        PositionObject.Delete()
   
       Rotate_Menu_SKSE(abFadeIn) ;Re- opens menu

    
Endif
EndFunction
;-----------------------------------------------------------------------------------------------------------------Options_SKSE------------------------------------------------------------------------------

Function MenuUi_Options_SKSE(int aiButton = 0, bool abFadeOut = False)
   
   If aiButton != -1 ; Wait for input (this can prevent problems if recycling the aiButton argument in submenus)   
    aiButton =  MenuUi_Options_SKSE.show()
    If aiButton == 0
    MenuUi_SKSE()  

   
   ElseIf aiButton==1
   MenuUi_Options_PositionerMenu()


   ElseIf aiButton == 2
   Placeable_Auto_Level_Object_Global_Toggle_Spell.cast(PlayerRef)
    
   ElseIf aiButton == 3
    Debug.Notification("Use the Skyrim Settelement Builder Options: Lesser Power To Delete All")


EndIf   
EndIf
EndFunction


Function MenuUi_Options_PositionerMenu_SKSE(int aiButton = 0, bool abFadeOut = False) ; Show Option Menu
  
    If aiButton != -1 ; Wait for input (this can prevent problems if recycling the aiButton argument in submenus)
aiButton= MenuUi_Options_PositionerMenu_SKSE.Show()
  If aibutton == 0
   MenuUi_Options_SKSE()

   ElseIf aiButton==1
Placeable_SKSE_Positioner_Toggle.cast(PlayerRef)
EndIf
EndIf
EndFunction


;-----------------------------------------------------------------------------------------------------------------Make Static SKSE--------------------------------------------------------------------------



Function MenuUi_MakeStatic_SKSE() ;Make Static & Add to List
   int aiButton = MenuUi_MakeStatic_SKSE.show()



    If aiButton == 1
    DisableNoWait(true)
    Disable(true)
    Placeable_A_DeleteAll.AddForm(PlaceatMe(StaticDummy))     
    Delete()
    EndIf
EndFunction 

 
