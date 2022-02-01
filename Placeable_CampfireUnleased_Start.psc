Scriptname Placeable_CampfireUnleased_Start extends activemagiceffect  

Message Property Placeable_AAA_CampfireUnleashed_Start_Message Auto 
Message Property Placeable_AAA_ManualMenu_Welcome Auto

Message Property ManualMenu  Auto  
Message Property ManualMenu_AddSpells  Auto  
Message Property ManualMenu_RemoveSpells  Auto
Message Property ManualMenu_AddSpells_FastCraft Auto
Message Property ManualMenu_AddSpells_FastCraft_P2 Auto
Message Property ManualMenu_RemoveSpells_FastCraft Auto
Message Property ManualMenu_RemoveSpells_FastCraft_P2 Auto
Message Property ManualMenu_AddSpells_Creative_Special Auto
Message Property ManualMenu_RemoveSpells_Creative_Special Auto
Message Property ManualMenu_AddSpells_Utilities Auto
Message Property ManualMenu_RemoveSpells_Utilities Auto

Sound Property StartFX01 Auto
Sound Property StartFX02 Auto
Spell Property CreativeModeSpell Auto
Spell Property CreativeCatalogueSpell Auto
Spell Property TCLSpell Auto
Spell Property ToggleGrassSpell Auto
Spell Property SmithingSpell  Auto 
Spell Property AlchemySpell  Auto
Spell Property EnchantingSpell Auto 
Spell Property StaffEnchantingSpell Auto
Spell Property SmeltingSpell  Auto 
Spell Property CookingSpell  Auto 
Spell Property TanningSpell  Auto 
Spell Property StoreFrontSpell  Auto 
Spell Property ArmourerSpell  Auto   
Spell Property SharpeningSpell Auto
Spell Property BakingSpell Auto
Spell Property Dice01Spell Auto
Spell Property YesOrNoSpell Auto
Spell Property CreativeStorageSpell Auto
Spell Property SKSE_PositionerSpell Auto
Spell Property LightningSpell Auto
;Spell Property Placeable_PowerConfig_Spell_02 Auto
Spell Property Placeable_RecipesOff_Spell Auto
Spell Property Placeable_Options_Spell Auto
book property placeable___Campfire_Unleashed_Manual Auto
Spell Property Placeable_CampfireUnleashed_Start_Spell Auto



MiscObject Property CreativeCatalogueMisc Auto
Message Property ModMessage Auto









Event OnEffectStart(Actor akTarget, Actor akCaster)

   Menu01()
   
EndEvent

;----------------------------------------------------------------------------------------------
;MAIN MENU
;---------------------------------------------------------------------------------------------


Function Menu01(Int aiButton = 0)
     aiButton = Placeable_AAA_CampfireUnleashed_Start_Message.show()

    If aiButton == 0
      Utility.Wait(1)
    Menu()
    Game.GetPlayer().AddSpell(Placeable_RecipesOff_Spell, False )
    Game.GetPlayer().AddSpell(Placeable_Options_Spell, False) 
    ;Game.GetPlayer().AddSpell(Placeable_PowerConfig_Spell_02, False) 
    Game.GetPlayer().AddItem(placeable___Campfire_Unleashed_Manual)
    Game.GetPlayer().AddSpell(Placeable_RecipesOff_Spell, False)
    ;debug.notification("Campfire Unleashed: Base Powers Added")
    Game.GetPlayer().RemoveSpell(Placeable_CampfireUnleashed_Start_Spell)
    Utility.Wait(0.2)
    debug.notification("Skyrim - Settlement Builder: Finished Loading")
    
   
   ElseIf aiButton == 1
    

     EndIf
EndFunction


;-------------------------------------------------

Function Menu(Int aiButton = 0)
     aiButton = Placeable_AAA_ManualMenu_Welcome.show()

;WELCOME MENU
    If aiButton ==0
       ; Do Nothing

    ElseIf aiButton == 1
       ManualMenu_AddSpells()    
    EndIf
EndFunction
;----------------------------------------------------------------------------------------------
;ADD SPELLS MAIN MENU
;---------------------------------------------------------------------------------------------

