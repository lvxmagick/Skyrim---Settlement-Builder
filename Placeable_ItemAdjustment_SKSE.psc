Scriptname Placeable_ItemAdjustment_SKSE extends ObjectReference  


Actor Property PlayerREf Auto
GlobalVariable Property Placeable_Positioner_SKSE_Global Auto
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
Activator Property My_Activator_Static Auto
Static Property StaticDummy Auto
Spell Property Placeable_SKSE_Positioner_Toggle Auto



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
Function Menu(int aiButton = 0)
  
;--------------------------------------------------------------------------------------------Main Menu--------------------------------------------------------------------------
 
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
     Self.SetAngle(0.0, 0.0, Self.GetAngleZ())
  
 
      ElseIf aiButton == 6
       self.Disable(true)
       game.getPlayer().addItem(MiscObj)
        Delete()
      
   
     ElseIf aiButton == 7   ; Options
      MenuUi_Options()

    ElseIf aiButton == 8
     MenuUi_MakeStatic() 

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
     
   
   ElseIf aiButton==1
   MenuUi_Options_PositionerMenu()
   
EndIf
EndIf
EndFunction


Function MenuUi_Options_PositionerMenu( int aiButton = 0, bool abFadeOut = False) ; Show Option Menu
      If aiButton != -1 ; Wait for input (this can prevent problems if recycling the aiButton argument in submenus)
aiButton= MenuUi_Options_PositionerMenu.Show()
  If aibutton == 0
  

   ElseIf aiButton==1
Placeable_SKSE_Positioner_Toggle.cast(PlayerRef)

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
   Self.PlaceAtMe(My_Activator_Static)       
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
     Self.SetAngle(0.0, 0.0, Self.GetAngleZ())
  
    
      ElseIf aiButton == 6
       self.Disable(true)
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
     

   
   ElseIf aiButton==1
   MenuUi_Options_PositionerMenu()
   
EndIf
EndIf
EndFunction


Function MenuUi_Options_PositionerMenu_SKSE(int aiButton = 0, bool abFadeOut = False) ; Show Option Menu
  
    If aiButton != -1 ; Wait for input (this can prevent problems if recycling the aiButton argument in submenus)
aiButton= MenuUi_Options_PositionerMenu_SKSE.Show()
  If aibutton == 0
   

   ElseIf aiButton==1
Placeable_SKSE_Positioner_Toggle.cast(PlayerRef)
EndIf
EndIf
EndFunction




;-----------------------------------------------------------------------------------------------------------------Make Static SKSE--------------------------------------------------------------------------


Function MenuUi_MakeStatic_SKSE(int aiButton = 0) ;Make Static
      aiButton = MenuUi_MakeStatic_SKSE.show()

    If aiButton == 1
    DisableNoWait(True)
    Self.Disable(true)
    Self.PlaceatMe(StaticDummy)  
    Self.PlaceatMe(My_Activator_Static)    
    Delete()
    EndIf

EndFunction 

 

