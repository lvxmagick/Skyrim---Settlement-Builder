Scriptname ReadTombStone extends ObjectReference  

String Property actorName  Auto  
String Property DateOfDeath Auto 
BTDVars Property BTDQuest Auto 

Event OnInit()
	if (!actorName)
		actorName = BTDQuest.actorName
		DateOfDeath = BTDQuest.DateOfDeath
		TheDeceased = BTDQuest.TheDeceased
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		int index1 = StringUtil.Find(DateOfDeath, " ")
		string interred = StringUtil.Substring(DateOfDeath, 0, index1) 
		debug.MessageBox("Here lies " + actorName + ".\n\nInterred "+interred)
	endif
EndEvent
Actor Property TheDeceased  Auto  
