Scriptname Placeable_Dice_Message_Script extends ObjectReference

Message[] Property OutputMessages Auto

Event OnEquipped(Actor akActionRef)
    if (akActionRef != Game.GetPlayer())
        return ;Not the player
    endif
    
    int iRoll = Utility.RandomInt(0,5)
    OutputMessages[iRoll].Show(iRoll)

EndEvent