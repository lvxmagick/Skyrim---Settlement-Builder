Scriptname Placeable_EggIncubator_Script extends ObjectReference  


Int Property iResetHours = 72 Auto

Event OnInit()
    RegisterForSingleUpdateGameTime(iResetHours)
EndEvent

Event OnUpdateGameTime()
    SELF.Reset()
    ;debug.Notification("Eggs Ready")
    RegisterForSingleUpdateGameTime(iResetHours)
EndEvent