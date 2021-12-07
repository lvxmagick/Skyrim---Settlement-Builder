Scriptname Placeable_Collision_Off_Script extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Utility.SetINIBool("bDisablePlayerCollision:Havok", true)
EndEvent
Event OnEffectFinish(Actor akTarget, Actor akCaster)
    Utility.SetINIBool("bDisablePlayerCollision:Havok", false)
EndEvent