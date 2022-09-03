// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationAdministration
Parent: MedicationAdministration
Id: jp-medicationadministration
Title: "JP Core MedicationAdministration Profile"
Description: "このプロファイルはMedicationAdministrationリソースに対して、内服・外用薬剤処方投与実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
// extension 参照宣言
* extension contains
    JP_MedicationAdministration_RequestDepartment named requestDepartment ..1 and
    JP_MedicationAdministration_RequestAuthoredOn named requestAuthoredOn ..1 and
    JP_MedicationAdministration_Location named location ..1   and
    JP_MedicationAdministration_Requester named requester ..*
//
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration"
* ^status = #draft
* ^date = "2022-03-16"
// * ^purpose = "このプロファイルはMedicationAdministrationリソースに対して、内服・外用薬剤処方投与実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* . ^short = "患者への薬剤投与記録"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension[requestDepartment] ^short = "依頼科"
* extension[requestDepartment] ^definition = "依頼科を格納するための拡張"
* extension[requester] ^short = "依頼医"
* extension[requester] ^definition = "依頼医を格納するための拡張。\r\n依頼医を記述した Practitioner  リソースへの参照。"
* extension[requestAuthoredOn] ^short = "依頼日時"
* extension[requestAuthoredOn] ^definition = "依頼日時を格納するための拡張"
* extension[location] ^short = "実施場所"
* extension[location] ^definition = "実施場所を格納するための拡張。\r\n実施場所を記述した  Locationリソースへの参照。"
* identifier ^short = "External identifier 外部識別子"
* identifier ^definition = "Identifiers associated with this Medication Administration that are defined by business processes and/or used to refer to it when a direct URL reference to the resource itself is not appropriate. They are business identifiers assigned to this resource by the performer or other systems and remain constant as the resource is updated and propagates from server to server.\r\n\r\nビジネスプロセスによって定義され、リソース自体への直接URL参照が適切でない場合にそれを参照するために使用される、この投薬管理に関連付けられた識別子。これらは、実行者または他のシステムによってこのリソースに割り当てられたビジネスIDであり、リソースが更新されてサーバーからサーバーに伝播される間、一定のままである。"
* instantiates ^short = "Instantiates protocol or definition　プロトコルや定義のインスタンス化"
* instantiates ^definition = "A protocol, guideline, orderset, or other definition that was adhered to in whole or in part by this event.\r\n\r\nこのイベントによって全体的または部分的に順守されたプロトコル、ガイドライン、オーダーセット、またはその他の定義。"
* partOf ^short = "Part of referenced event  親イベントへの参照"
* partOf ^definition = "A larger event of which this particular event is a component or step.\r\n\r\nこの特定のイベントがコンポーネントまたはステップであるようなより大きな親イベント。"
* status ^short = "completed | stopped"
* status ^definition = "Will generally be set to show that the administration has been completed.  For some long running administrations such as infusions, it is possible for an administration to be started but not completed or it may be paused while some other process is under way.\r\n\r\n通常、管理が完了したことを示すように設定される。輸液などの長期にわたる投与では、投与を開始しても完了しない場合や、他のプロセスの進行中に一時停止する場合がある。\r\n\r\n【JP Core仕様】　completed or stopped に限定される。"
* status ^binding.description = "患者への投与状況"
* statusReason ^short = "Reason administration not performed　実施されていない理由"
* statusReason ^definition = "A code indicating why the administration was not performed.　投与が実施されていない理由を示すコード"
* statusReason ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\nすべてのターミノロジーの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係とpre-coordinationとpost-coordinationの用語関係を管理するための独自の構造を提供する必要がある。"
* category ^short = "Type of medication usage　薬が使用される区分"
* category ^definition = "Indicates where the medication is expected to be consumed or administered.\r\n\r\n薬が消費または投与されると予想される場所区分(入院、外来、家庭等)を示す。\r\ninpatient | outpatient | community\r\n (http://terminology.hl7.org/CodeSystem/medication-admin-category)"
* medicationCodeableConcept only CodeableConcept
* medicationCodeableConcept from JP_MedicationCode_VS (preferred)
* medicationCodeableConcept ^binding.strength = #preferred
* medicationCodeableConcept ^binding.description = "処方する製剤を表すコード。"
* medicationCodeableConcept.coding 1..
* medicationCodeableConcept.coding ^short = "Code defined by a terminology system コード集で定義された医薬品コード"
* medicationCodeableConcept.coding ^definition = "A reference to a code defined by a terminology system.\r\n\r\nコード集で定義された医薬品コードへの情報"
* medicationCodeableConcept.coding ^comment = "Codes may be defined very casually in enumerations, or code lists, up to very formal definitions such as SNOMED CT - see the HL7 v3 Core Principles for more information.  Ordering of codings is undefined and SHALL NOT be used to infer meaning. Generally, at most only one of the coding values will be labeled as UserSelected = true.\r\n"
* medicationCodeableConcept.coding.system 1..
* medicationCodeableConcept.coding.code 1..
* medicationCodeableConcept.coding.display 1..
* medicationReference only Reference(JP_Medication)
// * medication[x] ^short = "What was administered　医薬品"
// * medication[x] ^definition = "Identifies the medication that was administered. This is either a link to a resource representing the details of the medication or a simple attribute carrying a code that identifies the medication from a known list of medications.\r\n\r\n投与された薬剤を識別する。既知の薬のリストから薬を識別するコード情報を設定する。"
// * medication[x] ^comment = "If only a code is specified, then it needs to be a code for a specific product. If more information is required, then the use of the medication resource is recommended.  For example, if you require form or lot number, then you must reference the Medication resource.\r\n\r\n【JP Core仕様】ひとつのtext要素と、複数のcoding 要素を記述できる。処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ずtext要素に格納した上で、それをコード化した情報を1個以上のcoding 要素に記述する。\r\n\r\n厚生労働省標準であるHOT9コード（販社指定が不要な場合にはHOT7コード）または広く流通しているYJコードを用いるか、一般名処方の場合には厚生労働省保険局一般名処方マスタのコードを使用して、Coding要素（コードsystemを識別するURI、医薬品のコード、そのコード表における医薬品の名称の3つからなる）で記述する。\r\n\rなお、上記のいずれの標準的コードも付番されていない医薬品や医療材料の場合には、薬機法の下で使用されているGS1標準の識別コードであるGTIN(Global Trade Item Number)の調剤包装単位（最少包装単位、個別包装単位）14桁を使用する。\r\n\rひとつの処方薬、医療材料を複数のコード体系のコードで記述してもよく、その場合にcoding 要素を繰り返して記述する。\rただし、ひとつの処方薬を複数のコードで繰り返し記述する場合には、それらのコードが指し示す処方薬、医療材料は当然同一でなければならない。\rまた、処方を発行した医療機関内でのデータ利用のために、医療機関固有コード体系によるコード（ハウスコード、ローカルコード）の記述を含めてもよいが、その場合でも上述したいずれかの標準コードを同時に記述することが必要である。"
// * medication[x].id ^short = "Unique id for inter-element referencing 要素間参照用の一意のID"
// * medication[x].id ^definition = "Unique id for the element within a resource (for internal references). This may be any string value that does not contain spaces.\r\n\r\nリソース内の要素の一意のID（内部参照用）。これは、スペースを含まない任意の文字列値にすることができる。"
* subject ^short = "Who received medication　投与対象患者"
* subject ^definition = "The person or animal or group receiving the medication.\r\n投与を受ける患者"
* subject ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* subject.reference ^short = "Literal reference, Relative, internal or absolute URL　リテラル参照、相対、内部、または絶対URL"
* subject.reference ^definition = "A reference to a location at which the other resource is found. The reference may be a relative reference, in which case it is relative to the service base URL, or an absolute URL that resolves to the location where the resource is found. The reference may be version specific or not. If the reference is not to a FHIR RESTful server, then it should be assumed to be version specific. Internal fragment references (start with '#') refer to contained resources.\r\n\r\n他のリソースが見つかった場合そのいリソース箇所への参照。参照は相対参照である場合がある。その場合、参照はサービスベースURLに相対的であるか、リソースが見つかった場所を解決する絶対URL。参照はバージョン固有である場合とそうでない場合がある。参照がFHIR　RESTfulサーバーを参照していない場合は、バージョン固有であると見なす必要がある。内部フラグメント参照（「＃」で始まる）は、含まれているリソースを参照する。"
* subject.type ^short = "Type the reference refers to (e.g. \"Patient\")　参照リソースのタイプ"
* subject.type ^definition = "The expected type of the target of the reference. If both Reference.type and Reference.reference are populated and Reference.reference is a FHIR URL, both SHALL be consistent.\n\nThe type is the Canonical URL of Resource Definition that is the type this reference refers to. References are URLs that are relative to http://hl7.org/fhir/StructureDefinition/ e.g. \"Patient\" is a reference to http://hl7.org/fhir/StructureDefinition/Patient. Absolute URLs are only allowed for logical models (and can only be used in references in logical models, not resources).\r\n\r\n参照のターゲットの予想されるタイプ。 Reference.typeとReference.referenceの両方が入力され、Reference.referenceがFHIR URLである場合、両方が一貫している必要がある。\r\nタイプは、この参照が参照するタイプであるリソース定義の正規URLである。参照は、http：//hl7.org/fhir/StructureDefinition/に関連するURLとなる。例： 「患者」リソースの場合は、http://hl7.org/fhir/StructureDefinition/Patient　となる。絶対URLは、論理モデルでのみ許可される（また、論理モデルの参照でのみ使用でき、リソースでは使用できない）。"
* subject.identifier ^short = "Logical reference, when literal reference is not known　リテラル参照（reference要素）で記述できない場合の論理ID参照"
* subject.identifier ^definition = "An identifier for the target resource. This is used when there is no way to reference the other resource directly, either because the entity it represents is not available through a FHIR server, or because there is no way for the author of the resource to convert a known identifier to an actual location. There is no requirement that a Reference.identifier point to something that is actually exposed as a FHIR instance, but it SHALL point to a business concept that would be expected to be exposed as a FHIR instance, and that instance would need to be of a FHIR resource type allowed by the reference.\r\n\r\nターゲットリソースの識別子。これは、他のリソースを直接参照する方法がない場合に使用される。これは、リソースが表すエンティティがFHIRサーバーを介して利用できないため、またはリソースの作成者が既知の識別子を実際の場所に変換する方法がないためである 。 Reference.identifierが実際にFHIRインスタンスとして公開されているものを指している必要はないが、FHIRインスタンスとして公開されることが期待されるビジネス概念を指している必要があり、そのインスタンスは参照で許可されているFHIRリソースタイプとなる。"
* subject.identifier ^comment = "When an identifier is provided in place of a reference, any system processing the reference will only be able to resolve the identifier to a reference if it understands the business context in which the identifier is used. Sometimes this is global (e.g. a national identifier) but often it is not. For this reason, none of the useful mechanisms described for working with references (e.g. chaining, includes) are possible, nor should servers be expected to be able resolve the reference. Servers may accept an identifier based reference untouched, resolve it, and/or reject it - see CapabilityStatement.rest.resource.referencePolicy. \n\nWhen both an identifier and a literal reference are provided, the literal reference is preferred. Applications processing the resource are allowed - but not required - to check that the identifier matches the literal reference\n\nApplications converting a logical reference to a literal reference may choose to leave the logical reference present, or remove it.\n\nReference is intended to point to a structure that can potentially be expressed as a FHIR resource, though there is no need for it to exist as an actual FHIR resource instance - except in as much as an application wishes to actual find the target of the reference. The content referred to be the identifier must meet the logical constraints implied by any limitations on what resource types are permitted for the reference.  For example, it would not be legitimate to send the identifier for a drug prescription if the type were Reference(Observation|DiagnosticReport).  One of the use-cases for Reference.identifier is the situation where no FHIR representation exists (where the type is Reference (Any).\r\n\r\n参照の代わりに識別子が提供される場合、参照を処理するシステムは、識別子が使用されるビジネスコンテキストを理解している場合にのみ、識別子を参照に解決できる。これはグローバルな場合もあるが（たとえば、国民ID）、そうでない場合もある。このため、参照を操作するために説明されている便利なメカニズム（チェーン、インクルードなど）はどれも不可能であり、サーバーが参照を解決できると期待されるべきではない。サーバーは、識別子ベースの参照をそのまま受け入れ、解決したり、拒否したりする場合がある。CapabilityStatement.rest.resource.referencePolicyを参照。\r\n\r\n識別子とリテラル参照の両方が提供されている場合は、リテラル参照が優先される。リソースを処理するアプリケーションは、識別子がリテラル参照と一致することを確認できるが、確認することは必須ではない。\r\n\r\n論理参照をリテラル参照に変換するアプリケーションは、論理参照を存在させたままにするか、削除するかを選択できる。\r\n\r\n参照は、FHIRリソースとして表現できる可能性のある構造を指すことを目的としているが、実際のFHIRリソースインスタンスとして存在する必要はない。ただし、アプリケーションが参照のターゲットを実際に見つけたい場合を除く。識別子と呼ばれるコンテンツは、参照に許可されるリソースタイプの制限によって暗示される論理的な制約を満たす必要がある。たとえば、タイプがReference（Observation | DiagnosticReport）の場合、薬の処方箋の識別子を送信することは正当ではない。 Reference.identifierのユースケースの1つは、FHIR表現が存在しない状況である（タイプはReference（Any）である）。"
* subject.display ^short = "Text alternative for the resource　リソースの代替テキスト"
* subject.display ^definition = "Plain text narrative that identifies the resource in addition to the resource reference.\r\n\r\nリソース参照に加えてリソースを識別するプレーンテキストの説明。"
* subject.display ^comment = "This is generally not the same as the Resource.text of the referenced resource.  The purpose is to identify what's being referenced, not to fully describe it.\r\n\r\nこれは通常、参照されるリソースのResource.textと同じではない。目的は、参照されているものを特定することであり、完全に説明することではない。"
* context ^short = "Encounter or Episode of Care administered as part of　エンカウンター、または一部として実施されるケアエピソード"
* context ^definition = "The visit, admission, or other contact between patient and health care provider during which the medication administration was performed.\r\n\r\n投薬が行われた患者と医療提供者の間の訪問、入院、またはその他の接触。\r\n受診情報や入院情報を表すエンカウンターへの参照。"
* context ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* supportingInformation ^short = "Additional information to support administration　投与をサポートする追加情報"
* supportingInformation ^definition = "Additional information (for example, patient height and weight) that supports the administration of the medication.\r\n\r\n薬の投与をサポートする追加情報（たとえば、患者の身長や体重）。"
* supportingInformation ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* effective[x] only dateTime or Period
* effective[x] ^short = "Start and end time of administration　開始時間と終了時間"
* effective[x] ^definition = "A specific date/time or interval of time during which the administration took place (or did not take place, when the 'notGiven' attribute is true). For many administrations, such as swallowing a tablet the use of dateTime is more appropriate.\r\n\r\n投与が行われた（または「notGiven」属性がtrueの場合は行われなかった）特定の日時または時間間隔。錠剤を飲み込むなど、多くの管理では、dateTimeの使用がより適切である。"
* effective[x] ^comment = "\r\n投与実施日時であり、JP Coreでは必須である。"
* performer ^short = "Who performed the medication administration and what they did　投薬を実施した人"
* performer ^definition = "Indicates who or what performed the medication administration and how they were involved.\r\n投薬およびそれに関与した人"
* reasonCode ^short = "Reason administration performed　投薬が実施された理由"
* reasonCode ^definition = "A code indicating why the medication was given.\r\n投薬が実施された理由を示すコード"
* reasonReference ^short = "Condition or observation that supports why the medication was administered　薬が投与された理由を裏付ける状態または観察"
* reasonReference ^definition = "Condition or observation that supports why the medication was administered.\r\n\r\n薬が投与された理由を裏付ける状態または観察"
* reasonReference ^comment = "This is a reference to a condition that is the reason for the medication request.  If only a code exists, use reasonCode.\r\n\r\nこれは、投薬要求の理由である状態への参照。コードのみが存在する場合は、reasonCodeを使用する。"
* request ^short = "Request administration performed against　実施された元の投与依頼情報"
* request ^definition = "The original request, instruction or authority to perform the administration.\r\n\r\n投与を実行する元になった投与指示や権限への参照情報。"
* request ^comment = "This is a reference to the MedicationRequest  where the intent is either order or instance-order.  It should not reference MedicationRequests where the intent is any other value.\r\n\r\nこれは、orderまたはinstance-orderのいずれかであるMedicationRequestへの参照。インテントが他の値である場合は、MedicationRequestsを参照しないこと。"
* request ^requirements = "これは、インテント（意図）がorderまたはinstance-orderのいずれかであるMedicationRequestへの参照である。\r\nインテントが他の値である場合は、MedicationRequestsを参照しないこと。"
* device ^short = "Device used to administer　投与に使用されるデバイス"
* device ^definition = "The device used in administering the medication to the patient.  For example, a particular infusion pump.\r\n\r\n患者に薬を投与する際に使用されるデバイスへの参照。たとえば、特定の輸液ポンプ。"
* device ^comment = "References SHALL be a reference to an actual FHIR resource, and SHALL be resolvable (allowing for access control, temporary unavailability, etc.). Resolution can be either by retrieval from the URL, or, where applicable by resource type, by treating an absolute reference as a canonical URL and looking it up in a local registry/repository.\r\n\r\n参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* note ^short = "Information about the administration　投与に関する備考情報"
* note ^definition = "Extra information about the medication administration that is not conveyed by the other attributes.\r\n\r\n他の属性では伝えられない投薬管理に関する追加情報。"
* note ^comment = "For systems that do not have structured annotations, they can simply communicate a single annotation with no author or time.  This element may need to be included in narrative because of the potential for modifying information.  *Annotations SHOULD NOT* be used to communicate \"modifying\" information that could be computable. (This is a SHOULD because enforcing user behavior is nearly impossible).\r\n\r\n構造化された注釈情報がないシステムの場合、この要素によって作成者や作成時刻情報なしで単一の注釈を簡単に伝達できる。投与情報に付帯する潜在的な情報や修飾的な情報を伝えるために、この要素に叙述的な記述でそれらを含める必要がある場合がある。 \r\n*注釈は、計算可能な「変更」情報を伝達するために使用されるべきではない*。 （ユーザーの行動を強制することはほとんど不可能であるため、これはSHOULDである）。"
* dosage ^short = "Details of how medication was taken　薬の服用方法の詳細"
* dosage ^definition = "Describes the medication dosage information details e.g. dose, rate, site, route, etc.\r\n投薬量情報の詳細を説明する。線量、率、場所、ルートなど。"
* dosage.text ^short = "Free text dosage instructions e.g. SIG　フリーテキストの投与方法の説明　SIG:用法"
* dosage.text ^definition = "Free text dosage can be used for cases where the dosage administered is too complex to code. When coded dosage is present, the free text dosage may still be present for display to humans.\r\rThe dosage instructions should reflect the dosage of the medication that was administered.\r\n\r\nフリーテキストの投与量用法は、投与される投与量や用法が複雑すぎてコーディングできない場合に使用できる。コード化された投与量や用法が存在する場合、フリーテキストの投与量や用法は、人間に表示するためにまだ存在している可能性がある。\r\n投与量や用法のこの指示は、実際に投与される薬の投与量や用法を反映する必要がある。"
* dosage.site ^short = "Body site administered to　投与部位"
* dosage.site ^definition = "A coded specification of the anatomic site where the medication first entered the body.  For example, \"left arm\".\r\n\r\n薬が最初に体内に入った解剖学的部位のコード化された記述。たとえば、「左腕」。"
* dosage.site ^comment = "If the use case requires attributes from the BodySite resource (e.g. to identify and track separately) then use the standard extension [bodySite](extension-bodysite.html).  May be a summary code, or a reference to a very precise definition of the location, or both.\r\n\r\nユースケースでBodySiteリソースの属性が必要な場合（たとえば、個別に識別して追跡するため）、標準の拡張機能[bodySite]（extension-bodysite.html）を使用する。要約コード、または場所の非常に正確な定義への参照、あるいはその両方である可能性がある。"
* dosage.route ^short = "Path of substance into body　体への投与経路"
* dosage.route ^definition = "A code specifying the route or physiological path of administration of a therapeutic agent into or onto the patient.  For example, topical, intravenous, etc.\r\n\r\n患者への、または患者への治療薬の投与経路または生理学的経路を指定するコード。たとえば、局所、静脈内など。"
* dosage.route ^comment = "Not all terminology uses fit this general pattern. In some cases, models should not use CodeableConcept and use Coding directly and provide their own structure for managing text, codings, translations and the relationship between elements and pre- and post-coordination.\r\n\r\nすべてのターミノロジーの使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素間の関係とpre-coordinationとpost-coordinationの用語関係を管理するための独自の構造を提供する必要がある。"
* dosage.method ^short = "How drug was administered　投与方法"
* dosage.method ^definition = "A coded value indicating the method by which the medication is intended to be or was introduced into or on the body.  This attribute will most often NOT be populated.  It is most commonly used for injections.  For example, Slow Push, Deep IV.\r\n\r\n薬物が体内に導入されることを意図している、または体内に導入された方法を示すコード化された値。ほとんどの場合、この属性は入力されないが、注射では最も一般的に使用される。たとえば、スロープッシュ（ゆっくり注射）、ディープIV（深部静脈注射）。"
* dosage.method ^comment = "One of the reasons this attribute is not used often, is that the method is often pre-coordinated with the route and/or form of administration.  This means the codes used in route or form may pre-coordinate the method in the route code or the form code.  The implementation decision about what coding system to use for route or form code will determine how frequently the method code will be populated e.g. if route or form code pre-coordinate method code, then this attribute will not be populated often; if there is no pre-coordination then method code may  be used frequently.\r\n\r\nこの属性がふつう使用されない理由の1つは、メソッドが管理のルートや形式と事前に調整されていることが多いためである。これは、ルートまたはフォーム（剤型）で使用されるコードが、ルートコードまたは剤型コードによってメソッドが事前に決まる可能性があることを意味している。ルートコードまたは剤型コードに使用するコーディングシステムに関する実装の決定により、メソッドコードが入力される頻度が決まる。ルートコードまたは剤型コードによってメソッドコードが事前に決まる場合、この属性はふつう入力されない。決まらない場合は、メソッドコードが使用される可能性がある。"
* dosage.dose ^short = "Amount of medication per dose　用量あたりの投薬量"
* dosage.dose ^definition = "The amount of the medication given at one administration event.   Use this value when the administration is essentially an instantaneous event such as a swallowing a tablet or giving an injection.\r\n\r\n1回の投与イベントで投与される薬剤の量。この値は、投与が錠剤の飲み込みや注射などの本質的に瞬間的なイベントである場合に使用する。"
* dosage.rate[x] only Ratio or SimpleQuantity
* dosage.rate[x] ^short = "Dose quantity per unit of time　単位時間あたりの用量"
* dosage.rate[x] ^definition = "Identifies the speed with which the medication was or will be introduced into the patient.  Typically, the rate for an infusion e.g. 100 ml per 1 hour or 100 ml/hr.  May also be expressed as a rate per unit of time, e.g. 500 ml per 2 hours.  Other examples:  200 mcg/min or 200 mcg/1 minute; 1 liter/8 hours.\r\n\r\n薬が患者に導入された、または導入される予定の速度を識別する。\r\n通常、注入の速度。 1時間あたり100mlまたは100ml/時。単位時間あたりのレートとして表すこともできる。 2時間あたり500ml。その他の例：200mcg/分または200mcg/1分。 1リットル/8時間。"
* dosage.rate[x] ^comment = "If the rate changes over time, and you want to capture this in MedicationAdministration, then each change should be captured as a distinct MedicationAdministration, with a specific MedicationAdministration.dosage.rate, and the date time when the rate change occurred. Typically, the MedicationAdministration.dosage.rate element is not used to convey an average rate.\r\n\r\nレートが時間の経過とともに変化し、これをMedicationAdministrationで記述する場合は、各変更を、特定のMedicationAdministration.dosage.rateと、レート変更が発生した日時を使用して、個別のMedicationAdministrationとして記述する必要がある。通常、MedicationAdministration.dosage.rate要素は、平均レートを伝達するためには使用されない。"
* eventHistory ^short = "A list of events of interest in the lifecycle　ライフサイクルで関心のあるイベントのリスト"
* eventHistory ^definition = "A summary of the events of interest that have occurred, such as when the administration was verified.\r\n\r\n投与が確認されたときなど、発生した関連のあるベントのサマリー。"

