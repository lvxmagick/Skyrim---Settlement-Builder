Scriptname Placeable_Tarot_Script extends ActiveMagicEffect  



Message[] Property OutputMessages Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
       
    int iRoll = Utility.RandomInt(0,5)
    OutputMessages[iRoll].Show(iRoll)

EndEvent