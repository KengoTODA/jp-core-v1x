### 日本人の人名表記に関する説明

- [nameRepresentationUse] のコードによって、以下のように区別する。
  - ABC ： 英語表記。日本語の場合、主にローマ字（ヘボン式）が格納される。
  - IDE ： 表意文字。主に漢字が使われる。
  - SYL ： 表音文字。全角カタカナで記載する。

<br/>

#### 各コードの書き方の例

|コード|text|family|given| 備考 |
| ---------------- | ------------- | ------ | ----------- | --- |
| IDE | 山田 太郎 | 山田 | 太郎 | 主に漢字が使われる。
| SYL | ヤマダ タロウ | ヤマダ | タロウ | 全角カタカナで記載する。
| ABC | YAMADA TARO | YAMADA | Taro | 日本語の場合、主にローマ字（ヘボン式）が格納される。

- [注意] text要素の姓と名の間には必ず半角スペースを入れること。