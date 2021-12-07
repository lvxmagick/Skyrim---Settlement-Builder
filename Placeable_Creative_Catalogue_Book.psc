Scriptname Placeable_Creative_Catalogue_Book extends ObjectReference  


Spell Property Placeable_CreativeMode_Catalouge_Spell Auto
Actor Property PlayerRef Auto
MiscObject Property Catalogue Auto
Message Property Placeable_ManualMenu_CreativeMode_Catalogue Auto
Event OnEquipped(Actor akActor)
  if akActor == Game.GetPlayer()
  Debug.Notification("Leave Inventory to Use Catalogue")
   Utility.Wait(0.1)
   Cast() 
EndIf
EndEvent



;----------------------------------------------------------------------------------------------
;MAIN MENU
;---------------------------------------------------------------------------------------------


Function Cast()
Placeable_CreativeMode_Catalouge_Spell.Cast(PlayerRef)
Endfunction


