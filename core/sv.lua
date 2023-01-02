ESX = exports["es_extended"]:getSharedObject()

local eventPrefix = GetCurrentResourceName() .. ":"

if IsDuplicityVersion() then
  local registerServerEvent, registerNetEvent, addEventHandler = RegisterServerEvent, RegisterNetEvent, AddEventHandler
  local events = {}

  function RegisterServerEvent(event)
    events[event] = os.time()
    return registerServerEvent(event)
  end

  function Regenerate(_source, event)
    RegisterServerEvent(event)
    TriggerClientEvent(eventPrefix .. "HeartBeat-Events", _source, events)
  end

  function AddEventHandler(event, func)
    if events[event] then	
      return addEventHandler(event,function(code, ...)
          if code ~= events[event] then
                BannedPlayer(event)
            return CancelEvent()
          end
          Regenerate(source, event)
          return func(...)
        end)
    end
    return addEventHandler(event, func)
  end

  function BannedPlayer(event) -- Function Ban or Kick
  -- @Parameter
  -- event = ชื่อเหตุการณ์การ TriggerServerEvent
  end
 
  registerServerEvent(eventPrefix .. "HeartBeat")
  addEventHandler(eventPrefix .. "HeartBeat", function()
      TriggerClientEvent(eventPrefix .. "HeartBeat-Events", source, events)
    end)
end