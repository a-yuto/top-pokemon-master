module Pokemon.AbilityData exposing (allAbilities, findAbilityById, findAbilityByName, Ability)

type alias Ability =
    { id : Int
    , name : String
    , englishName : String
    , description : String
    }

allAbilities : List Ability
allAbilities =
    [
    { id = 225
    , name = "ＡＲシステム"
    , englishName = "ＡＲシステム"
    , description = ""
    }
    , { id = 248
    , name = "アイスフェイス"
    , englishName = "アイスフェイス"
    , description = ""
    }
    , { id = 115
    , name = "アイスボディ"
    , englishName = "アイスボディ"
    , description = ""
    }
    , { id = 1
    , name = "あくしゅう"
    , englishName = "あくしゅう"
    , description = ""
    }
    , { id = 47
    , name = "あついしぼう"
    , englishName = "あついしぼう"
    , description = ""
    }
    , { id = 100
    , name = "あとだし"
    , englishName = "あとだし"
    , description = ""
    }
    , { id = 148
    , name = "アナライズ"
    , englishName = "アナライズ"
    , description = ""
    }
    , { id = 126
    , name = "あまのじゃく"
    , englishName = "あまのじゃく"
    , description = ""
    }
    , { id = 44
    , name = "あめうけざら"
    , englishName = "あめうけざら"
    , description = ""
    }
    , { id = 2
    , name = "あめふらし"
    , englishName = "あめふらし"
    , description = ""
    }
    , { id = 71
    , name = "ありじごく"
    , englishName = "ありじごく"
    , description = ""
    }
    , { id = 165
    , name = "アロマベール"
    , englishName = "アロマベール"
    , description = ""
    }
    , { id = 22
    , name = "いかく"
    , englishName = "いかく"
    , description = ""
    }
    , { id = 271
    , name = "いかりのこうら"
    , englishName = "いかりのこうら"
    , description = ""
    }
    , { id = 83
    , name = "いかりのつぼ"
    , englishName = "いかりのつぼ"
    , description = ""
    }
    , { id = 69
    , name = "いしあたま"
    , englishName = "いしあたま"
    , description = ""
    }
    , { id = 158
    , name = "いたずらごころ"
    , englishName = "いたずらごころ"
    , description = ""
    }
    , { id = 131
    , name = "いやしのこころ"
    , englishName = "いやしのこころ"
    , description = ""
    }
    , { id = 149
    , name = "イリュージョン"
    , englishName = "イリュージョン"
    , description = ""
    }
    , { id = 110
    , name = "いろめがね"
    , englishName = "いろめがね"
    , description = ""
    }
    , { id = 276
    , name = "いわはこび"
    , englishName = "いわはこび"
    , description = ""
    }
    , { id = 241
    , name = "うのミサイル"
    , englishName = "うのミサイル"
    , description = ""
    }
    , { id = 204
    , name = "うるおいボイス"
    , englishName = "うるおいボイス"
    , description = ""
    }
    , { id = 93
    , name = "うるおいボディ"
    , englishName = "うるおいボディ"
    , description = ""
    }
    , { id = 76
    , name = "エアロック"
    , englishName = "エアロック"
    , description = ""
    }
    , { id = 206
    , name = "エレキスキン"
    , englishName = "エレキスキン"
    , description = ""
    }
    , { id = 226
    , name = "エレキメイカー"
    , englishName = "エレキメイカー"
    , description = ""
    }
    , { id = 203
    , name = "えんかく"
    , englishName = "えんかく"
    , description = ""
    }
    , { id = 283
    , name = "おうごんのからだ"
    , englishName = "おうごんのからだ"
    , description = ""
    }
    , { id = 188
    , name = "オーラブレイク"
    , englishName = "オーラブレイク"
    , description = ""
    }
    , { id = 216
    , name = "おどりこ"
    , englishName = "おどりこ"
    , description = ""
    }
    , { id = 119
    , name = "おみとおし"
    , englishName = "おみとおし"
    , description = ""
    }
    , { id = 303
    , name = "おもかげやどし"
    , englishName = "おもかげやどし"
    , description = ""
    }
    , { id = 300
    , name = "おもてなし"
    , englishName = "おもてなし"
    , description = ""
    }
    , { id = 185
    , name = "おやこあい"
    , englishName = "おやこあい"
    , description = ""
    }
    , { id = 190
    , name = "おわりのだいち"
    , englishName = "おわりのだいち"
    , description = ""
    }
    , { id = 221
    , name = "カーリーヘアー"
    , englishName = "カーリーヘアー"
    , description = ""
    }
    , { id = 52
    , name = "かいりきバサミ"
    , englishName = "かいりきバサミ"
    , description = ""
    }
    , { id = 223
    , name = "かがくのちから"
    , englishName = "かがくのちから"
    , description = ""
    }
    , { id = 256
    , name = "かがくへんかガス"
    , englishName = "かがくへんかガス"
    , description = ""
    }
    , { id = 23
    , name = "かげふみ"
    , englishName = "かげふみ"
    , description = ""
    }
    , { id = 274
    , name = "かぜのり"
    , englishName = "かぜのり"
    , description = ""
    }
    , { id = 3
    , name = "かそく"
    , englishName = "かそく"
    , description = ""
    }
    , { id = 181
    , name = "かたいツメ"
    , englishName = "かたいツメ"
    , description = ""
    }
    , { id = 104
    , name = "かたやぶり"
    , englishName = "かたやぶり"
    , description = ""
    }
    , { id = 172
    , name = "かちき"
    , englishName = "かちき"
    , description = ""
    }
    , { id = 4
    , name = "カブトアーマー"
    , englishName = "カブトアーマー"
    , description = ""
    }
    , { id = 84
    , name = "かるわざ"
    , englishName = "かるわざ"
    , description = ""
    }
    , { id = 150
    , name = "かわりもの"
    , englishName = "かわりもの"
    , description = ""
    }
    , { id = 5
    , name = "がんじょう"
    , englishName = "がんじょう"
    , description = ""
    }
    , { id = 173
    , name = "がんじょうあご"
    , englishName = "がんじょうあご"
    , description = ""
    }
    , { id = 87
    , name = "かんそうはだ"
    , englishName = "かんそうはだ"
    , description = ""
    }
    , { id = 299
    , name = "かんろなミツ"
    , englishName = "かんろなミツ"
    , description = ""
    }
    , { id = 194
    , name = "ききかいひ"
    , englishName = "ききかいひ"
    , description = ""
    }
    , { id = 107
    , name = "きけんよち"
    , englishName = "きけんよち"
    , description = ""
    }
    , { id = 210
    , name = "きずなへんげ"
    , englishName = "きずなへんげ"
    , description = ""
    }
    , { id = 250
    , name = "ぎたい"
    , englishName = "ぎたい"
    , description = ""
    }
    , { id = 261
    , name = "きみょうなくすり"
    , englishName = "きみょうなくすり"
    , description = ""
    }
    , { id = 113
    , name = "きもったま"
    , englishName = "きもったま"
    , description = ""
    }
    , { id = 201
    , name = "ぎゃくじょう"
    , englishName = "ぎゃくじょう"
    , description = ""
    }
    , { id = 21
    , name = "きゅうばん"
    , englishName = "きゅうばん"
    , description = ""
    }
    , { id = 105
    , name = "きょううん"
    , englishName = "きょううん"
    , description = ""
    }
    , { id = 294
    , name = "きょうえん"
    , englishName = "きょうえん"
    , description = ""
    }
    , { id = 180
    , name = "きょうせい"
    , englishName = "きょうせい"
    , description = ""
    }
    , { id = 208
    , name = "ぎょぐん"
    , englishName = "ぎょぐん"
    , description = ""
    }
    , { id = 272
    , name = "きよめのしお"
    , englishName = "きよめのしお"
    , description = ""
    }
    , { id = 292
    , name = "きれあじ"
    , englishName = "きれあじ"
    , description = ""
    }
    , { id = 298
    , name = "きんしのちから"
    , englishName = "きんしのちから"
    , description = ""
    }
    , { id = 127
    , name = "きんちょうかん"
    , englishName = "きんちょうかん"
    , description = ""
    }
    , { id = 82
    , name = "くいしんぼう"
    , englishName = "くいしんぼう"
    , description = ""
    }
    , { id = 259
    , name = "クイックドロウ"
    , englishName = "クイックドロウ"
    , description = ""
    }
    , { id = 282
    , name = "クォークチャージ"
    , englishName = "クォークチャージ"
    , description = ""
    }
    , { id = 179
    , name = "くさのけがわ"
    , englishName = "くさのけがわ"
    , description = ""
    }
    , { id = 133
    , name = "くだけるよろい"
    , englishName = "くだけるよろい"
    , description = ""
    }
    , { id = 229
    , name = "グラスメイカー"
    , englishName = "グラスメイカー"
    , description = ""
    }
    , { id = 29
    , name = "クリアボディ"
    , englishName = "クリアボディ"
    , description = ""
    }
    , { id = 265
    , name = "くろのいななき"
    , englishName = "くろのいななき"
    , description = ""
    }
    , { id = 67
    , name = "げきりゅう"
    , englishName = "げきりゅう"
    , description = ""
    }
    , { id = 246
    , name = "こおりのりんぷん"
    , englishName = "こおりのりんぷん"
    , description = ""
    }
    , { id = 281
    , name = "こだいかっせい"
    , englishName = "こだいかっせい"
    , description = ""
    }
    , { id = 269
    , name = "こぼれダネ"
    , englishName = "こぼれダネ"
    , description = ""
    }
    , { id = 255
    , name = "ごりむちゅう"
    , englishName = "ごりむちゅう"
    , description = ""
    }
    , { id = 273
    , name = "こんがりボディ"
    , englishName = "こんがりボディ"
    , description = ""
    }
    , { id = 62
    , name = "こんじょう"
    , englishName = "こんじょう"
    , description = ""
    }
    , { id = 207
    , name = "サーフテール"
    , englishName = "サーフテール"
    , description = ""
    }
    , { id = 227
    , name = "サイコメイカー"
    , englishName = "サイコメイカー"
    , description = ""
    }
    , { id = 144
    , name = "さいせいりょく"
    , englishName = "さいせいりょく"
    , description = ""
    }
    , { id = 254
    , name = "さまようたましい"
    , englishName = "さまようたましい"
    , description = ""
    }
    , { id = 24
    , name = "さめはだ"
    , englishName = "さめはだ"
    , description = ""
    }
    , { id = 94
    , name = "サンパワー"
    , englishName = "サンパワー"
    , description = ""
    }
    , { id = 75
    , name = "シェルアーマー"
    , englishName = "シェルアーマー"
    , description = ""
    }
    , { id = 192
    , name = "じきゅうりょく"
    , englishName = "じきゅうりょく"
    , description = ""
    }
    , { id = 153
    , name = "じしんかじょう"
    , englishName = "じしんかじょう"
    , description = ""
    }
    , { id = 30
    , name = "しぜんかいふく"
    , englishName = "しぜんかいふく"
    , description = ""
    }
    , { id = 6
    , name = "しめりけ"
    , englishName = "しめりけ"
    , description = ""
    }
    , { id = 139
    , name = "しゅうかく"
    , englishName = "しゅうかく"
    , description = ""
    }
    , { id = 7
    , name = "じゅうなん"
    , englishName = "じゅうなん"
    , description = ""
    }
    , { id = 247
    , name = "じゅくせい"
    , englishName = "じゅくせい"
    , description = ""
    }
    , { id = 243
    , name = "じょうききかん"
    , englishName = "じょうききかん"
    , description = ""
    }
    , { id = 162
    , name = "しょうりのほし"
    , englishName = "しょうりのほし"
    , description = ""
    }
    , { id = 214
    , name = "じょおうのいげん"
    , englishName = "じょおうのいげん"
    , description = ""
    }
    , { id = 42
    , name = "じりょく"
    , englishName = "じりょく"
    , description = ""
    }
    , { id = 279
    , name = "しれいとう"
    , englishName = "しれいとう"
    , description = ""
    }
    , { id = 73
    , name = "しろいけむり"
    , englishName = "しろいけむり"
    , description = ""
    }
    , { id = 264
    , name = "しろのいななき"
    , englishName = "しろのいななき"
    , description = ""
    }
    , { id = 301
    , name = "しんがん"
    , englishName = "しんがん"
    , description = ""
    }
    , { id = 28
    , name = "シンクロ"
    , englishName = "シンクロ"
    , description = ""
    }
    , { id = 266
    , name = "じんばいったい"
    , englishName = "じんばいったい"
    , description = ""
    }
    , { id = 65
    , name = "しんりょく"
    , englishName = "しんりょく"
    , description = ""
    }
    , { id = 175
    , name = "スイートベール"
    , englishName = "スイートベール"
    , description = ""
    }
    , { id = 33
    , name = "すいすい"
    , englishName = "すいすい"
    , description = ""
    }
    , { id = 199
    , name = "すいほう"
    , englishName = "すいほう"
    , description = ""
    }
    , { id = 184
    , name = "スカイスキン"
    , englishName = "スカイスキン"
    , description = ""
    }
    , { id = 92
    , name = "スキルリンク"
    , englishName = "スキルリンク"
    , description = ""
    }
    , { id = 239
    , name = "スクリューおびれ"
    , englishName = "スクリューおびれ"
    , description = ""
    }
    , { id = 242
    , name = "すじがねいり"
    , englishName = "すじがねいり"
    , description = ""
    }
    , { id = 120
    , name = "すてみ"
    , englishName = "すてみ"
    , description = ""
    }
    , { id = 97
    , name = "スナイパー"
    , englishName = "スナイパー"
    , description = ""
    }
    , { id = 45
    , name = "すなおこし"
    , englishName = "すなおこし"
    , description = ""
    }
    , { id = 146
    , name = "すなかき"
    , englishName = "すなかき"
    , description = ""
    }
    , { id = 8
    , name = "すながくれ"
    , englishName = "すながくれ"
    , description = ""
    }
    , { id = 159
    , name = "すなのちから"
    , englishName = "すなのちから"
    , description = ""
    }
    , { id = 245
    , name = "すなはき"
    , englishName = "すなはき"
    , description = ""
    }
    , { id = 151
    , name = "すりぬけ"
    , englishName = "すりぬけ"
    , description = ""
    }
    , { id = 51
    , name = "するどいめ"
    , englishName = "するどいめ"
    , description = ""
    }
    , { id = 112
    , name = "スロースタート"
    , englishName = "スロースタート"
    , description = ""
    }
    , { id = 211
    , name = "スワームチェンジ"
    , englishName = "スワームチェンジ"
    , description = ""
    }
    , { id = 154
    , name = "せいぎのこころ"
    , englishName = "せいぎのこころ"
    , description = ""
    }
    , { id = 39
    , name = "せいしんりょく"
    , englishName = "せいしんりょく"
    , description = ""
    }
    , { id = 9
    , name = "せいでんき"
    , englishName = "せいでんき"
    , description = ""
    }
    , { id = 213
    , name = "ぜったいねむり"
    , englishName = "ぜったいねむり"
    , description = ""
    }
    , { id = 306
    , name = "ゼロフォーミング"
    , englishName = "ゼロフォーミング"
    , description = ""
    }
    , { id = 157
    , name = "そうしょく"
    , englishName = "そうしょく"
    , description = ""
    }
    , { id = 293
    , name = "そうだいしょう"
    , englishName = "そうだいしょう"
    , description = ""
    }
    , { id = 220
    , name = "ソウルハート"
    , englishName = "ソウルハート"
    , description = ""
    }
    , { id = 186
    , name = "ダークオーラ"
    , englishName = "ダークオーラ"
    , description = ""
    }
    , { id = 163
    , name = "ターボブレイズ"
    , englishName = "ターボブレイズ"
    , description = ""
    }
    , { id = 85
    , name = "たいねつ"
    , englishName = "たいねつ"
    , description = ""
    }
    , { id = 88
    , name = "ダウンロード"
    , englishName = "ダウンロード"
    , description = ""
    }
    , { id = 61
    , name = "だっぴ"
    , englishName = "だっぴ"
    , description = ""
    }
    , { id = 237
    , name = "たまひろい"
    , englishName = "たまひろい"
    , description = ""
    }
    , { id = 161
    , name = "ダルマモード"
    , englishName = "ダルマモード"
    , description = ""
    }
    , { id = 86
    , name = "たんじゅん"
    , englishName = "たんじゅん"
    , description = ""
    }
    , { id = 125
    , name = "ちからずく"
    , englishName = "ちからずく"
    , description = ""
    }
    , { id = 37
    , name = "ちからもち"
    , englishName = "ちからもち"
    , description = ""
    }
    , { id = 10
    , name = "ちくでん"
    , englishName = "ちくでん"
    , description = ""
    }
    , { id = 77
    , name = "ちどりあし"
    , englishName = "ちどりあし"
    , description = ""
    }
    , { id = 11
    , name = "ちょすい"
    , englishName = "ちょすい"
    , description = ""
    }
    , { id = 296
    , name = "テイルアーマー"
    , englishName = "テイルアーマー"
    , description = ""
    }
    , { id = 91
    , name = "てきおうりょく"
    , englishName = "てきおうりょく"
    , description = ""
    }
    , { id = 101
    , name = "テクニシャン"
    , englishName = "テクニシャン"
    , description = ""
    }
    , { id = 89
    , name = "てつのこぶし"
    , englishName = "てつのこぶし"
    , description = ""
    }
    , { id = 160
    , name = "てつのトゲ"
    , englishName = "てつのトゲ"
    , description = ""
    }
    , { id = 305
    , name = "テラスシェル"
    , englishName = "テラスシェル"
    , description = ""
    }
    , { id = 304
    , name = "テラスチェンジ"
    , englishName = "テラスチェンジ"
    , description = ""
    }
    , { id = 164
    , name = "テラボルテージ"
    , englishName = "テラボルテージ"
    , description = ""
    }
    , { id = 191
    , name = "デルタストリーム"
    , englishName = "デルタストリーム"
    , description = ""
    }
    , { id = 140
    , name = "テレパシー"
    , englishName = "テレパシー"
    , description = ""
    }
    , { id = 78
    , name = "でんきエンジン"
    , englishName = "でんきエンジン"
    , description = ""
    }
    , { id = 280
    , name = "でんきにかえる"
    , englishName = "でんきにかえる"
    , description = ""
    }
    , { id = 59
    , name = "てんきや"
    , englishName = "てんきや"
    , description = ""
    }
    , { id = 109
    , name = "てんねん"
    , englishName = "てんねん"
    , description = ""
    }
    , { id = 32
    , name = "てんのめぐみ"
    , englishName = "てんのめぐみ"
    , description = ""
    }
    , { id = 79
    , name = "とうそうしん"
    , englishName = "とうそうしん"
    , description = ""
    }
    , { id = 307
    , name = "どくくぐつ"
    , englishName = "どくくぐつ"
    , description = ""
    }
    , { id = 295
    , name = "どくげしょう"
    , englishName = "どくげしょう"
    , description = ""
    }
    , { id = 143
    , name = "どくしゅ"
    , englishName = "どくしゅ"
    , description = ""
    }
    , { id = 302
    , name = "どくのくさり"
    , englishName = "どくのくさり"
    , description = ""
    }
    , { id = 38
    , name = "どくのトゲ"
    , englishName = "どくのトゲ"
    , description = ""
    }
    , { id = 137
    , name = "どくぼうそう"
    , englishName = "どくぼうそう"
    , description = ""
    }
    , { id = 297
    , name = "どしょく"
    , englishName = "どしょく"
    , description = ""
    }
    , { id = 215
    , name = "とびだすなかみ"
    , englishName = "とびだすなかみ"
    , description = ""
    }
    , { id = 262
    , name = "トランジスタ"
    , englishName = "トランジスタ"
    , description = ""
    }
    , { id = 36
    , name = "トレース"
    , englishName = "トレース"
    , description = ""
    }
    , { id = 268
    , name = "とれないにおい"
    , englishName = "とれないにおい"
    , description = ""
    }
    , { id = 12
    , name = "どんかん"
    , englishName = "どんかん"
    , description = ""
    }
    , { id = 123
    , name = "ナイトメア"
    , englishName = "ナイトメア"
    , description = ""
    }
    , { id = 54
    , name = "なまけ"
    , englishName = "なまけ"
    , description = ""
    }
    , { id = 50
    , name = "にげあし"
    , englishName = "にげあし"
    , description = ""
    }
    , { id = 193
    , name = "にげごし"
    , englishName = "にげごし"
    , description = ""
    }
    , { id = 183
    , name = "ぬめぬめ"
    , englishName = "ぬめぬめ"
    , description = ""
    }
    , { id = 270
    , name = "ねつこうかん"
    , englishName = "ねつこうかん"
    , description = ""
    }
    , { id = 138
    , name = "ねつぼうそう"
    , englishName = "ねつぼうそう"
    , description = ""
    }
    , { id = 60
    , name = "ねんちゃく"
    , englishName = "ねんちゃく"
    , description = ""
    }
    , { id = 99
    , name = "ノーガード"
    , englishName = "ノーガード"
    , description = ""
    }
    , { id = 13
    , name = "ノーてんき"
    , englishName = "ノーてんき"
    , description = ""
    }
    , { id = 96
    , name = "ノーマルスキン"
    , englishName = "ノーマルスキン"
    , description = ""
    }
    , { id = 130
    , name = "のろわれボディ"
    , englishName = "のろわれボディ"
    , description = ""
    }
    , { id = 116
    , name = "ハードロック"
    , englishName = "ハードロック"
    , description = ""
    }
    , { id = 200
    , name = "はがねつかい"
    , englishName = "はがねつかい"
    , description = ""
    }
    , { id = 252
    , name = "はがねのせいしん"
    , englishName = "はがねのせいしん"
    , description = ""
    }
    , { id = 209
    , name = "ばけのかわ"
    , englishName = "ばけのかわ"
    , description = ""
    }
    , { id = 189
    , name = "はじまりのうみ"
    , englishName = "はじまりのうみ"
    , description = ""
    }
    , { id = 257
    , name = "パステルベール"
    , englishName = "パステルベール"
    , description = ""
    }
    , { id = 35
    , name = "はっこう"
    , englishName = "はっこう"
    , description = ""
    }
    , { id = 217
    , name = "バッテリー"
    , englishName = "バッテリー"
    , description = ""
    }
    , { id = 145
    , name = "はとむね"
    , englishName = "はとむね"
    , description = ""
    }
    , { id = 176
    , name = "バトルスイッチ"
    , englishName = "バトルスイッチ"
    , description = ""
    }
    , { id = 289
    , name = "ハドロンエンジン"
    , englishName = "ハドロンエンジン"
    , description = ""
    }
    , { id = 95
    , name = "はやあし"
    , englishName = "はやあし"
    , description = ""
    }
    , { id = 48
    , name = "はやおき"
    , englishName = "はやおき"
    , description = ""
    }
    , { id = 177
    , name = "はやてのつばさ"
    , englishName = "はやてのつばさ"
    , description = ""
    }
    , { id = 258
    , name = "はらぺこスイッチ"
    , englishName = "はらぺこスイッチ"
    , description = ""
    }
    , { id = 251
    , name = "バリアフリー"
    , englishName = "バリアフリー"
    , description = ""
    }
    , { id = 55
    , name = "はりきり"
    , englishName = "はりきり"
    , description = ""
    }
    , { id = 198
    , name = "はりこみ"
    , englishName = "はりこみ"
    , description = ""
    }
    , { id = 249
    , name = "パワースポット"
    , englishName = "パワースポット"
    , description = ""
    }
    , { id = 244
    , name = "パンクロック"
    , englishName = "パンクロック"
    , description = ""
    }
    , { id = 275
    , name = "ばんけん"
    , englishName = "ばんけん"
    , description = ""
    }
    , { id = 291
    , name = "はんすう"
    , englishName = "はんすう"
    , description = ""
    }
    , { id = 224
    , name = "ビーストブースト"
    , englishName = "ビーストブースト"
    , description = ""
    }
    , { id = 205
    , name = "ヒーリングシフト"
    , englishName = "ヒーリングシフト"
    , description = ""
    }
    , { id = 70
    , name = "ひでり"
    , englishName = "ひでり"
    , description = ""
    }
    , { id = 196
    , name = "ひとでなし"
    , englishName = "ひとでなし"
    , description = ""
    }
    , { id = 288
    , name = "ひひいろのこどう"
    , englishName = "ひひいろのこどう"
    , description = ""
    }
    , { id = 219
    , name = "ビビッドボディ"
    , englishName = "ビビッドボディ"
    , description = ""
    }
    , { id = 155
    , name = "びびり"
    , englishName = "びびり"
    , description = ""
    }
    , { id = 31
    , name = "ひらいしん"
    , englishName = "ひらいしん"
    , description = ""
    }
    , { id = 290
    , name = "びんじょう"
    , englishName = "びんじょう"
    , description = ""
    }
    , { id = 169
    , name = "ファーコート"
    , englishName = "ファーコート"
    , description = ""
    }
    , { id = 231
    , name = "ファントムガード"
    , englishName = "ファントムガード"
    , description = ""
    }
    , { id = 111
    , name = "フィルター"
    , englishName = "フィルター"
    , description = ""
    }
    , { id = 277
    , name = "ふうりょくでんき"
    , englishName = "ふうりょくでんき"
    , description = ""
    }
    , { id = 187
    , name = "フェアリーオーラ"
    , englishName = "フェアリーオーラ"
    , description = ""
    }
    , { id = 182
    , name = "フェアリースキン"
    , englishName = "フェアリースキン"
    , description = ""
    }
    , { id = 260
    , name = "ふかしのこぶし"
    , englishName = "ふかしのこぶし"
    , description = ""
    }
    , { id = 103
    , name = "ぶきよう"
    , englishName = "ぶきよう"
    , description = ""
    }
    , { id = 14
    , name = "ふくがん"
    , englishName = "ふくがん"
    , description = ""
    }
    , { id = 80
    , name = "ふくつのこころ"
    , englishName = "ふくつのこころ"
    , description = ""
    }
    , { id = 235
    , name = "ふくつのたて"
    , englishName = "ふくつのたて"
    , description = ""
    }
    , { id = 63
    , name = "ふしぎなうろこ"
    , englishName = "ふしぎなうろこ"
    , description = ""
    }
    , { id = 25
    , name = "ふしぎなまもり"
    , englishName = "ふしぎなまもり"
    , description = ""
    }
    , { id = 212
    , name = "ふしょく"
    , englishName = "ふしょく"
    , description = ""
    }
    , { id = 234
    , name = "ふとうのけん"
    , englishName = "ふとうのけん"
    , description = ""
    }
    , { id = 15
    , name = "ふみん"
    , englishName = "ふみん"
    , description = ""
    }
    , { id = 26
    , name = "ふゆう"
    , englishName = "ふゆう"
    , description = ""
    }
    , { id = 57
    , name = "プラス"
    , englishName = "プラス"
    , description = ""
    }
    , { id = 122
    , name = "フラワーギフト"
    , englishName = "フラワーギフト"
    , description = ""
    }
    , { id = 166
    , name = "フラワーベール"
    , englishName = "フラワーベール"
    , description = ""
    }
    , { id = 174
    , name = "フリーズスキン"
    , englishName = "フリーズスキン"
    , description = ""
    }
    , { id = 232
    , name = "プリズムアーマー"
    , englishName = "プリズムアーマー"
    , description = ""
    }
    , { id = 233
    , name = "ブレインフォース"
    , englishName = "ブレインフォース"
    , description = ""
    }
    , { id = 46
    , name = "プレッシャー"
    , englishName = "プレッシャー"
    , description = ""
    }
    , { id = 132
    , name = "フレンドガード"
    , englishName = "フレンドガード"
    , description = ""
    }
    , { id = 134
    , name = "ヘヴィメタル"
    , englishName = "ヘヴィメタル"
    , description = ""
    }
    , { id = 64
    , name = "ヘドロえき"
    , englishName = "ヘドロえき"
    , description = ""
    }
    , { id = 168
    , name = "へんげんじざい"
    , englishName = "へんげんじざい"
    , description = ""
    }
    , { id = 16
    , name = "へんしょく"
    , englishName = "へんしょく"
    , description = ""
    }
    , { id = 90
    , name = "ポイズンヒール"
    , englishName = "ポイズンヒール"
    , description = ""
    }
    , { id = 43
    , name = "ぼうおん"
    , englishName = "ぼうおん"
    , description = ""
    }
    , { id = 27
    , name = "ほうし"
    , englishName = "ほうし"
    , description = ""
    }
    , { id = 142
    , name = "ぼうじん"
    , englishName = "ぼうじん"
    , description = ""
    }
    , { id = 171
    , name = "ぼうだん"
    , englishName = "ぼうだん"
    , description = ""
    }
    , { id = 167
    , name = "ほおぶくろ"
    , englishName = "ほおぶくろ"
    , description = ""
    }
    , { id = 49
    , name = "ほのおのからだ"
    , englishName = "ほのおのからだ"
    , description = ""
    }
    , { id = 253
    , name = "ほろびのボディ"
    , englishName = "ほろびのボディ"
    , description = ""
    }
    , { id = 278
    , name = "マイティチェンジ"
    , englishName = "マイティチェンジ"
    , description = ""
    }
    , { id = 58
    , name = "マイナス"
    , englishName = "マイナス"
    , description = ""
    }
    , { id = 20
    , name = "マイペース"
    , englishName = "マイペース"
    , description = ""
    }
    , { id = 40
    , name = "マグマのよろい"
    , englishName = "マグマのよろい"
    , description = ""
    }
    , { id = 128
    , name = "まけんき"
    , englishName = "まけんき"
    , description = ""
    }
    , { id = 170
    , name = "マジシャン"
    , englishName = "マジシャン"
    , description = ""
    }
    , { id = 98
    , name = "マジックガード"
    , englishName = "マジックガード"
    , description = ""
    }
    , { id = 156
    , name = "マジックミラー"
    , englishName = "マジックミラー"
    , description = ""
    }
    , { id = 136
    , name = "マルチスケイル"
    , englishName = "マルチスケイル"
    , description = ""
    }
    , { id = 121
    , name = "マルチタイプ"
    , englishName = "マルチタイプ"
    , description = ""
    }
    , { id = 152
    , name = "ミイラ"
    , englishName = "ミイラ"
    , description = ""
    }
    , { id = 195
    , name = "みずがため"
    , englishName = "みずがため"
    , description = ""
    }
    , { id = 228
    , name = "ミストメイカー"
    , englishName = "ミストメイカー"
    , description = ""
    }
    , { id = 41
    , name = "みずのベール"
    , englishName = "みずのベール"
    , description = ""
    }
    , { id = 118
    , name = "みつあつめ"
    , englishName = "みつあつめ"
    , description = ""
    }
    , { id = 240
    , name = "ミラーアーマー"
    , englishName = "ミラーアーマー"
    , description = ""
    }
    , { id = 147
    , name = "ミラクルスキン"
    , englishName = "ミラクルスキン"
    , description = ""
    }
    , { id = 68
    , name = "むしのしらせ"
    , englishName = "むしのしらせ"
    , description = ""
    }
    , { id = 141
    , name = "ムラっけ"
    , englishName = "ムラっけ"
    , description = ""
    }
    , { id = 178
    , name = "メガランチャー"
    , englishName = "メガランチャー"
    , description = ""
    }
    , { id = 230
    , name = "メタルプロテクト"
    , englishName = "メタルプロテクト"
    , description = ""
    }
    , { id = 56
    , name = "メロメロボディ"
    , englishName = "メロメロボディ"
    , description = ""
    }
    , { id = 17
    , name = "めんえき"
    , englishName = "めんえき"
    , description = ""
    }
    , { id = 66
    , name = "もうか"
    , englishName = "もうか"
    , description = ""
    }
    , { id = 53
    , name = "ものひろい"
    , englishName = "ものひろい"
    , description = ""
    }
    , { id = 218
    , name = "もふもふ"
    , englishName = "もふもふ"
    , description = ""
    }
    , { id = 18
    , name = "もらいび"
    , englishName = "もらいび"
    , description = ""
    }
    , { id = 72
    , name = "やるき"
    , englishName = "やるき"
    , description = ""
    }
    , { id = 106
    , name = "ゆうばく"
    , englishName = "ゆうばく"
    , description = ""
    }
    , { id = 202
    , name = "ゆきかき"
    , englishName = "ゆきかき"
    , description = ""
    }
    , { id = 81
    , name = "ゆきがくれ"
    , englishName = "ゆきがくれ"
    , description = ""
    }
    , { id = 117
    , name = "ゆきふらし"
    , englishName = "ゆきふらし"
    , description = ""
    }
    , { id = 34
    , name = "ようりょくそ"
    , englishName = "ようりょくそ"
    , description = ""
    }
    , { id = 74
    , name = "ヨガパワー"
    , englishName = "ヨガパワー"
    , description = ""
    }
    , { id = 108
    , name = "よちむ"
    , englishName = "よちむ"
    , description = ""
    }
    , { id = 114
    , name = "よびみず"
    , englishName = "よびみず"
    , description = ""
    }
    , { id = 129
    , name = "よわき"
    , englishName = "よわき"
    , description = ""
    }
    , { id = 135
    , name = "ライトメタル"
    , englishName = "ライトメタル"
    , description = ""
    }
    , { id = 102
    , name = "リーフガード"
    , englishName = "リーフガード"
    , description = ""
    }
    , { id = 236
    , name = "リベロ"
    , englishName = "リベロ"
    , description = ""
    }
    , { id = 197
    , name = "リミットシールド"
    , englishName = "リミットシールド"
    , description = ""
    }
    , { id = 263
    , name = "りゅうのあぎと"
    , englishName = "りゅうのあぎと"
    , description = ""
    }
    , { id = 19
    , name = "りんぷん"
    , englishName = "りんぷん"
    , description = ""
    }
    , { id = 222
    , name = "レシーバー"
    , englishName = "レシーバー"
    , description = ""
    }
    , { id = 284
    , name = "わざわいのうつわ"
    , englishName = "わざわいのうつわ"
    , description = ""
    }
    , { id = 286
    , name = "わざわいのおふだ"
    , englishName = "わざわいのおふだ"
    , description = ""
    }
    , { id = 287
    , name = "わざわいのたま"
    , englishName = "わざわいのたま"
    , description = ""
    }
    , { id = 285
    , name = "わざわいのつるぎ"
    , englishName = "わざわいのつるぎ"
    , description = ""
    }
    , { id = 238
    , name = "わたげ"
    , englishName = "わたげ"
    , description = ""
    }
    , { id = 124
    , name = "わるいてぐせ"
    , englishName = "わるいてぐせ"
    , description = ""
    }
    ]


findAbilityById : Int -> Maybe Ability
findAbilityById id =
    allAbilities
        |> List.filter (\ability -> ability.id == id)
        |> List.head


findAbilityByName : String -> Maybe Ability
findAbilityByName name =
    allAbilities
        |> List.filter (\ability -> ability.name == name)
        |> List.head
