Scriptname Placeable_Container_Close_Script extends ObjectReference  

Actor Property PlayerRef Auto

Event OnActivate(ObjectReference akActionRef)
Self.SetOpen()
Utility.Wait(0.5)
if ( ! Game.IsLookingControlsEnabled() )
    RegisterForSingleUpdate(0.5)
    return
  else 
 Self.SetOpen(False)
Endif
EndEvent


Event Oninit()
if PlayerRef.IsSneaking()
self.BlockActivation()
EndIf
EndEvent