* dosage.dose.code from $JP_MedicationUnitMERIT9_VS (preferred)

// ==============================
//   Extension 定義
// ==============================
Extension: JP_MedicationAdministration_Dosage_DosageComment
Id: jp-medicationadministration-dosage-dosagecomment
Title: "JP Core MedicationAdministration Dosage DosageComment Extension"
Description: "用法コメントを格納するための拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_DosageComment"
* ^date = "2022-03-16"
* ^context.type = #element
* ^context.expression = "MedicationAdministration.dosage"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_DosageComment" (exactly)
* value[x] only string or CodeableConcept
* value[x] from JP_MedicationExampleDosageComment_VS (example)

Extension: JP_MedicationAdministration_Dosage_LineComment
Id: jp-medicationadministration-dosage-linecomment
Title: "JP Core MedicationAdministration atDosage LineComment Extension"
Description: "ラインコメントを格納する"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_LineComment"
* ^date = "2022-03-16"
* ^context.type = #element
* ^context.expression = "MedicationAdministration.dosage"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_LineComment" (exactly)
* value[x] only string or CodeableConcept
* value[x] from JP_MedicationExampleLineComment_VS (example)

Extension: JP_MedicationAdministration_DosageMethod_MethodComment
Id: jp-medicationadministration-dosagemethod-methodcomment
Title: "JP Core MedicationAdministration DosageMethod MethodComment Extension"
Description: "手技コメントを格納するための拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageMethod_MethodComment"
* ^date = "2022-03-16"
* ^context.type = #element
* ^context.expression = "MedicationAdministration.dosage.method"
* . ^short = "手技コメント"
* . ^definition = "手技コメントを格納するための拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageMethod_MethodComment" (exactly)
* value[x] only string or CodeableConcept
* value[x] from JP_MedicationExampleMethodComment_VS (example)

