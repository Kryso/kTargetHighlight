-- imports
local Frame = kWidgets.Frame;
local Border = kWidgets.Border;

-- private

-- event handlers
local OnPlayerTargetChanged = function( self, method )
	self:Update();
end

-- frame scripts

-- public
local Update = function( self )
	local unit = self.parent:GetAttribute( "unit" );

	if ( unit and strlen( unit ) > 0 and UnitExists( "target" ) and UnitGUID( "target" ) == UnitGUID( unit ) ) then
		self:Show();
	else
		self:Hide();
	end
end

-- constructor
local ctor = function( self, baseCtor, parent )
	baseCtor( self );
	
	self.parent = parent;
	
	local border = Border( self );
	border:SetPoint( "TOPLEFT", self, "TOPLEFT", 0, 0 );
	border:SetPoint( "BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 0 );
	border:SetInnerSize( 2 );
	self.border = border;
	
	local offset = border:GetInnerSize() + border:GetOuterSize() * 2;
	self:SetParent( parent );
	self:SetFrameLevel( parent:GetFrameLevel() - 1 );
	self:SetPoint( "TOPLEFT", parent, "TOPLEFT", -offset, offset );
	self:SetPoint( "BOTTOMRIGHT", parent, "BOTTOMRIGHT", offset, -offset );
	self:Hide();
	
	self:RegisterEvent( "PLAYER_TARGET_CHANGED", OnPlayerTargetChanged );
end

-- main
kWidgets.TargetHighlightFrame = kCore.CreateClass( ctor, { 
		Update = Update,
	}, Frame );