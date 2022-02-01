Scriptname Placeable_DoorReturn_Script extends ObjectReference  


ObjectReference Property ReturnMarker auto
ReferenceAlias Property Follower auto

Event OnActivate(ObjectReference akActionRef)
    akActionRef.MoveTo(ReturnMarker)
    Follower.GetActorRef().MoveTo(ReturnMarker)
EndEvent