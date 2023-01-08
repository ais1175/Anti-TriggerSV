ESX = exports["es_extended"]:getSharedObject()

local eventPrefix = GetCurrentResourceName() .. ":"
local events_task = {}

function merge_events(orig, new)
  events_task[orig] = new
  local left = orig
  while left ~= nil do
    local right = events_task[left]
    for new_key, new_val in pairs(right) do
      local old_val = left[new_key]
      if old_val == nil then
        left[new_key] = new_val
      else
        local old_type = type(old_val)
        local new_type = type(new_val)
        if (old_type == "table" and new_type == "table") then
          events_task[old_val] = new_val
        else
          left[new_key] = new_val
        end
      end
    end
    events_task[left] = nil
    left = next(events_task)
  end
end

if not IsDuplicityVersion() then
  local triggerServerEvent = TriggerServerEvent
  local events = {}
  RegisterNetEvent(eventPrefix .. "HeartBeat-Events")
  AddEventHandler(eventPrefix .. "HeartBeat-Events", function(_events)
    merge_events(events, _events)
  end)
  function TriggerServerEvent(event, ...)
    while not events do
      Citizen.Wait(25)
    end
    return triggerServerEvent(event, events[event], ...)
  end
  triggerServerEvent(eventPrefix .. "HeartBeat")
end

