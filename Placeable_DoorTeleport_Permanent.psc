Scriptname Placeable_DoorTeleport_Permanent extends ObjectReference  



Actor Property PlayerRef Auto
ReferenceAlias Property Follower Auto
ObjectReference Property Activate_Object Auto 
ObjectReference Property TeleportMarker auto
ObjectReference Property ReturnMarker auto
ObjectReference Property ReturnMarker02 auto






Event OnActivate(ObjectReference akActionRef)
      Activate_Object.Activate(Game.Getplayer())
      Activate_Object.Activate(Game.Getplayer())
      ReturnMarker.MoveTo(PlayerRef)
      ReturnMarker.SetAngle(0.0,0.0,(Self.GetAngleZ()+180.00))
      ;akActionRef.MoveTo(TeleportMarker)
      Follower.GetActorRef().MoveTo(TeleportMarker)
EndEvent