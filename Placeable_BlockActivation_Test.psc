Scriptname Placeable_BlockActivation_Test extends ObjectReference  


function Initialize()
	self.BlockActivation()
	parent.Initialize()
endFunction

function UseObject(ObjectReference akActionRef)
	SetSelectedObjectConjured(self)

EndFunction