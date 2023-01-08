Config = {}

Config['SpammedEvents'] = { --- ป้องกันการ Spam Event กันพวก TriggerServerEvent
-- [@ตัวอย่าง]
-- ['esx_paymoney'] = 1,   --- ['ชื่อ EventName'] = เวลาเป็นวินาที
-- หากมีผู้เล่นทำการ TriggerServerEvent เร็วกว่า 1 วินาที จะทำการ Ban ทันทีหรือ Kick 
    ['esx_paymoney'] = 1, 
}