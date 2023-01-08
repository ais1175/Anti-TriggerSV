ESX = exports["es_extended"]:getSharedObject()

recentEvents = {}

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1000)
		clientEventCount = {}
		for i, event in ipairs(recentEvents) do 
			if not clientEventCount[event.sender] then 
				clientEventCount[event.sender] = 0 
			end
			clientEventCount[event.sender] = clientEventCount[event.sender]+1
			table.remove(recentEvents,i)
		end 
		for k, data in pairs(recentEvents) do
			if clientEventCount[data.sender] >= 1 and os.clock() - data.last_time < data.time then
                BannedPlayer(data.sender)
			end
		end
	end
end)

function handleSpammedEvents(event , time)
	local source = source
	local event = event
	local time = time
	local eventData = {name=event, sender = source, last_time = os.clock(), time = time}
	table.insert(recentEvents, eventData)
end

if Config['SpammedEvents'] then
	for event, time in pairs(Config['SpammedEvents']) do
		AddEventHandler(event, function()
			handleSpammedEvents(event , time)
		end)
	end
end

function BannedPlayer(playerid)
    -- Parameter playerid = ไอดีผู้เล่น
end