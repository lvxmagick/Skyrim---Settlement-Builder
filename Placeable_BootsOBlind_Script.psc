Scriptname Placeable_BootsOBlind_Script extends ObjectReference  

Actor Property PlayerRef Auto
Message Property DebugNotification Auto
ImageSpaceModifier Property BootsOBlind Auto


Event OnEquipped(Actor akActor)
  
  if akActor == PlayerRef
    BootsOBlind.Apply()
    PlayerRef.ModActorValue("SpeedMult", 1000.0) 
    PlayerRef.ModActorValue("CarryWeight", 0.1)
  endif

EndEvent


Event OnUnequipped(Actor akActor)

  BootsOBlind.Remove()
  PlayerRef.ModActorValue("SpeedMult", -1000.0) 
  PlayerRef.ModActorValue("CarryWeight", -0.1) 

EndEvent
