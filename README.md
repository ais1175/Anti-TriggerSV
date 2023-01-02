# Anti-TriggerSV
 Discord : https://discord.gg/FGeu25d34t
 พบเจอปัญหาการใช้งานสอบถามได้ครับ

# Patch-Update
+ [Update]3/01/2023 - เพิ่มการป้องกัน TriggerServerEvent
+ [Update]3/01/2023 - ป้องกันการ TriggerServerEvent

# How-To-Use
 1.นำไฟล์ไปวางไว้ใน Resource ในเซิร์ฟเวอร์ของท่านแล้ว ensure Anti-TriggerSV ในไฟล์ server.cfg
 2.ทำการเปิด fxmanifest.lua ของ Resource ที่ท่านจะกัน TriggerServerEvent
 3.นำ Code ข้างล่างไปวางไว้ข้างบนสุดของ fxmanifest.lua
 server_script '@Anti-TriggerSV/core/sv.lua' 
 client_script '@Anti-TriggerSV/core/cl.lua'
 4.แล้วทำการรัน Scripts ของท่านได้ปกติ

 # About
 + Script สามารถ Restart Script อื่นๆและตัวนี้ได้ปกติ
 + Script Anti-TriggerSV สามารถป้องกันการ TriggerServerEvent ได้ในระดับนึงเท่านั้น
 + Script นี้อาจจะมีการ Update ช้าและไม่แน่นอน แต่จะพยายาม Update ให้
 + Script นี้แจกฟรีห้ามนำไปขายต่อ