Scriptname Placeable_VampireKattle_Script extends ObjectReference  

 
ActorBase Property Thral Auto
FormList Placeable_A_DeleteAll



Event OnInIt()
;============================================Delete All Fomlist========================================================
  Placeable_A_DeleteAll = Game.GetFormFromFile(0x00E26327, "LvxMagick - Skyrim - Settlement Builder.Esp") as Formlist;|
;======================================================================================================================
EndEvent



Event OnActivate(ObjectReference akActionRef)




Placeable_A_DeleteAll.AddForm(PlaceatMe(Thral))


Disable(true)
Deletewhenable()
Delete()
EndEvent
