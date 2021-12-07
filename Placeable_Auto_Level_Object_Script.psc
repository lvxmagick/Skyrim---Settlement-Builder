Scriptname Placeable_Auto_Level_Object_Script extends activemagiceffect  

GlobalVariable Property Placeable_Auto_Leveling_Items Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
;Debug.Notification("Auto Level Object - ("+Placeable_Auto_Leveling_Items.GetValueInt()+")")

If (Placeable_Auto_Leveling_Items.GetValue() == 0.0)
        Placeable_Auto_Leveling_Items.SetValue(1.0) 
        Debug.Notification("Auto Level Object - (Off)")
    Else
        Placeable_Auto_Leveling_Items.SetValue(0.0) 
        Debug.Notification("Auto Level Object - (On)")
    EndIf

EndEvent
