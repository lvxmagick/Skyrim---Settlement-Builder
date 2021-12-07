Scriptname Placeable_YesOrNo_Script extends activemagiceffect  


 

Message[] Property OutputMessages Auto
Message Property Ask01 Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

 Ask01.Show()
 Utility.Wait(0.3)
    Debug.Messagebox("Your Answer Is..")
    Utility.Wait(0.1)

   int YesorNo = Utility.RandomInt(0,1)
   OutputMessages[YesorNo].Show(YesorNo)
    


EndEvent