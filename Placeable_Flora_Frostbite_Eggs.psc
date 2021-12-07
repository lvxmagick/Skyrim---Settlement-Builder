Scriptname Placeable_Flora_Frostbite_Eggs extends ObjectReference  



Actorbase Property Enemy Auto
ActorBase Property PlayerRef Auto

Event OnActivate(ObjectReference akActionRef)    ;Get Eggs From Albino Nest
  int eggs = Self.GetItemCount(Game.Getform(0x09151B))

  If (eggs == 0)
    Debug.MessageBox("No more Albino Eggs at this time")
 
 
Else
    

If (eggs == 3) ; Say Nothing Just Recieve Eggs

int iRoll = Utility.RandomInt(0,15)

Debug.Notification("Rolling Number")
If iRoll == 12
Debug.Notification("Oops the eggs hatched!!")

Game.GetPlayer().PlaceactorAtMe(Enemy).StartCombat(Game.GetPlayer())
Game.GetPlayer().PlaceactorAtMe(Enemy).StartCombat(Game.GetPlayer())
Game.GetPlayer().PlaceactorAtMe(Enemy).StartCombat(Game.GetPlayer())


EndIf
EndIf  
EndIf
EndEvent