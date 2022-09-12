CodeSystem: JP_MedicationCodeYJ_CS
Id: jp-medicationcode-yj-cs
Title: "JP Core Medication YJ CodeSystem"
Description: "薬価基準収載医薬品コード(YJコード)のコードシステム"
* ^identifier[0].system = "urn:ietf:rfc:3986"
* ^identifier[=].value = "urn:oid:1.2.392.100495.20.1.73"
* ^url = $JP_MedicationCodeYJ_CS
* ^status = #draft
* ^caseSensitive = true
* ^valueSet = $JP_MedicationCodeYJ_VS
* ^content = #fragment

// TODO:　YJ医薬品コード追加