Function ManualMenu_AddSpells(Int aiButton = 0) ;Add All Spells
      aiButton =  ManualMenu_AddSpells.show()


    If aiButton == 1
               
        Game.GetPlayer().AddSpell(CreativeModeSpell, False) 
        Game.GetPlayer().AddSpell(CreativeCatalogueSpell, False)
        Game.GetPlayer().AddItem(CreativeCatalogueMisc, 1)

        Game.GetPlayer().AddSpell(TCLSpell, False)
        Game.GetPlayer().AddSpell(ToggleGrassSpell, False)
  
        Game.GetPlayer().AddSpell(StoreFrontSpell, False)
        Game.GetPlayer().AddSpell(SmithingSpell, False) 
        Game.GetPlayer().AddSpell(SharpeningSpell, False) 
        Game.GetPlayer().AddSpell(SmeltingSpell, False)
        Game.GetPlayer().AddSpell(ArmourerSpell, False) 
        Game.GetPlayer().AddSpell(TanningSpell, False) 
        Game.GetPlayer().AddSpell(StaffEnchantingSpell, False)
        Game.GetPlayer().AddSpell(CreativeStorageSpell, False)
        Game.GetPlayer().AddSpell(EnchantingSpell, False)
        Game.GetPlayer().AddSpell(AlchemySpell, False)
        Game.GetPlayer().AddSpell(CookingSpell, False)
        Game.GetPlayer().AddSpell(BakingSpell, False) 
        Game.GetPlayer().AddSpell(SKSE_PositionerSpell, False)
        Game.GetPlayer().AddSpell(Dice01Spell, False)   ; Dice
        Game.GetPlayer().AddSpell(YesOrNoSpell, False)
        debug.messagebox("All Powers Added")
    

    ElseIf aiButton == 2
        Game.GetPlayer().AddSpell(CreativeModeSpell, False)
        Game.GetPlayer().AddSpell(CreativeCatalogueSpell, False)
        Game.GetPlayer().AddItem(CreativeCatalogueMisc, 1)

       ;debug.Notification("Creative Mode - Added")
    ElseIf aiButton == 3
         ManualMenu_AddSpells_FastCraft()
       ;debug.Notification("Fastcraft Menu Opened")
    
   ElseIf aiButton == 4
        ManualMenu_AddSpells_Utilities() 

    ElseIf aiButton == 5
        ManualMenu_AddSpells_Creative_Special() 
 
          EndIf

EndFunction



;----------------------------------------------------------------------------------------------
;REMOVE SPELLS MAIN MENU
;---------------------------------------------------------------------------------------------