Extension: JP_MedicationAdministration_DosageRate_RateComment
Id: jp-medicationadministration-dosagerate-ratecomment
Title: "JP Core MedicationAdministration DosageRate RateComment Extension"
Description: "投与速度コメントを格納するための拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageRate_RateComment"
* ^date = "2022-03-16"
* ^context.type = #element
* ^context.expression = "MedicationAdministration.dosage.rate[x]"
* . ^short = "投与速度コメント"
* . ^definition = "投与速度コメントを格納するための拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageRate_RateComment" (exactly)
* value[x] only string or CodeableConcept
* value[x] from JP_MedicationExampleRateComment_VS (example)

Extension: JP_MedicationAdministration_DosageRoute_RouteComment
Id: jp-medicationadministration-dosageroute-routecomment
Title: "JP Core MedicationAdministration DosageRoute RouteComment Extension"
Description: "投与経路コメントを格納するための拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageRoute_RouteComment"
* ^date = "2022-03-16"
* ^context.type = #element
* ^context.expression = "MedicationAdministration.dosage.route"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageRoute_RouteComment" (exactly)
* value[x] only string or CodeableConcept
* value[x] from JP_MedicationExampleRouteComment_VS (example)

Extension: JP_MedicationAdministration_DosageSite_SiteComment
Id: jp-medicationadministration-dosagesite-sitecomment
Title: "JP Core MedicationAdministration DosageSite SiteComment Extension"
Description: "投与部位コメントを格納するための拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageSite_SiteComment"
* ^date = "2022-03-16"
* ^context.type = #element
* ^context.expression = "MedicationAdministration.dosage.site"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageSite_SiteComment" (exactly)
* value[x] only string or CodeableConcept
* value[x] from JP_MedicationExampleSiteComment_VS (example)

