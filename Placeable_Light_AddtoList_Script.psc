Scriptname Placeable_Light_AddtoList_Script extends ObjectReference 





Formlist Placeable_A_DeleteAll

Function Oninit() 
;===========================================Delete All Fomlist Property================================================
Placeable_A_DeleteAll = Game.GetFormFromFile(0x00E26327, "LvxMagick - Skyrim - Settlement Builder.Esp") as Formlist;  | 
;======================================================================================================================

Endfunction

Event Onload()
Placeable_A_DeleteAll.AddForm(Self)
EndEvent