Function ManualMenu_RemoveSpells(Int aiButton = 0)
      aiButton =  ManualMenu_RemoveSpells.show()


    If aiButton == 1 ;Remove All Powers
        Game.GetPlayer().RemoveSpell(CreativeModeSpell) 
        ;debug.notification("Option: Creative Mode Removed")
        Game.GetPlayer().RemoveSpell(CreativeCatalogueSpell)
        ;debug.notification("Option: Creative Catalogue Removed")
        Game.GetPlayer().RemoveItem(CreativeCatalogueMisc, 1)

        Game.GetPlayer().RemoveSpell(TCLSpell) 
        ;debug.notification("Creative Utility: Toggle Collision Layer Removed")
          
        Game.GetPlayer().RemoveSpell(ToggleGrassSpell) 
        ;debug.notification("Creative Utility: Toggle Grass Removed")

        Game.GetPlayer().RemoveSpell(StoreFrontSpell) 
        ;debug.notification("Creative Crafting: Store Front Removed")

        Game.GetPlayer().RemoveSpell(SmithingSpell) 
        ;debug.notification("Creative Crafting: Smithing Removed")
          
         Game.GetPlayer().RemoveSpell(SharpeningSpell)
         ;debug.notification("Creative Crafting: Sharpening Removed")       

        Game.GetPlayer().RemoveSpell(SmeltingSpell)
        ;debug.notification("Creative Crafting: Smelting Removed")
        
        Game.GetPlayer().RemoveSpell(ArmourerSpell)
        ;debug.notification("Creative Crafting: Armourer Removed")

        Game.GetPlayer().RemoveSpell(TanningSpell) 
        ;debug.notification("Creative Crafting: Tanning Removed")

         Game.GetPlayer().RemoveSpell(StaffEnchantingSpell)
        ;debug.notification("Creative Crafting: Staff Enchanting Removed")

        Game.GetPlayer().RemoveSpell(EnchantingSpell)
        ;debug.notification("Creative Crafting: Enchanting Removed")
        
        Game.GetPlayer().RemoveSpell(AlchemySpell)
        ;debug.notification("Creative Crafting: Alchemy Removed")

       Game.GetPlayer().RemoveSpell(CookingSpell)
       ;debug.notification("Creative Crafting: Cooking Removed")
       
        Game.GetPlayer().RemoveSpell(BakingSpell)
        ;debug.notification("Creative Crafting: Baking Removed")

        Game.GetPlayer().RemoveSpell(Dice01Spell)   ; Dice
        ;debug.notification("Creative Special: Dice Removed")


        Game.GetPlayer().RemoveSpell(YesOrNoSpell)
        ;debug.notification("Creative Special: Yes Or No? Removed")
          
        Game.GetPlayer().RemoveSpell(SKSE_PositionerSpell)    
        ;debug.notification("Option: Toggle - Integer/Animated Positioner Removed")

       debug.Messagebox("All Powers Removed")
    

    ElseIf aiButton == 2 ;Remove Creative Mode
        Game.GetPlayer().RemoveSpell(CreativeModeSpell) 
        debug.Notification("Crafting Menu: Creative Mode Removed")
    ElseIf aiButton == 3
         ManualMenu_RemoveSpells_FastCraft()
             
       ElseIf aiButton == 4
        ManualMenu_RemoveSpells_Utilities() 
        
    ElseIf aiButton == 5
      ManualMenu_RemoveSpells_Creative_Special() 
      
          EndIf

EndFunction


;----------------------------------------------------------------------------------------------
;REMOVE FAST CRAFT SPELLS MAIN MENU 
;---------------------------------------------------------------------------------------------

Function ManualMenu_RemoveSpells_FastCraft(Int aiButton = 0)
      aiButton =  ManualMenu_RemoveSpells_FastCraft.show()

    If aiButton == 1
     
    Game.GetPlayer().RemoveSpell(SmithingSpell) 
    ;debug.notification("Creative Crafting: Smithing Removed")
          
    Game.GetPlayer().RemoveSpell(SharpeningSpell)
    ;debug.notification("Creative Crafting: Sharpening Removed")       

    Game.GetPlayer().RemoveSpell(SmeltingSpell)
    ;debug.notification("Creative Crafting: Smelting Removed")
        
    Game.GetPlayer().RemoveSpell(ArmourerSpell)
    ;debug.notification("Creative Crafting: Armourer Removed")

    Game.GetPlayer().RemoveSpell(TanningSpell) 
    ;debug.notification("Creative Crafting: Tanning Removed")

    Game.GetPlayer().RemoveSpell(EnchantingSpell)
    ;debug.notification("Creative Crafting: Enchanting Removed")

    Game.GetPlayer().RemoveSpell(StaffEnchantingSpell)
    ;debug.notification("Creative Crafting:Staff Enchanting Removed")

    Game.GetPlayer().RemoveSpell(AlchemySpell)
    ;debug.notification("Creative Crafting: Alchemy Removed")

    Game.GetPlayer().RemoveSpell(CookingSpell)
    ;debug.notification("Creative Crafting: Cooking Removed")
       
    Game.GetPlayer().RemoveSpell(BakingSpell)
    ;debug.notification("Creative Crafting: Baking Removed")
 
    debug.Notification("All Crafting Menus - Removed")
    
    ElseIf aiButton == 2
    Game.GetPlayer().RemoveSpell(SmithingSpell)  
    debug.Notification("Creative Crafting: Smithing - Removed")
   
    ElseIf aiButton == 3
    Game.GetPlayer().RemoveSpell(SharpeningSpell)
    debug.Notification("Creative Crafting: Sharpening - Removed")
    
    ElseIf aiButton == 4
    Game.GetPlayer().RemoveSpell(SmeltingSpell)  
    debug.Notification("Creative Crafting: Smelting - Removed")
   
   ElseIf aiButton == 5
    Game.GetPlayer().RemoveSpell(ArmourerSpell)
    debug.Notification("Creative Crafting: Armourer - Removed")
   
   ElseIf aiButton == 6 
    Game.GetPlayer().RemoveSpell(TanningSpell)
    debug.Notification("Creative Crafting: Tanning - Removed")
    
   ElseIf aiButton == 7 
      ManualMenu_RemoveSpells_FastCraft_P2()

 EndIf
