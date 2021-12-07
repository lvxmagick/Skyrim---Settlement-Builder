Scriptname Placeable_AnimatedObjects_Script extends ObjectReference  

bool property bAllowInterrupt = FALSE auto
{Allow interrupts while animation? Default: FALSE}


bool property startDown = True Auto



Event Onactivate(Objectreference akActionRef)
    
if (startDown)
		Self.PlayAnimation("StartLowered")
		GoToState("Lowered")
	Else
		GoToState("Raised")
	EndIf
EndEvent

State Raised
	Event OnActivate(ObjectReference obj)
		Self.PlayAnimationAndWait("Lower", "Done")
		GoToState("Lowered")
	EndEvent
EndState

State Lowered
	Event OnActivate(ObjectReference obj)
		Self.PlayAnimationAndWait("Raise", "Done")
		GoToState("Raised")
	EndEvent
EndState
