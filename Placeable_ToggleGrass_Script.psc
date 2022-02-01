Scriptname Placeable_ToggleGrass_Script extends activemagiceffect  

Message Property Placeable_AAA_ToggleGrass Auto
Message Property Placeable_AAA_ToggleGrass02 Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
Placeable_AAA_ToggleGrass.Show()
Utility.Wait(1)
Toggle_GrassMenu()
EndEvent

Function Toggle_GrassMenu(Int aibutton = 0)
aibutton = Placeable_AAA_ToggleGrass02.show()

If aibutton == 1
Utility.SetINIBool("bAllowCreateGrass:Grass", False)
Debug.Notification("Grass has been disabled - (Please Reload Cell)")
      

EndIf
EndFunction



