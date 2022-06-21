Profile: JP_Immunization
Parent: Immunization
Id: jp-immunization
Title: "JP Core Immunization Profile"
Description: "このProfileはImmunizationリソースに対して日本での予防接種データを送受信するための成約を加えてものである。"
* ^url = "https://jpfhir.jp/fhir/core/StructureDefinition/JP_Immunization"
* ^version = "1.0.1"
* ^status = #draft
* ^date = "2022-02-18"
* ^purpose = "予防接種の記録を交換するために用いられる。"
* . ^short = "予防接種"
* . ^definition = "ワクチンを接種したときの記録，あるいは予防接種について患者や医療従事者などが報告した記録。"
* id ^short = "このResourceに対する論理ID"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains
    JP_Immunization_DueDateOfNextDose named DueDateOfNextDose 0..1 and
    JP_Immunization_ManufacturedDate named ManufacturedDate 0..1 and
    JP_Immunization_CertificatedDate named CertificatedDate 0..1
* extension[DueDateOfNextDose] ^short = "次回接種予定日"
* extension[DueDateOfNextDose] ^definition = "次回接種を予定している日、期限"
* extension[DueDateOfNextDose] ^isModifier = false
* extension[ManufacturedDate] ^short = "製造年月日"
* extension[ManufacturedDate] ^definition = "ワクチンが製造された年月日"
* extension[ManufacturedDate] ^isModifier = false
* extension[CertificatedDate] ^short = "検定年月日"
* extension[CertificatedDate] ^definition = "ワクチンが検定された年月日"
* extension[CertificatedDate] ^isModifier = false
* status ^definition = "予防接種記録の現在の状態を示すコード"
* status ^binding.strength = #required
* status ^binding.description = "予防接種の現在の状態を表すコード"
* statusReason ^short = "実施しなかった理由"
* vaccineCode ^short = "接種されたワクチン製剤"
* vaccineCode ^definition = "接種されたあるいは接種予定のワクチン。"
* vaccineCode ^comment = "全てのターミノロジーがこのパターンに当てはまるわけではない。モデルによってはCoceableConceptではなく，独自構造でCodingを直接指定して文書やコーディング，その解釈や事前条件や事後条件との関連について示される。"
* patient ^short = "予防接種を受けた人"
* patient ^definition = "予防接種を受けた，あるいは受けなかった患者。"
* encounter ^short = "予防接種を受けた診察"
* encounter ^definition = "患者が医療従事者から予防接種を受けた外来，入院あるいは他の対面の状態を表す。"
* occurrence[x] ^short = "ワクチンを接種した日時"
* occurrence[x] ^definition = "ワクチンを接種した日あるいは接種予定だった日。"
* recorded ^short = "予防接種を受けた対象者の記録として最初に記載された日。"
* reportOrigin ^short = "二次的に報告された記録の発生源を示す"
* reportOrigin ^definition = "予防接種を実施した時に，ワクチンを接種した人以外からの報告からの情報である場合のデータの発生源。"
* location ^short = "ワクチンを接種した場所"
* location ^definition = "接種医療機関。ワクチン接種がどこで実施されたかを表す。サービスが提供された場所。摂取された身体部位ではない。"
* manufacturer ^short = "ワクチンメーカー"
* manufacturer ^definition = "ワクチメーカーの名前。"
* lotNumber ^short = "ワクチンのロット番号"
* lotNumber ^definition = "ワクチン製剤のロット番号。"
* expirationDate ^short = "ワクチンの使用期限"
* expirationDate ^definition = "ワクチンの消費期限を表す日。"
* site ^short = "ワクチンが接種された身体部位"
* site ^definition = "ワクチンが接種された身体部位"
* route ^short = "ワクチンを接種した経路"
* route ^definition = "ワクチンが体内へと接種された経路。"
* doseQuantity ^short = "ワクチンの投与量"
* doseQuantity ^definition = "ワクチン製剤が接種された量"
* performer ^short = "ワクチン接種を実施した人"
* performer ^definition = "誰が予防接種を実施したかを表す。"
* note ^short = "予防接種についての補足的記録"
* note ^definition = "他の属性で伝達することができない予防接種に関する他の記録。"
* reasonCode ^short = "予防接種を接種した理由"
* reasonCode ^definition = "予防接種が行われた理由"
* reasonReference ^short = "予防接種を実施した理由"
* reasonReference ^definition = "予防接種が実施された理由を表すCondition，ObservationあるいはDiagnosticReportリソースを参照する。"
* isSubpotent ^short = "効力量"
* isSubpotent ^definition = "量が通常の効力より弱いと考えられているかどうかを示す。デフォルトでは示されている量と同等の効力をもつと考えられている。"
* subpotentReason ^short = "効力が減弱する理由"
* subpotentReason ^definition = "効力が減弱すると考えられている理由。"
* education ^short = "患者に提示された教材"
* education ^definition = "ワクチンを接種するときに患者（あるいは保護者）に提示された教材。"
* programEligibility ^short = "ワクチン接種計画での患者適格性"
* programEligibility ^definition = "ワクチン接種計画での患者適格性を示す"
* fundingSource ^short = "ワクチン接種計画のの資金源"
* fundingSource ^definition = "ワクチンが実際に接種されるときの資金源を示す。これは患者適格性（たとえば，公的に購入されたワクチンには適格性があるが，在庫の問題で私的資金で購入されたワクチンを投与するような場合）とは異なることがある。"
* reaction ^short = "予防接種後に起こった反応についての詳細な記録"
* reaction ^definition = "予防接種に関連する時期に発生した副反応を示す分類されたデータ。"
* protocolApplied ^short = "提供者が実施したプロトコール"
* protocolApplied ^definition = "ワクチンを接種した提供者が実施したプロトコール（推奨される手順の集合）。"

Extension: JP_Immunization_DueDateOfNextDose
Id: jp-immunization-duedateofnextdose
Title: "DueDateOfNectDose"
Description: "次回摂取予定日"
* ^url = "https://jpfhir.jp/fhir/StructureDefinition/JP_Immunization_DueDateOfNextDose"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Immunization"
* url = "https://jpfhir.jp/fhir/StructureDefinition/JP_Immunization_DueDateOfNextDose" (exactly)
* value[x] only date

Extension: JP_Immunization_CertificatedDate
Id: jp-immunization-certificateddate
Title: "CertificatedDate"
Description: "検定年月日"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Immunization_CertificatedDate"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Immunization"
* url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Immunization_CertificatedDate" (exactly)
* value[x] only date

Extension: JP_Immunization_ManufacturedDate
Id: jp-immunization-manufactureddate
Title: "ManufacturedDate"
Description: "製造年月日"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Immunization_ManufacturedDate"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "Immunization"
* url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Immunization_ManufacturedDate" (exactly)
* value[x] only date