EndFunction

;----------------------------------------------------------------------------------------------
;REMOVE FAST CRAFTING SPELLS - PAGE 2
;---------------------------------------------------------------------------------------------

Function ManualMenu_RemoveSpells_FastCraft_P2(Int aiButton = 0)
      aiButton =  ManualMenu_RemoveSpells_FastCraft_P2.show()
 


 If aiButton == 1
    Game.GetPlayer().RemoveSpell(StaffEnchantingSpell)  
     debug.Notification("Staff Enchanting- Removed")

    ElseIf aiButton == 2
    Game.GetPlayer().RemoveSpell(EnchantingSpell)  
    debug.Notification("Enchanting- Removed")
        
    ElseIf aiButton == 3
    Game.GetPlayer().RemoveSpell(AlchemySpell)  
     debug.Notification("Alchemy- Remove")
   
    ElseIf aiButton == 4
    Game.GetPlayer().RemoveSpell(CookingSpell)
    ;debug.Notification("Cooking - Remove")
    
    ElseIf aiButton == 5
    Game.GetPlayer().RemoveSpell(BakingSpell)  
    debug.Notification("Baking - Removed")
    
   EndIf

EndFunction






;----------------------------------------------------------------------------------------------
;REMOVE CREATIVE SPECIAL SPELLS
;---------------------------------------------------------------------------------------------
Function ManualMenu_RemoveSpells_Creative_Special(Int aiButton = 0)
      aiButton =  ManualMenu_RemoveSpells_Creative_Special.show()
 


 If aiButton == 1
    Game.GetPlayer().RemoveSpell(StoreFrontSpell)  
     debug.Notification("Creative Special: Store Front- Removed")

    ElseIf aiButton == 2
    Game.GetPlayer().RemoveSpell(CreativeStorageSpell)  
     debug.Notification("Creative Special: Creative Storage - Removed")
        
   ElseIf aiButton == 3
        
       EndIf

EndFunction


;----------------------------------------------------------------------------------------------
;ADD FAST CRAFTING SPELLS MAIN MENU
;---------------------------------------------------------------------------------------------


Function ManualMenu_AddSpells_FastCraft(Int aiButton = 0)
      aiButton =  ManualMenu_AddSpells_FastCraft.show()


    If aiButton == 1
    
     Game.GetPlayer().AddSpell(SmithingSpell) 
     Game.GetPlayer().AddSpell(SharpeningSpell)
     Game.GetPlayer().AddSpell(SmeltingSpell) 
     Game.GetPlayer().AddSpell(ArmourerSpell)
     Game.GetPlayer().AddSpell(TanningSpell)
     Game.GetPlayer().AddSpell(StaffEnchantingSpell)
     Game.GetPlayer().AddSpell(EnchantingSpell) 
     Game.GetPlayer().AddSpell(AlchemySpell)
     Game.GetPlayer().AddSpell(CookingSpell)
     Game.GetPlayer().AddSpell(BakingSpell)
         
     debug.messagebox("All Crafting Menus Added")
    
    ElseIf aiButton == 2
    Game.GetPlayer().AddSpell(SmithingSpell)  
    ;debug.messagebox("Smithing- Added")
   
    ElseIf aiButton == 3
    Game.GetPlayer().AddSpell(SharpeningSpell)
    ;debug.messagebox("Smelting - Added")
    
    ElseIf aiButton == 4
    Game.GetPlayer().AddSpell(SmeltingSpell)  
    ;debug.messagebox("Alchemy - Added")
    
    ElseIf aiButton == 5
    Game.GetPlayer().AddSpell(ArmourerSpell)
    ;debug.messagebox("Enchanting - Added")
    
    ElseIf aiButton == 6 
    Game.GetPlayer().AddSpell(TanningSpell)
    ;debug.Messagebox("Alchemy - Added")
    
    ElseIf aiButton == 7 
    ManualMenu_AddSpells_FastCraft_P2()


    EndIf

