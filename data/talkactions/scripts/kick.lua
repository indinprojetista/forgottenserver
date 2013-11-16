function onSay(cid, words, param)
	local player = Player(cid)
	if not player:getGroup():getAccess() then
		return false
	end

	if player:getAccountType() < ACCOUNT_TYPE_GAMEMASTER then
		return false
	end
 
	local target = Player(param)
	if target == nil then
		player:sendCancelMessage("Player not found.")
		return false
	end

	if target:getGroup():getAccess() then
		player:sendCancelMessage("You cannot kick this player.")
		return false
	end

	target:remove()
	return false
end