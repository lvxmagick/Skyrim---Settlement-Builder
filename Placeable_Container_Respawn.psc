Scriptname Placeable_Container_Respawn extends ObjectReference  

int Property iResetHours = 48 Auto

Event OnInit()
    RegisterForSingleUpdateGameTime(iResetHours)
EndEvent

Event OnUpdateGameTime()
    self.Reset()
    RegisterForSingleUpdateGameTime(iResetHours)
EndEvent