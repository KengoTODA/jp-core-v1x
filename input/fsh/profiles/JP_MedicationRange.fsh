// ==============================
//   DataType 定義
// ==============================
Profile: JP_MedicationRange
Parent: Range
Id: jp-medicationrange
Title: "JP Core Medication Range DataType"
Description: "このプロファイルはRange DataTypeに対して、薬剤量の上限下限に関する定義を行なったものである"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRange"
* ^status = #draft
* ^date = "2022-03-16"
* . ^short = "薬剤の単位指定された上限下限量"
* . ^definition = "薬剤の単位指定された上限下限量"
* . ^comment = "薬剤の上限量、下限量の範囲を持っている。単位指定された数量を割り当てている。"
* low only JP_MedicationSimpleQuantity
* low ^short = "薬剤の下限量"
* high only JP_MedicationSimpleQuantity
* low ^short = "薬剤の上限量"


// ==============================
//   DataType 定義
// ==============================
Profile: JP_MedicationRange_UnitOfTime
Parent: Range
Id: jp-medicationrange-unitoftime
Title: "JP Core Medication Range DataType"
Description: "このプロファイルはRange DataTypeに対して、薬剤量の上限下限に関する定義を行なったものである"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRange_UnitOfTime"
* ^status = #draft
* ^date = "2022-03-16"
* . ^short = "時間範囲指定された上限下限量"
* . ^definition = "時間範囲指定された上限下限量"
* . ^comment = "時間の上限量、下限量の範囲を持っている。単位指定された数量を割り当てている。"

* low ^short = "時間範囲（下限）"
* low.value ^short = "時間範囲（下限）"
* low.value ^definition = "時間範囲（下限）"
* low.unit ^short = "単位時間の単位"
* low.system from $units-of-time (preferred)
* low.system ^short = "UCUMを識別するURL。"
* low.system ^definition = "UCUMを識別するURL。固定値。"
* low.code from $units-of-time (preferred)

* high ^short = "時間範囲（上限）"
* high.value ^short = "時間範囲（上限）"
* high.value ^definition = "時間範囲（上限）"
* high.unit ^short = "単位時間の単位"
* high.system from $units-of-time (preferred)
* high.system ^short = "UCUMを識別するURL。"
* high.system ^definition = "UCUMを識別するURL。固定値。"
* high.code from $units-of-time (preferred)