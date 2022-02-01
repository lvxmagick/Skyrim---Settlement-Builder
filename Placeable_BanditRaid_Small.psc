Scriptname Placeable_BanditRaid_Small extends ObjectReference  



import game
import debug
Message Property BattleStartMessage Auto
Message Property  Placeable_AA_RaidMenu Auto
Int Property iResetRound = 1 Auto
MiscObject property MiscObj auto


ActorBase property myCreature1 auto  ;Archers
ActorBase property myCreature2 auto  ;Melee Fighters
ActorBase property myCreature3 auto  ;Mages
ActorBase property myCreature4 auto  ;Tank;
ActorBase property myCreature5 auto  ;Tank;
ActorBase property myCreature6 auto  ;Boss1
ActorBase property myCreature7 auto  ;Boss2
ActorBase property myCreature8 auto  ;Boss3
;ActorBase property myCreature9 auto
;ActorBase property myCreature10 auto
;ActorBase property myCreature11 auto
;ActorBase property myCreature12 auto
;ActorBase property myCreature13 auto
;ActorBase property myCreature14 auto
;ActorBase property myCreature15 auto
;ActorBase property myCreature16 auto
;ActorBase property myCreature17 auto
;ActorBase property myCreature18 auto
;ActorBase property myCreature19 auto
;ActorBase property myCreature20 auto
;ActorBase property myCreature21 auto
;ActorBase property myCreature22 auto
;ActorBase property myCreature23 auto
;ActorBase property myCreature24 auto
;ActorBase property myCreature25 auto
;ActorBase property myCreature26 auto
;ActorBase property myCreature27 auto
;ActorBase property myCreature28 auto
;ActorBase property myCreature29 auto
;ActorBase property myCreature30 auto




;Spawn Timer
Event OnInit()
    RegisterForSingleUpdateGameTime(iResetRound)
   Utility.wait(5)
   BattleStartMessage.show()

EndEvent

Event OnUpdateGameTime()
    debug.Notification("Brace yourself ")
    Utility.Wait(2)
    debug.Messagebox("THE BANDITS HAVE ARRIVED")                ;ARCHERS
    Utility.Wait(2)


;____________________________________________________________   
;  ARCHERS Wave 1
;------------------------------------------------------------------------------------------

    Self.PlaceActorAtMe(myCreature1)
    Self.PlaceActorAtMe(myCreature1)
    Self.PlaceActorAtMe(myCreature1)
    
  
   Utility.Wait(15)
;____________________________________________________________   
; MELEE FIGHTERS Wave 1
;------------------------------------------------------------------------------------------

    
    Self.PlaceActorAtMe(myCreature2).StartCombat(game.getplayer())
    Self.PlaceActorAtMe(myCreature2).StartCombat(game.getplayer())
    Self.PlaceActorAtMe(myCreature2).StartCombat(game.getplayer())
  

    Utility.Wait(15)
    Self.PlaceActorAtMe(myCreature2).StartCombat(game.getplayer())
         Utility.Wait(15)
        Self.PlaceActorAtMe(myCreature2).StartCombat(game.getplayer())
           Utility.wait(25)


;____________________________________________________________   
;MAGES Wave 1
;------------------------------------------------------------------------------------------


     Utility.wait(10)
     Self.PlaceActorAtMe(myCreature3).StartCombat(game.getplayer())
    Self.PlaceActorAtMe(myCreature3).StartCombat(game.getplayer())
    Self.PlaceActorAtMe(myCreature3).StartCombat(game.getplayer())
       
;____________________________________________________________   
;  ARCHERS & MELEE Wave 2
;------------------------------------------------------------------------------------------


 Utility.wait(20)

    Self.PlaceActorAtMe(myCreature4).StartCombat(game.getplayer()) ;TANK
    Self.PlaceActorAtMe(myCreature1).StartCombat(game.getplayer())
    Self.PlaceActorAtMe(myCreature1).StartCombat(game.getplayer())
      
;____________________________________________________________   
; MELEE FIGHTERS Wave 2
;------------------------------------------------------------------------------------------


  Utility.wait(10)
  Self.PlaceActorAtMe(myCreature2).StartCombat(game.getplayer())
   Self.PlaceActorAtMe(myCreature1).StartCombat(game.getplayer())
   Self.PlaceActorAtMe(myCreature1).StartCombat(game.getplayer())
   
Debug.Notification("Enemy Reinforcements Have Arrived")


     Debug.Messagebox("Last Enemy Has Entered The Battle")
 
 Menu()
 
             
EndEvent

Function Menu(Int aiButton = 0)
       aiButton = Placeable_AA_RaidMenu.show()   ;Shows Bandit Raid Menu to continue the Raid or startOver
 If aiButton == 0 
RegisterForSingleUpdateGameTime(iResetRound) ;Event  Init() is at the begging of the script
           Debug.Notification("Round Reset")
           Utility.Wait(10)
           Debug.Messagebox("You have 1 hours before enemy reinforcements arrive")

     elseIf aiButton == 1  
       self.Disable(True)
       game.getPlayer().addItem(MiscObj)
       DeleteWhenAble()
       Delete()

EndIf
EndFunction
