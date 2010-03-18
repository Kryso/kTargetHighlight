-- defines

-- imports
local TargetHighlightFrame = kWidgets.TargetHighlightFrame;

-- main

for index = 1, 5 do
	local frame = _G[ "oUF_Arena" .. tostring( index ) ]
	if ( not frame ) then break; end
	
	TargetHighlightFrame( frame );
end

for index = 1, 5 do
	local frame = _G[ "oUF_PartyPet" .. tostring( index ) ]
	if ( not frame ) then break; end

	TargetHighlightFrame( frame );
end

do
	local event;
	local partyFramesCreated = 1;
	local OnPartyMembersChanged = function( self )
		for index = partyFramesCreated, 5 do
			local frame = _G[ "oUF_GroupUnitButton" .. tostring( index ) ];
			if ( not frame ) then
				break;
			end
			
			TargetHighlightFrame( frame );
			partyFramesCreated = partyFramesCreated + 1
		end
		
		if ( partyFramesCreated > 5 ) then
			kEvents.UnregisterEvent( event );
		end
	end
	event = kEvents.RegisterEvent( "PARTY_MEMBERS_CHANGED", OnPartyMembersChanged );
end