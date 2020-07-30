local ScreenName = Var "LoadingScreen";

return Def.ActorFrame {
	LoadFont("Common normal") .. {
		InitCommand=cmd(shadowlength,1;zoom,0.5;NoStroke;visible,true);
		BeginCommand=cmd(playcommand,"Set";);
		CurrentSongChangedMessageCommand=cmd(finishtweening;playcommand,"Set";);

		SetCommand=function(self, params)
			local curStage = GAMESTATE:GetCurrentStage()
			if GAMESTATE:IsCourseMode() then
				-- stuff
			elseif GAMESTATE:IsDemonstration() then
				self:visible(false)
			elseif GAMESTATE:IsEventMode() then
				local curStageIndex = GAMESTATE:GetCurrentStageIndex();
				if ScreenName == "ScreenGameplay" then
					curStageIndex = curStageIndex + 1
				end
				self:settextf("#%i",curStageIndex)
			else
				local screen = SCREENMAN:GetTopScreen();
				if screen and screen.GetStageStats then
					local stageStats = screen:GetStageStats();
					curStage = stageStats:GetStage();
				end

				self:settext( StageToLocalizedString(curStage) );
				self:diffuse( StageToColor(s) );
			end
		end;
	}
}