EndFunction

;----------------------------------------------------------------------------------------------
;ADD FAST CRAFTING SPELLS - PAGE 2
;---------------------------------------------------------------------------------------------

Function ManualMenu_AddSpells_FastCraft_P2(Int aiButton = 0)
      aiButton =  ManualMenu_AddSpells_FastCraft_P2.show()

 
 If aiButton == 1
    Game.GetPlayer().AddSpell(StaffEnchantingSpell)  
    ;debug.messagebox("Smithing- Added")

    ElseIf aiButton == 2
    Game.GetPlayer().AddSpell(EnchantingSpell)  
    ;debug.messagebox("Smithing- Added")
        
   ElseIf aiButton == 3
    Game.GetPlayer().AddSpell(AlchemySpell)  
    ;debug.messagebox("Smithing- Added")
   
   ElseIf aiButton == 4
    Game.GetPlayer().AddSpell(CookingSpell)
    ;debug.messagebox("Smelting - Added")
    
   ElseIf aiButton == 5
    Game.GetPlayer().AddSpell(BakingSpell)  
    ;debug.messagebox("Alchemy - Added")
    
   EndIf

EndFunction



;----------------------------------------------------------------------------------------------
;ADD CREATIVE SPECIAL SPELLS
;---------------------------------------------------------------------------------------------
Function ManualMenu_AddSpells_Creative_Special(Int aiButton = 0)
      aiButton =  ManualMenu_AddSpells_Creative_Special.show()
 


 If aiButton == 1
    Game.GetPlayer().AddSpell(StoreFrontSpell)  
     ;debug.Notification("Creative Special: Store Front- Removed")

    ElseIf aiButton == 2
    Game.GetPlayer().AddSpell(CreativeStorageSpell)  
   ;  debug.Notification("Creative Special: Dice")
        
   ElseIf aiButton == 3
        
       EndIf

EndFunction


;----------------------------------------------------------------------------------------------
;ADD CREATIVE UTILITIES SPELLS
;---------------------------------------------------------------------------------------------
Function ManualMenu_AddSpells_Utilities(Int aiButton = 0)
      aiButton =  ManualMenu_AddSpells_Utilities.show()
 


 If aiButton == 1
    Game.GetPlayer().AddSpell(SKSE_PositionerSpell)
    ;debug.Notification("TCL ADDED")

    ElseIf aiButton == 2
   Game.GetPlayer().AddSpell(TCLSpell)   
   ;  debug.Notification("Creative Special: Dice")
        
  ElseIf aiButton == 3
  Game.GetPlayer().AddSpell(ToggleGrassSpell)
          EndIf

EndFunction


;----------------------------------------------------------------------------------------------
;REMOVE CREATIVE UTILITIES SPELLS
;---------------------------------------------------------------------------------------------
Function ManualMenu_RemoveSpells_Utilities(Int aiButton = 0)
      aiButton =  ManualMenu_RemoveSpells_Utilities.show()
 


 If aiButton == 1
    Game.GetPlayer().RemoveSpell(SKSE_PositionerSpell)
    ;debug.Notification("TCL ADDED")

    ElseIf aiButton == 2
    Game.GetPlayer().RemoveSpell(TCLSpell)   
    ;  debug.Notification("Creative Special: Dice")
        
   ElseIf aiButton == 3
    Game.GetPlayer().RemoveSpell(ToggleGrassSpell)
          EndIf

EndFunction
;---------------------------------------------------------------------------------------------------
;INI Scripts
;---------------------------------------------------------------------------------------------------


Event OnPlayerLoadGame()

    ;  This script (self) inherently gets events from the actor within the Quest alias.
    ; The ReferenceAlias script "behaves" as If your wrote "extends Actor".
  utility.SetINIBool("bDisablePlayerCollision:Havok", False)

EndEvent






