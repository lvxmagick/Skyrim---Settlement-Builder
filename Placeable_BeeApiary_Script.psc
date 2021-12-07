Scriptname Placeable_BeeApiary_Script extends ObjectReference  

int Property iResetHours = 72 Auto

Event OnInit()
    RegisterForSingleUpdateGameTime(iResetHours)
EndEvent

Event OnUpdateGameTime()
   self.Reset()
    RegisterForSingleUpdateGameTime(iResetHours)
EndEvent