Extension: JP_MedicationAdministration_Location
Id: jp-medicationadministration-location
Title: "JP Core MedicationAdministration Location Extension"
Description: "実施場所を格納するための拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location"
* ^date = "2022-03-16"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location" (exactly)
* value[x] only Reference(JP_Location)
* value[x] ^short = "実施場所"

Extension: JP_MedicationAdministration_RequestAuthoredOn
Id: jp-medicationadministration-requestauthoredon
Title: "JP Core MedicationAdministration RequestAuthoredOn Extension"
Description: "依頼日時を格納するための拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn"
* ^date = "2022-03-16"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn" (exactly)
* value[x] only dateTime

Extension: JP_MedicationAdministration_RequestDepartment
Id: jp-medicationadministration-requestdepartment
Title: "JP Core MedicationAdministration RequestDepartment Extension"
Description: "依頼科を格納するための拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment"
* ^date = "2022-03-16"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment" (exactly)
* value[x] only CodeableConcept
* valueCodeableConcept from $JP_Department_SsMix_VS (preferred)

Extension: JP_MedicationAdministration_Requester
Id: jp-medicationadministration-requester
Title: "JP Core MedicationAdministration Requester Extension"
Description: "依頼医を格納するための拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester"
* ^date = "2022-03-16"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester" (exactly)
* value[x] only Reference(JP_Practitioner)

Extension: JP_MedicationAdministration_UncategorizedComment
Id: jp-medicationadministration-uncategorizedcomment
Title: "JP Core MedicationAdministration UncategorizedComment Extension"
Description: "未分類コメントを格納するための拡張"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_UncategorizedComment"
* ^date = "2022-03-16"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* . ^short = "未分類コメント"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_UncategorizedComment" (exactly)
* value[x] only string or CodeableConcept
* valueCodeableConcept from $JP_MedicationExampleUncategorizedComment_VS (example)
