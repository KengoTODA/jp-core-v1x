// ==============================
//   Profile 定義
// ==============================
Profile: JP_Location
Parent: Location
Id: jp-location
Title: "JP Core Location Profile"
Description: "このプロファイルはLocationリソースに対して、所在場所のデータを送受信するための基礎となる制約と拡張を定めたものである。"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Location"
* ^status = #active
* ^date = "2023-06-26"
* . ^short = "物理的な場所の詳細情報と位置情報"
* . ^definition = "サービスが提供され、リソースとそれに関わる人たちが存在する物理的な場所の詳細情報と位置情報。"
* identifier ^short = "ユーザに場所を特定する一意のコードまたは番号"
* identifier ^definition = "ユーザに場所を特定する一意のコードまたは番号"
* identifier ^requirements = "登記内の組織ラベルの場所。これらを追跡する必要がある。"
* status ^short = "active | suspended | inactive / アクティブ|中断|非アクティブ"
* status ^definition = "statusプロパティは、operationStatus、またはロケーションに構成されている場合はスケジュール/スロットによってカバーされる可能性がある現在の値ではなく、リソースの一般的な可用性をカバーする。"
* status ^comment = "FHIR文字列はサイズが1MBを超えてはならないことに注意すること"
* operationalStatus ^short = "ロケーションの運用ステータス（通常、ベッド/部屋のみ）"
* operationalStatus ^definition = "稼働状況には、ベッドに最も関連する稼働値が含まれる（ただし、隔離ユニット/透析椅子などの部屋/ユニット/椅子などにも適用できる）。これは通常、汚染、ハウスキーピング、およびメンテナンスなどの他のアクティビティなどの概念をカバーしている。"
* operationalStatus ^comment = "コードは、SNOMED CTなどの非常に形式的な定義まで、列挙またはコードリストで非常にカジュアルに定義できる。詳細については、HL7 v3コア原則を参照すること。"
* name ^short = "人間が使用する場所の名前"
* name ^definition = "人間が使用する場所の名前。一意である必要はない。"
* name ^comment = "場所の名前が変更された場合は、古い名前をエイリアス列に入力して、検索で検索できるようにすることを検討すべきである。"
* alias ^short = "その場所が過去に知られていた、または以前から知られていた別名のリスト"
* alias ^definition = "その場所が過去に知られていた、または以前から知られていた別名のリスト"
* alias ^comment = "エイリアス/歴史的な名前に関連付けられた日付はない。これは、名前がいつ使用されたかを追跡するためではなく、古い名前でも場所を特定できるように検索を支援するためのものである。"
* alias ^requirements = "「時間の経過とともに、場所や組織は多くの変化を遂げ、さまざまな名前で知られるようになる。\r\n場所が知られている以前の名前を知っていることを検索することは非常に役に立つ。」"
* description ^short = "名前以外の場所を識別するための詳細情報として表示できる場所に関する追加の詳細"
* description ^definition = "場所の説明。場所の検索や参照に役立つ。"
* description ^comment = "FHIR文字列はサイズが1MBを超えてはならないことに注意すること"
* description ^requirements = "人間は、正しい場所が特定されたことを確認するために追加情報を必要とする。"
* mode ^short = "instance | kind / インスタンス|種類"
* mode ^definition = "リソースインスタンスが特定の場所を表すか、場所のクラスを表すかを示す。"
* mode ^comment = "ロケーションがロケーションのクラスであるかどうかによって、その使用方法と理解方法が変わるため、これは修飾子としてラベル付けされる。"
* mode ^requirements = "スケジュールや順番に場所リソースを使用する場合、特定の場所ではなく場所のクラスを参照できる必要がある。"
* type ^short = "実行される機能のタイプ"
* type ^definition = "その場所で実行される機能のタイプを示す。"
* type ^comment = "すべての用語の使用がこの一般的なパターンに適合するわけではない。場合によっては、モデルはCodeableConceptを使用せず、コーディングを直接使用して、テキスト、コーディング、翻訳、および要素と前後の調整間の関係を管理するための独自の構造を提供する必要がある。"
* telecom ^short = "所在地の連絡先"
* telecom ^definition = "その場所で利用可能な通信機器の連絡先。これには、電話番号、ファックス番号、携帯電話番号、電子メールアドレス、ウェブサイトなどが含まれる。"
* address ^short = "物理的な場所"
* address ^definition = "物理的な場所。"
* address ^comment = "追加のアドレスは、Location リソースの別のインスタンスを使用して記録するか、Organization を介して記録する必要がある。"
* address ^requirements = "場所が訪問できる場合は、住所を把握しておく必要がある。"
* physicalType ^short = "場所の物理的な形態"
* physicalType ^definition = "場所の物理的な形、例えば建物、部屋、車両、道路。"
* physicalType ^comment = "すべての用語の使用がこの一般的なパターンに適合するわけではない。いくつかのケースでは、モデルはCodeableConceptを使用せず、Codingを直接使用し、テキスト、コーディング、翻訳、要素間の関係、および前後の調整を管理するための独自の構造を提供することが望ましい。"
* physicalType ^requirements = "クエリで関連する場所を表示するためには、場所を分類する必要がある。"
* position ^short = "絶対的な地理的位置"
* position ^definition = "WGS84 データム（KML で使用されている座標系と同じ）を用いて表現された Location の絶対地理的位置。"
* position ^requirements = "モバイルアプリケーションや自動化されたルート検索では、位置情報の正確な位置を知る必要がある。"
* position.longitude ^short = "WGS84データの経度"
* position.longitude ^definition = "経度。値の領域及び解釈は、KML の longitude 要素のテキストと同様である（後述）。"
* position.longitude ^comment = "IEEE型の浮動小数点型は使用せず、真の10進数のように動作し、精度が組み込まれているものを使用すること（例：JavaのBigInteger）。"
* position.latitude ^short = "WGS84データの緯度"
* position.latitude ^definition = "緯度。値領域及び解釈は、KML の latitude 要素のテキストと同様である（後述）。"
* position.latitude ^comment = "IEEE型の浮動小数点型は使用せず、真の10進数のように動作し、精度が組み込まれているものを使用すること（例：JavaのBigInteger）。"
* position.altitude ^short = "WGS84データによる高度"
* position.altitude ^definition = "高度。値領域及び解釈は、KML の altitude 要素のテキストと同様である（後述）。"
* position.altitude ^comment = "IEEE型の浮動小数点型は使用せず、真の10進数のように動作し、精度が組み込まれているものを使用すること（例：JavaのBigInteger）。"
* managingOrganization only Reference(JP_Organization)
* managingOrganization ^short = "プロビジョニングと維持管理を担当する組織"
* managingOrganization ^definition = "場所のプロビジョニングと維持管理を担当する組織。"
* managingOrganization ^comment = "これは、この場所がサービスを提供する組織階層の一部として使用することもできる。これらのサービスは、HealthcareServiceリソースを介して定義することができる。"
* managingOrganization ^requirements = "場所を管理している人を知る必要がある。"
* partOf only Reference(JP_Location)
* partOf ^short = "この場所が物理的に存在するもう一つの場所"
* partOf ^definition = "この場所が物理的に存在するもう一つの場所。"
* partOf ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* partOf ^requirements = "位置情報、表示、識別のためには、他のどの場所の内部にどの場所があるかを知ることが重要である。"
* hoursOfOperation ^short = "この場所は通常、1週間のうち何日/時間帯に営業している"
* hoursOfOperation ^definition = "この場所が週に何日あるいは何時間オープンしているか。"
* hoursOfOperation ^comment = "この種の情報は、一般的にディレクトリやウェブサイトに掲載されており、施設が利用可能な時間帯を顧客に通知している。\r\nその場所の特定のサービスは、その場所の時間よりも短い（または長い）独自の時間を持っている場合がある。"
* hoursOfOperation.daysOfWeek ^short = "mon | tue | wed | thu | fri | sat | sun / 月｜火｜水｜木｜金｜土｜日"
* hoursOfOperation.daysOfWeek ^definition = "開始時刻と終了時刻の間に利用可能な曜日を示す。"
* hoursOfOperation.daysOfWeek ^comment = "FHIR文字列のサイズは1MBを超えてはならないことに注意すること。"
* hoursOfOperation.allDay ^short = "その場所は終日営業している"
* hoursOfOperation.allDay ^definition = "その場所は終日営業している。"
* hoursOfOperation.openingTime ^short = "場所が開く時間"
* hoursOfOperation.openingTime ^definition = "場所が開く時間"
* hoursOfOperation.closingTime ^short = "場所が閉まる時間"
* hoursOfOperation.closingTime ^definition = "場所が閉まる時間"
* availabilityExceptions ^short = "利用可能の例外についての説明"
* availabilityExceptions ^definition = "場所が私たちのものを開くときの説明は、通常、例えば、祝日の可用性とは異なる。\r\n営業時間に詳細な通常のサイトの利用可能性のすべての可能性のある例外を簡潔に説明する。"
* endpoint ^short = "場所のために運営されているサービスへのアクセスを提供する技術的なエンドポイント"
* endpoint ^definition = "場所のために運営されているサービスへのアクセスを提供する技術的なエンドポイント。"
* endpoint ^comment = "参照は、実際のFHIRリソースへの参照である必要があり、解決可能（内容に到達可能）である必要がある（アクセス制御、一時的な使用不可などを考慮に入れる）。解決は、URLから取得するか、リソースタイプによって該当する場合は、絶対参照を正規URLとして扱い、ローカルレジストリ/リポジトリで検索することによって行うことができる。"
* endpoint ^requirements = "組織は、さまざまなサービスを提供するさまざまな場所に異なるシステムを持っている可能性があり、それらに接続する方法や目的のための技術的な接続の詳細を定義できる必要がある。"