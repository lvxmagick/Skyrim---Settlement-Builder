Scriptname Placeable_Activate_ObjectReference extends ObjectReference  


ObjectReference Property Activate_Object01 Auto

     Event OnActivate(ObjectReference akActionRef) 
     Self.SetOpen()
     Utility.Wait(0.5)
     Activate_Object01.Activate(Game.Getplayer())
      Registerforsingleupdate(1.0)
      
      OnUpdate()
      if ( ! Game.IsLookingControlsEnabled() )
      RegisterForSingleUpdate(0.5)
      return
      else
      Utility.Wait(0.5) 
      Self.SetOpen(False)
      
      EndIf
      EndEvent
