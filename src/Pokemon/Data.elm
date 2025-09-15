module Pokemon.Data exposing (allPokemon, findPokemonById, findPokemonByName)

import Pokemon.Types exposing (Pokemon, PokemonType(..), Stats, Evolution, EvolutionMethod(..))


allPokemon : List Pokemon
allPokemon =
    [
    { id = 567
    , name = "アーケオス"
    , englishName = "アーケオス"
    , pokemonType = FlyingRock
    , stats = { hp = 75, attack = 140, defense = 65, specialAttack = 112, specialDefense = 65, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 566
    , name = "アーケン"
    , englishName = "アーケン"
    , pokemonType = FlyingRock
    , stats = { hp = 55, attack = 112, defense = 45, specialAttack = 74, specialDefense = 45, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 804
    , name = "アーゴヨン"
    , englishName = "アーゴヨン"
    , pokemonType = PoisonDragon
    , stats = { hp = 73, attack = 73, defense = 73, specialAttack = 127, specialDefense = 73, speed = 121 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 23
    , name = "アーボ"
    , englishName = "アーボ"
    , pokemonType = PoisonType
    , stats = { hp = 35, attack = 60, defense = 44, specialAttack = 40, specialDefense = 54, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 24
    , name = "アーボック"
    , englishName = "アーボック"
    , pokemonType = PoisonType
    , stats = { hp = 60, attack = 95, defense = 69, specialAttack = 65, specialDefense = 79, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 823
    , name = "アーマーガア"
    , englishName = "アーマーガア"
    , pokemonType = FlyingSteel
    , stats = { hp = 98, attack = 87, defense = 105, specialAttack = 53, specialDefense = 85, speed = 67 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 348
    , name = "アーマルド"
    , englishName = "アーマルド"
    , pokemonType = BugRock
    , stats = { hp = 75, attack = 125, defense = 100, specialAttack = 70, specialDefense = 80, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 632
    , name = "アイアント"
    , englishName = "アイアント"
    , pokemonType = BugSteel
    , stats = { hp = 58, attack = 109, defense = 112, specialAttack = 48, specialDefense = 48, speed = 109 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 822
    , name = "アオガラス"
    , englishName = "アオガラス"
    , pokemonType = FlyingType
    , stats = { hp = 68, attack = 67, defense = 55, specialAttack = 43, specialDefense = 55, speed = 77 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 617
    , name = "アギルダー"
    , englishName = "アギルダー"
    , pokemonType = BugType
    , stats = { hp = 80, attack = 70, defense = 40, specialAttack = 100, specialDefense = 60, speed = 145 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 799
    , name = "アクジキング"
    , englishName = "アクジキング"
    , pokemonType = DragonDark
    , stats = { hp = 223, attack = 101, defense = 53, specialAttack = 97, specialDefense = 53, speed = 43 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 482
    , name = "アグノム"
    , englishName = "アグノム"
    , pokemonType = PsychicType
    , stats = { hp = 75, attack = 125, defense = 70, specialAttack = 125, specialDefense = 70, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 267
    , name = "アゲハント"
    , englishName = "アゲハント"
    , pokemonType = FlyingBug
    , stats = { hp = 60, attack = 70, defense = 50, specialAttack = 100, specialDefense = 50, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 736
    , name = "アゴジムシ"
    , englishName = "アゴジムシ"
    , pokemonType = BugType
    , stats = { hp = 47, attack = 62, defense = 45, specialAttack = 55, specialDefense = 45, speed = 46 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 307
    , name = "アサナン"
    , englishName = "アサナン"
    , pokemonType = FightingPsychic
    , stats = { hp = 30, attack = 40, defense = 55, specialAttack = 40, specialDefense = 55, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 728
    , name = "アシマリ"
    , englishName = "アシマリ"
    , pokemonType = WaterType
    , stats = { hp = 50, attack = 54, defense = 54, specialAttack = 66, specialDefense = 56, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 730
    , name = "アシレーヌ"
    , englishName = "アシレーヌ"
    , pokemonType = WaterFairy
    , stats = { hp = 80, attack = 74, defense = 74, specialAttack = 126, specialDefense = 116, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 119
    , name = "アズマオウ"
    , englishName = "アズマオウ"
    , pokemonType = WaterType
    , stats = { hp = 80, attack = 92, defense = 65, specialAttack = 65, specialDefense = 80, speed = 68 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 910
    , name = "アチゲータ"
    , englishName = "アチゲータ"
    , pokemonType = FireType
    , stats = { hp = 81, attack = 55, defense = 78, specialAttack = 90, specialDefense = 58, speed = 49 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 255
    , name = "アチャモ"
    , englishName = "アチャモ"
    , pokemonType = FireType
    , stats = { hp = 45, attack = 60, defense = 40, specialAttack = 70, specialDefense = 50, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 841
    , name = "アップリュー"
    , englishName = "アップリュー"
    , pokemonType = GrassDragon
    , stats = { hp = 70, attack = 110, defense = 80, specialAttack = 95, specialDefense = 60, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 974
    , name = "アノクサ"
    , englishName = "アノクサ"
    , pokemonType = GrassGhost
    , stats = { hp = 40, attack = 65, defense = 30, specialAttack = 45, specialDefense = 35, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 347
    , name = "アノプス"
    , englishName = "アノプス"
    , pokemonType = BugRock
    , stats = { hp = 45, attack = 95, defense = 50, specialAttack = 40, specialDefense = 50, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 975
    , name = "アノホラグサ"
    , englishName = "アノホラグサ"
    , pokemonType = GrassGhost
    , stats = { hp = 55, attack = 115, defense = 70, specialAttack = 80, specialDefense = 70, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 565
    , name = "アバゴーラ"
    , englishName = "アバゴーラ"
    , pokemonType = WaterRock
    , stats = { hp = 74, attack = 108, defense = 133, specialAttack = 83, specialDefense = 65, speed = 32 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 359
    , name = "アブソル"
    , englishName = "アブソル"
    , pokemonType = DarkType
    , stats = { hp = 65, attack = 130, defense = 60, specialAttack = 75, specialDefense = 60, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10057
    , name = "アブソル(メガ)"
    , englishName = "アブソル(メガ)"
    , pokemonType = DarkType
    , stats = { hp = 65, attack = 150, defense = 60, specialAttack = 115, specialDefense = 60, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 742
    , name = "アブリー"
    , englishName = "アブリー"
    , pokemonType = BugFairy
    , stats = { hp = 40, attack = 45, defense = 40, specialAttack = 55, specialDefense = 40, speed = 84 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 743
    , name = "アブリボン"
    , englishName = "アブリボン"
    , pokemonType = BugFairy
    , stats = { hp = 60, attack = 55, defense = 60, specialAttack = 95, specialDefense = 70, speed = 124 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 763
    , name = "アマージョ"
    , englishName = "アマージョ"
    , pokemonType = GrassType
    , stats = { hp = 72, attack = 120, defense = 98, specialAttack = 50, specialDefense = 98, speed = 72 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 761
    , name = "アマカジ"
    , englishName = "アマカジ"
    , pokemonType = GrassType
    , stats = { hp = 42, attack = 30, defense = 38, specialAttack = 30, specialDefense = 38, speed = 32 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 762
    , name = "アママイコ"
    , englishName = "アママイコ"
    , pokemonType = GrassType
    , stats = { hp = 52, attack = 40, defense = 48, specialAttack = 40, specialDefense = 48, speed = 62 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 698
    , name = "アマルス"
    , englishName = "アマルス"
    , pokemonType = IceRock
    , stats = { hp = 77, attack = 59, defense = 50, specialAttack = 67, specialDefense = 63, speed = 46 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 699
    , name = "アマルルガ"
    , englishName = "アマルルガ"
    , pokemonType = IceRock
    , stats = { hp = 123, attack = 77, defense = 72, specialAttack = 99, specialDefense = 92, speed = 58 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 283
    , name = "アメタマ"
    , englishName = "アメタマ"
    , pokemonType = WaterBug
    , stats = { hp = 40, attack = 30, defense = 32, specialAttack = 50, specialDefense = 52, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 284
    , name = "アメモース"
    , englishName = "アメモース"
    , pokemonType = FlyingBug
    , stats = { hp = 70, attack = 60, defense = 62, specialAttack = 100, specialDefense = 82, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 899
    , name = "アヤシシ"
    , englishName = "アヤシシ"
    , pokemonType = NormalPsychic
    , stats = { hp = 103, attack = 105, defense = 72, specialAttack = 105, specialDefense = 75, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 979
    , name = "アラブルタケ"
    , englishName = "アラブルタケ"
    , pokemonType = GrassDark
    , stats = { hp = 111, attack = 127, defense = 99, specialAttack = 79, specialDefense = 99, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 168
    , name = "アリアドス"
    , englishName = "アリアドス"
    , pokemonType = PoisonBug
    , stats = { hp = 70, attack = 90, defense = 70, specialAttack = 60, specialDefense = 70, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 159
    , name = "アリゲイツ"
    , englishName = "アリゲイツ"
    , pokemonType = WaterType
    , stats = { hp = 65, attack = 80, defense = 80, specialAttack = 59, specialDefense = 63, speed = 58 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 947
    , name = "アルクジラ"
    , englishName = "アルクジラ"
    , pokemonType = IceType
    , stats = { hp = 108, attack = 68, defense = 45, specialAttack = 30, specialDefense = 40, speed = 43 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 493
    , name = "アルセウス"
    , englishName = "アルセウス"
    , pokemonType = NormalType
    , stats = { hp = 120, attack = 120, defense = 120, specialAttack = 120, specialDefense = 120, speed = 120 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 201
    , name = "アンノーン"
    , englishName = "アンノーン"
    , pokemonType = PsychicType
    , stats = { hp = 48, attack = 72, defense = 48, specialAttack = 72, specialDefense = 48, speed = 48 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20020
    , name = "イイネイヌ"
    , englishName = "イイネイヌ"
    , pokemonType = FightingPoison
    , stats = { hp = 88, attack = 128, defense = 115, specialAttack = 58, specialDefense = 86, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 133
    , name = "イーブイ"
    , englishName = "イーブイ"
    , pokemonType = NormalType
    , stats = { hp = 55, attack = 55, defense = 50, specialAttack = 45, specialDefense = 65, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 997
    , name = "イーユイ"
    , englishName = "イーユイ"
    , pokemonType = FireDark
    , stats = { hp = 55, attack = 80, defense = 80, specialAttack = 135, specialDefense = 120, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10186
    , name = "イエッサン(♀)"
    , englishName = "イエッサン(♀)"
    , pokemonType = NormalPsychic
    , stats = { hp = 70, attack = 55, defense = 65, specialAttack = 95, specialDefense = 105, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 876
    , name = "イエッサン(♂)"
    , englishName = "イエッサン(♂)"
    , pokemonType = NormalPsychic
    , stats = { hp = 60, attack = 65, defense = 55, specialAttack = 105, specialDefense = 95, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 826
    , name = "イオルブ"
    , englishName = "イオルブ"
    , pokemonType = PsychicBug
    , stats = { hp = 60, attack = 45, defense = 110, specialAttack = 80, specialDefense = 120, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 960
    , name = "イキリンコ"
    , englishName = "イキリンコ"
    , pokemonType = NormalFlying
    , stats = { hp = 82, attack = 96, defense = 51, specialAttack = 45, specialDefense = 51, speed = 92 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 557
    , name = "イシズマイ"
    , englishName = "イシズマイ"
    , pokemonType = BugRock
    , stats = { hp = 50, attack = 65, defense = 85, specialAttack = 35, specialDefense = 35, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 74
    , name = "イシツブテ"
    , englishName = "イシツブテ"
    , pokemonType = GroundRock
    , stats = { hp = 40, attack = 80, defense = 100, specialAttack = 30, specialDefense = 30, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10109
    , name = "イシツブテ(アローラ)"
    , englishName = "イシツブテ(アローラ)"
    , pokemonType = ElectricRock
    , stats = { hp = 40, attack = 80, defense = 100, specialAttack = 30, specialDefense = 30, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 874
    , name = "イシヘンジン"
    , englishName = "イシヘンジン"
    , pokemonType = RockType
    , stats = { hp = 100, attack = 125, defense = 135, specialAttack = 20, specialDefense = 20, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10248
    , name = "イダイトウ(♀)"
    , englishName = "イダイトウ(♀)"
    , pokemonType = WaterGhost
    , stats = { hp = 120, attack = 92, defense = 65, specialAttack = 100, specialDefense = 75, speed = 78 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 902
    , name = "イダイトウ(♂)"
    , englishName = "イダイトウ(♂)"
    , pokemonType = WaterGhost
    , stats = { hp = 120, attack = 112, defense = 65, specialAttack = 80, specialDefense = 75, speed = 78 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 978
    , name = "イダイナキバ"
    , englishName = "イダイナキバ"
    , pokemonType = FightingGround
    , stats = { hp = 115, attack = 131, defense = 131, specialAttack = 53, specialDefense = 53, speed = 87 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 946
    , name = "イッカネズミ"
    , englishName = "イッカネズミ"
    , pokemonType = NormalType
    , stats = { hp = 74, attack = 75, defense = 70, specialAttack = 65, specialDefense = 75, speed = 111 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 167
    , name = "イトマル"
    , englishName = "イトマル"
    , pokemonType = PoisonBug
    , stats = { hp = 40, attack = 60, defense = 40, specialAttack = 40, specialDefense = 40, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 221
    , name = "イノムー"
    , englishName = "イノムー"
    , pokemonType = IceGround
    , stats = { hp = 100, attack = 100, defense = 80, specialAttack = 60, specialDefense = 60, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 717
    , name = "イベルタル"
    , englishName = "イベルタル"
    , pokemonType = FlyingDark
    , stats = { hp = 126, attack = 131, defense = 95, specialAttack = 131, specialDefense = 98, speed = 99 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 934
    , name = "イルカマン"
    , englishName = "イルカマン"
    , pokemonType = WaterType
    , stats = { hp = 100, attack = 70, defense = 72, specialAttack = 53, specialDefense = 62, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20001
    , name = "イルカマン(変身)"
    , englishName = "イルカマン(変身)"
    , pokemonType = WaterType
    , stats = { hp = 100, attack = 160, defense = 97, specialAttack = 106, specialDefense = 87, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 314
    , name = "イルミーゼ"
    , englishName = "イルミーゼ"
    , pokemonType = BugType
    , stats = { hp = 65, attack = 47, defense = 75, specialAttack = 73, specialDefense = 85, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 95
    , name = "イワーク"
    , englishName = "イワーク"
    , pokemonType = GroundRock
    , stats = { hp = 35, attack = 45, defense = 160, specialAttack = 30, specialDefense = 45, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 558
    , name = "イワパレス"
    , englishName = "イワパレス"
    , pokemonType = BugRock
    , stats = { hp = 70, attack = 105, defense = 125, specialAttack = 65, specialDefense = 75, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 744
    , name = "イワンコ"
    , englishName = "イワンコ"
    , pokemonType = RockType
    , stats = { hp = 45, attack = 65, defense = 40, specialAttack = 30, specialDefense = 40, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 818
    , name = "インテレオン"
    , englishName = "インテレオン"
    , pokemonType = WaterType
    , stats = { hp = 70, attack = 85, defense = 65, specialAttack = 125, specialDefense = 65, speed = 120 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 59
    , name = "ウインディ"
    , englishName = "ウインディ"
    , pokemonType = FireType
    , stats = { hp = 90, attack = 110, defense = 80, specialAttack = 100, specialDefense = 80, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10230
    , name = "ウインディ(ヒスイ)"
    , englishName = "ウインディ(ヒスイ)"
    , pokemonType = FireRock
    , stats = { hp = 95, attack = 115, defense = 80, specialAttack = 95, specialDefense = 80, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 892
    , name = "ウーラオス(一撃)"
    , englishName = "ウーラオス(一撃)"
    , pokemonType = FightingDark
    , stats = { hp = 100, attack = 130, defense = 100, specialAttack = 63, specialDefense = 60, speed = 97 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10191
    , name = "ウーラオス(連撃)"
    , englishName = "ウーラオス(連撃)"
    , pokemonType = WaterFighting
    , stats = { hp = 100, attack = 130, defense = 100, specialAttack = 63, specialDefense = 60, speed = 97 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 831
    , name = "ウールー"
    , englishName = "ウールー"
    , pokemonType = NormalType
    , stats = { hp = 42, attack = 40, defense = 55, specialAttack = 40, specialDefense = 45, speed = 48 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 914
    , name = "ウェーニバル"
    , englishName = "ウェーニバル"
    , pokemonType = WaterFighting
    , stats = { hp = 85, attack = 120, defense = 80, specialAttack = 85, specialDefense = 75, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 913
    , name = "ウェルカモ"
    , englishName = "ウェルカモ"
    , pokemonType = WaterType
    , stats = { hp = 70, attack = 85, defense = 65, specialAttack = 65, specialDefense = 60, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 628
    , name = "ウォーグル"
    , englishName = "ウォーグル"
    , pokemonType = NormalFlying
    , stats = { hp = 100, attack = 123, defense = 75, specialAttack = 57, specialDefense = 75, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10240
    , name = "ウォーグル(ヒスイ)"
    , englishName = "ウォーグル(ヒスイ)"
    , pokemonType = FlyingPsychic
    , stats = { hp = 110, attack = 83, defense = 70, specialAttack = 112, specialDefense = 70, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 883
    , name = "ウオチルドン"
    , englishName = "ウオチルドン"
    , pokemonType = WaterIce
    , stats = { hp = 90, attack = 90, defense = 100, specialAttack = 80, specialDefense = 90, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 882
    , name = "ウオノラゴン"
    , englishName = "ウオノラゴン"
    , pokemonType = WaterDragon
    , stats = { hp = 90, attack = 90, defense = 100, specialAttack = 70, specialDefense = 80, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20030
    , name = "ウガツホムラ"
    , englishName = "ウガツホムラ"
    , pokemonType = FireDragon
    , stats = { hp = 105, attack = 115, defense = 121, specialAttack = 65, specialDefense = 93, speed = 91 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 185
    , name = "ウソッキー"
    , englishName = "ウソッキー"
    , pokemonType = RockType
    , stats = { hp = 70, attack = 100, defense = 115, specialAttack = 30, specialDefense = 65, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 438
    , name = "ウソハチ"
    , englishName = "ウソハチ"
    , pokemonType = RockType
    , stats = { hp = 50, attack = 80, defense = 95, specialAttack = 10, specialDefense = 45, speed = 10 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 845
    , name = "ウッウ"
    , englishName = "ウッウ"
    , pokemonType = WaterFlying
    , stats = { hp = 70, attack = 85, defense = 55, specialAttack = 85, specialDefense = 95, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 70
    , name = "ウツドン"
    , englishName = "ウツドン"
    , pokemonType = GrassPoison
    , stats = { hp = 65, attack = 90, defense = 50, specialAttack = 85, specialDefense = 45, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 71
    , name = "ウツボット"
    , englishName = "ウツボット"
    , pokemonType = GrassPoison
    , stats = { hp = 80, attack = 105, defense = 65, specialAttack = 100, specialDefense = 70, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 793
    , name = "ウツロイド"
    , englishName = "ウツロイド"
    , pokemonType = PoisonRock
    , stats = { hp = 109, attack = 53, defense = 47, specialAttack = 127, specialDefense = 131, speed = 103 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 692
    , name = "ウデッポウ"
    , englishName = "ウデッポウ"
    , pokemonType = WaterType
    , stats = { hp = 50, attack = 53, defense = 62, specialAttack = 58, specialDefense = 63, speed = 44 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20015
    , name = "ウネルミナモ"
    , englishName = "ウネルミナモ"
    , pokemonType = WaterDragon
    , stats = { hp = 99, attack = 83, defense = 91, specialAttack = 125, specialDefense = 83, speed = 109 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 194
    , name = "ウパー"
    , englishName = "ウパー"
    , pokemonType = WaterGround
    , stats = { hp = 55, attack = 45, defense = 45, specialAttack = 25, specialDefense = 25, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20014
    , name = "ウパー(パルデア)"
    , englishName = "ウパー(パルデア)"
    , pokemonType = PoisonGround
    , stats = { hp = 55, attack = 45, defense = 45, specialAttack = 25, specialDefense = 25, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 929
    , name = "ウミディグダ"
    , englishName = "ウミディグダ"
    , pokemonType = WaterType
    , stats = { hp = 10, attack = 55, defense = 25, specialAttack = 35, specialDefense = 25, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 930
    , name = "ウミトリオ"
    , englishName = "ウミトリオ"
    , pokemonType = WaterType
    , stats = { hp = 35, attack = 100, defense = 50, specialAttack = 50, specialDefense = 70, speed = 120 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 220
    , name = "ウリムー"
    , englishName = "ウリムー"
    , pokemonType = IceGround
    , stats = { hp = 50, attack = 50, defense = 40, specialAttack = 30, specialDefense = 30, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 637
    , name = "ウルガモス"
    , englishName = "ウルガモス"
    , pokemonType = FireBug
    , stats = { hp = 85, attack = 60, defense = 65, specialAttack = 135, specialDefense = 105, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 227
    , name = "エアームド"
    , englishName = "エアームド"
    , pokemonType = FlyingSteel
    , stats = { hp = 65, attack = 80, defense = 140, specialAttack = 40, specialDefense = 70, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 190
    , name = "エイパム"
    , englishName = "エイパム"
    , pokemonType = NormalType
    , stats = { hp = 55, attack = 70, defense = 55, specialAttack = 40, specialDefense = 55, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 815
    , name = "エースバーン"
    , englishName = "エースバーン"
    , pokemonType = FireType
    , stats = { hp = 80, attack = 116, defense = 75, specialAttack = 65, specialDefense = 75, speed = 119 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 196
    , name = "エーフィ"
    , englishName = "エーフィ"
    , pokemonType = PsychicType
    , stats = { hp = 65, attack = 65, defense = 60, specialAttack = 130, specialDefense = 95, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 921
    , name = "エクスレッグ"
    , englishName = "エクスレッグ"
    , pokemonType = BugDark
    , stats = { hp = 71, attack = 102, defense = 78, specialAttack = 52, specialDefense = 55, speed = 92 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 424
    , name = "エテボース"
    , englishName = "エテボース"
    , pokemonType = NormalType
    , stats = { hp = 75, attack = 100, defense = 66, specialAttack = 60, specialDefense = 66, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 300
    , name = "エネコ"
    , englishName = "エネコ"
    , pokemonType = NormalType
    , stats = { hp = 50, attack = 45, defense = 45, specialAttack = 35, specialDefense = 35, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 301
    , name = "エネコロロ"
    , englishName = "エネコロロ"
    , pokemonType = NormalType
    , stats = { hp = 70, attack = 65, defense = 65, specialAttack = 55, specialDefense = 55, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 107
    , name = "エビワラー"
    , englishName = "エビワラー"
    , pokemonType = FightingType
    , stats = { hp = 50, attack = 105, defense = 79, specialAttack = 35, specialDefense = 110, speed = 76 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 481
    , name = "エムリット"
    , englishName = "エムリット"
    , pokemonType = PsychicType
    , stats = { hp = 80, attack = 105, defense = 105, specialAttack = 105, specialDefense = 105, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 587
    , name = "エモンガ"
    , englishName = "エモンガ"
    , pokemonType = ElectricFlying
    , stats = { hp = 55, attack = 75, defense = 60, specialAttack = 75, specialDefense = 60, speed = 103 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 694
    , name = "エリキテル"
    , englishName = "エリキテル"
    , pokemonType = NormalElectric
    , stats = { hp = 44, attack = 38, defense = 33, specialAttack = 61, specialDefense = 43, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 547
    , name = "エルフーン"
    , englishName = "エルフーン"
    , pokemonType = GrassFairy
    , stats = { hp = 60, attack = 67, defense = 85, specialAttack = 77, specialDefense = 75, speed = 116 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 475
    , name = "エルレイド"
    , englishName = "エルレイド"
    , pokemonType = FightingPsychic
    , stats = { hp = 68, attack = 125, defense = 65, specialAttack = 65, specialDefense = 115, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10068
    , name = "エルレイド(メガ)"
    , englishName = "エルレイド(メガ)"
    , pokemonType = FightingPsychic
    , stats = { hp = 68, attack = 165, defense = 95, specialAttack = 65, specialDefense = 115, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 239
    , name = "エレキッド"
    , englishName = "エレキッド"
    , pokemonType = ElectricType
    , stats = { hp = 45, attack = 63, defense = 37, specialAttack = 65, specialDefense = 55, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 466
    , name = "エレキブル"
    , englishName = "エレキブル"
    , pokemonType = ElectricType
    , stats = { hp = 75, attack = 123, defense = 67, specialAttack = 95, specialDefense = 85, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 695
    , name = "エレザード"
    , englishName = "エレザード"
    , pokemonType = NormalElectric
    , stats = { hp = 62, attack = 55, defense = 52, specialAttack = 109, specialDefense = 94, speed = 109 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 848
    , name = "エレズン"
    , englishName = "エレズン"
    , pokemonType = ElectricPoison
    , stats = { hp = 40, attack = 38, defense = 35, specialAttack = 54, specialDefense = 35, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 125
    , name = "エレブー"
    , englishName = "エレブー"
    , pokemonType = ElectricType
    , stats = { hp = 65, attack = 83, defense = 57, specialAttack = 95, specialDefense = 85, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 244
    , name = "エンテイ"
    , englishName = "エンテイ"
    , pokemonType = FireType
    , stats = { hp = 115, attack = 115, defense = 85, specialAttack = 90, specialDefense = 75, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 758
    , name = "エンニュート"
    , englishName = "エンニュート"
    , pokemonType = FirePoison
    , stats = { hp = 68, attack = 64, defense = 60, specialAttack = 111, specialDefense = 60, speed = 117 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 500
    , name = "エンブオー"
    , englishName = "エンブオー"
    , pokemonType = FireFighting
    , stats = { hp = 110, attack = 123, defense = 65, specialAttack = 100, specialDefense = 65, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 395
    , name = "エンペルト"
    , englishName = "エンペルト"
    , pokemonType = WaterSteel
    , stats = { hp = 84, attack = 86, defense = 88, specialAttack = 111, specialDefense = 101, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20023
    , name = "オーガポン"
    , englishName = "オーガポン"
    , pokemonType = GrassType
    , stats = { hp = 80, attack = 120, defense = 84, specialAttack = 60, specialDefense = 96, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20025
    , name = "オーガポン(炎)"
    , englishName = "オーガポン(炎)"
    , pokemonType = FireGrass
    , stats = { hp = 80, attack = 120, defense = 84, specialAttack = 60, specialDefense = 96, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20026
    , name = "オーガポン(岩)"
    , englishName = "オーガポン(岩)"
    , pokemonType = GrassRock
    , stats = { hp = 80, attack = 120, defense = 84, specialAttack = 60, specialDefense = 96, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20024
    , name = "オーガポン(水)"
    , englishName = "オーガポン(水)"
    , pokemonType = WaterGrass
    , stats = { hp = 80, attack = 120, defense = 84, specialAttack = 60, specialDefense = 96, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 277
    , name = "オオスバメ"
    , englishName = "オオスバメ"
    , pokemonType = NormalFlying
    , stats = { hp = 60, attack = 85, defense = 60, specialAttack = 75, specialDefense = 50, speed = 125 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 160
    , name = "オーダイル"
    , englishName = "オーダイル"
    , pokemonType = WaterType
    , stats = { hp = 85, attack = 105, defense = 100, specialAttack = 79, specialDefense = 83, speed = 78 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 162
    , name = "オオタチ"
    , englishName = "オオタチ"
    , pokemonType = NormalType
    , stats = { hp = 85, attack = 76, defense = 64, specialAttack = 45, specialDefense = 55, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 903
    , name = "オオニューラ"
    , englishName = "オオニューラ"
    , pokemonType = FightingPoison
    , stats = { hp = 80, attack = 130, defense = 60, specialAttack = 40, specialDefense = 80, speed = 120 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 606
    , name = "オーベム"
    , englishName = "オーベム"
    , pokemonType = PsychicType
    , stats = { hp = 75, attack = 75, defense = 75, specialAttack = 125, specialDefense = 95, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 709
    , name = "オーロット"
    , englishName = "オーロット"
    , pokemonType = GrassGhost
    , stats = { hp = 85, attack = 110, defense = 76, specialAttack = 65, specialDefense = 82, speed = 56 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 861
    , name = "オーロンゲ"
    , englishName = "オーロンゲ"
    , pokemonType = DarkFairy
    , stats = { hp = 95, attack = 120, defense = 65, specialAttack = 95, specialDefense = 75, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 224
    , name = "オクタン"
    , englishName = "オクタン"
    , pokemonType = WaterType
    , stats = { hp = 75, attack = 105, defense = 75, specialAttack = 105, specialDefense = 75, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 57
    , name = "オコリザル"
    , englishName = "オコリザル"
    , pokemonType = FightingType
    , stats = { hp = 65, attack = 105, defense = 60, specialAttack = 60, specialDefense = 70, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 729
    , name = "オシャマリ"
    , englishName = "オシャマリ"
    , pokemonType = WaterType
    , stats = { hp = 60, attack = 69, defense = 69, specialAttack = 91, specialDefense = 81, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 161
    , name = "オタチ"
    , englishName = "オタチ"
    , pokemonType = NormalType
    , stats = { hp = 35, attack = 46, defense = 34, specialAttack = 35, specialDefense = 45, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 535
    , name = "オタマロ"
    , englishName = "オタマロ"
    , pokemonType = WaterType
    , stats = { hp = 50, attack = 50, defense = 40, specialAttack = 50, specialDefense = 40, speed = 64 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 234
    , name = "オドシシ"
    , englishName = "オドシシ"
    , pokemonType = NormalType
    , stats = { hp = 73, attack = 95, defense = 62, specialAttack = 85, specialDefense = 65, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 959
    , name = "オトシドリ"
    , englishName = "オトシドリ"
    , pokemonType = FlyingDark
    , stats = { hp = 70, attack = 103, defense = 85, specialAttack = 60, specialDefense = 85, speed = 82 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 853
    , name = "オトスパス"
    , englishName = "オトスパス"
    , pokemonType = FightingType
    , stats = { hp = 80, attack = 118, defense = 90, specialAttack = 70, specialDefense = 80, speed = 42 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 741
    , name = "オドリドリ(炎)"
    , englishName = "オドリドリ(炎)"
    , pokemonType = FireFlying
    , stats = { hp = 75, attack = 70, defense = 70, specialAttack = 98, specialDefense = 70, speed = 93 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10124
    , name = "オドリドリ(超)"
    , englishName = "オドリドリ(超)"
    , pokemonType = FlyingPsychic
    , stats = { hp = 75, attack = 70, defense = 70, specialAttack = 98, specialDefense = 70, speed = 93 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10123
    , name = "オドリドリ(電)"
    , englishName = "オドリドリ(電)"
    , pokemonType = ElectricFlying
    , stats = { hp = 75, attack = 70, defense = 70, specialAttack = 98, specialDefense = 70, speed = 93 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10125
    , name = "オドリドリ(霊)"
    , englishName = "オドリドリ(霊)"
    , pokemonType = FlyingGhost
    , stats = { hp = 75, attack = 70, defense = 70, specialAttack = 98, specialDefense = 70, speed = 93 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 362
    , name = "オニゴーリ"
    , englishName = "オニゴーリ"
    , pokemonType = IceType
    , stats = { hp = 80, attack = 80, defense = 80, specialAttack = 80, specialDefense = 80, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10074
    , name = "オニゴーリ(メガ)"
    , englishName = "オニゴーリ(メガ)"
    , pokemonType = IceType
    , stats = { hp = 80, attack = 120, defense = 80, specialAttack = 120, specialDefense = 80, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 752
    , name = "オニシズクモ"
    , englishName = "オニシズクモ"
    , pokemonType = WaterBug
    , stats = { hp = 68, attack = 70, defense = 92, specialAttack = 50, specialDefense = 132, speed = 42 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 21
    , name = "オニスズメ"
    , englishName = "オニスズメ"
    , pokemonType = NormalFlying
    , stats = { hp = 40, attack = 60, defense = 30, specialAttack = 31, specialDefense = 31, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 22
    , name = "オニドリル"
    , englishName = "オニドリル"
    , pokemonType = NormalFlying
    , stats = { hp = 65, attack = 90, defense = 65, specialAttack = 61, specialDefense = 61, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 612
    , name = "オノノクス"
    , englishName = "オノノクス"
    , pokemonType = DragonType
    , stats = { hp = 76, attack = 147, defense = 90, specialAttack = 60, specialDefense = 70, speed = 97 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 611
    , name = "オノンド"
    , englishName = "オノンド"
    , pokemonType = DragonType
    , stats = { hp = 66, attack = 117, defense = 70, specialAttack = 40, specialDefense = 50, speed = 67 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 139
    , name = "オムスター"
    , englishName = "オムスター"
    , pokemonType = WaterRock
    , stats = { hp = 70, attack = 60, defense = 125, specialAttack = 115, specialDefense = 70, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 138
    , name = "オムナイト"
    , englishName = "オムナイト"
    , pokemonType = WaterRock
    , stats = { hp = 35, attack = 40, defense = 100, specialAttack = 90, specialDefense = 55, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 972
    , name = "オラチフ"
    , englishName = "オラチフ"
    , pokemonType = DarkType
    , stats = { hp = 60, attack = 78, defense = 60, specialAttack = 40, specialDefense = 51, speed = 51 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 937
    , name = "オリーヴァ"
    , englishName = "オリーヴァ"
    , pokemonType = NormalGrass
    , stats = { hp = 78, attack = 69, defense = 90, specialAttack = 125, specialDefense = 109, speed = 39 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 936
    , name = "オリーニョ"
    , englishName = "オリーニョ"
    , pokemonType = NormalGrass
    , stats = { hp = 52, attack = 53, defense = 60, specialAttack = 78, specialDefense = 78, speed = 33 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 715
    , name = "オンバーン"
    , englishName = "オンバーン"
    , pokemonType = FlyingDragon
    , stats = { hp = 85, attack = 70, defense = 80, specialAttack = 97, specialDefense = 80, speed = 123 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 714
    , name = "オンバット"
    , englishName = "オンバット"
    , pokemonType = FlyingDragon
    , stats = { hp = 40, attack = 30, defense = 35, specialAttack = 45, specialDefense = 40, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 58
    , name = "ガーディ"
    , englishName = "ガーディ"
    , pokemonType = FireType
    , stats = { hp = 55, attack = 70, defense = 45, specialAttack = 70, specialDefense = 50, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10229
    , name = "ガーディ(ヒスイ)"
    , englishName = "ガーディ(ヒスイ)"
    , pokemonType = FireRock
    , stats = { hp = 60, attack = 75, defense = 45, specialAttack = 65, specialDefense = 50, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 414
    , name = "ガーメイル"
    , englishName = "ガーメイル"
    , pokemonType = FlyingBug
    , stats = { hp = 70, attack = 94, defense = 50, specialAttack = 94, specialDefense = 50, speed = 66 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 382
    , name = "カイオーガ"
    , englishName = "カイオーガ"
    , pokemonType = WaterType
    , stats = { hp = 100, attack = 100, defense = 90, specialAttack = 150, specialDefense = 140, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10077
    , name = "カイオーガ(ゲンシ)"
    , englishName = "カイオーガ(ゲンシ)"
    , pokemonType = WaterType
    , stats = { hp = 100, attack = 150, defense = 90, specialAttack = 180, specialDefense = 160, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 957
    , name = "カイデン"
    , englishName = "カイデン"
    , pokemonType = ElectricFlying
    , stats = { hp = 40, attack = 40, defense = 35, specialAttack = 55, specialDefense = 40, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 68
    , name = "カイリキー"
    , englishName = "カイリキー"
    , pokemonType = FightingType
    , stats = { hp = 90, attack = 130, defense = 80, specialAttack = 65, specialDefense = 85, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 149
    , name = "カイリュー"
    , englishName = "カイリュー"
    , pokemonType = FlyingDragon
    , stats = { hp = 91, attack = 134, defense = 95, specialAttack = 100, specialDefense = 100, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 127
    , name = "カイロス"
    , englishName = "カイロス"
    , pokemonType = BugType
    , stats = { hp = 65, attack = 125, defense = 100, specialAttack = 55, specialDefense = 70, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10040
    , name = "カイロス(メガ)"
    , englishName = "カイロス(メガ)"
    , pokemonType = FlyingBug
    , stats = { hp = 65, attack = 155, defense = 120, specialAttack = 65, specialDefense = 90, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 668
    , name = "カエンジシ"
    , englishName = "カエンジシ"
    , pokemonType = NormalFire
    , stats = { hp = 86, attack = 68, defense = 72, specialAttack = 109, specialDefense = 66, speed = 106 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 727
    , name = "ガオガエン"
    , englishName = "ガオガエン"
    , pokemonType = FireDark
    , stats = { hp = 95, attack = 115, defense = 90, specialAttack = 80, specialDefense = 90, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 352
    , name = "カクレオン"
    , englishName = "カクレオン"
    , pokemonType = NormalType
    , stats = { hp = 60, attack = 90, defense = 70, specialAttack = 60, specialDefense = 120, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 962
    , name = "ガケガニ"
    , englishName = "ガケガニ"
    , pokemonType = RockType
    , stats = { hp = 70, attack = 100, defense = 115, specialAttack = 35, specialDefense = 55, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 353
    , name = "カゲボウズ"
    , englishName = "カゲボウズ"
    , pokemonType = GhostType
    , stats = { hp = 44, attack = 75, defense = 35, specialAttack = 63, specialDefense = 33, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 840
    , name = "カジッチュ"
    , englishName = "カジッチュ"
    , pokemonType = GrassDragon
    , stats = { hp = 40, attack = 40, defense = 80, specialAttack = 40, specialDefense = 40, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 834
    , name = "カジリガメ"
    , englishName = "カジリガメ"
    , pokemonType = WaterRock
    , stats = { hp = 90, attack = 115, defense = 90, specialAttack = 48, specialDefense = 68, speed = 74 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 901
    , name = "ガチグマ"
    , englishName = "ガチグマ"
    , pokemonType = NormalGround
    , stats = { hp = 130, attack = 140, defense = 105, specialAttack = 45, specialDefense = 80, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20027
    , name = "ガチグマ(赫月)"
    , englishName = "ガチグマ(赫月)"
    , pokemonType = NormalGround
    , stats = { hp = 113, attack = 70, defense = 120, specialAttack = 135, specialDefense = 65, speed = 52 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 712
    , name = "カチコール"
    , englishName = "カチコール"
    , pokemonType = IceType
    , stats = { hp = 55, attack = 69, defense = 85, specialAttack = 32, specialDefense = 35, speed = 28 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 697
    , name = "ガチゴラス"
    , englishName = "ガチゴラス"
    , pokemonType = RockDragon
    , stats = { hp = 82, attack = 121, defense = 119, specialAttack = 69, specialDefense = 59, speed = 71 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 1000
    , name = "カヌチャン"
    , englishName = "カヌチャン"
    , pokemonType = SteelFairy
    , stats = { hp = 50, attack = 45, defense = 45, specialAttack = 35, specialDefense = 64, speed = 58 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 444
    , name = "ガバイト"
    , englishName = "ガバイト"
    , pokemonType = GroundDragon
    , stats = { hp = 68, attack = 90, defense = 65, specialAttack = 50, specialDefense = 55, speed = 82 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 450
    , name = "カバルドン"
    , englishName = "カバルドン"
    , pokemonType = GroundType
    , stats = { hp = 108, attack = 112, defense = 118, specialAttack = 68, specialDefense = 72, speed = 47 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 143
    , name = "カビゴン"
    , englishName = "カビゴン"
    , pokemonType = NormalType
    , stats = { hp = 160, attack = 110, defense = 65, specialAttack = 65, specialDefense = 110, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 785
    , name = "カプ・コケコ"
    , englishName = "カプ・コケコ"
    , pokemonType = ElectricFairy
    , stats = { hp = 70, attack = 115, defense = 85, specialAttack = 95, specialDefense = 75, speed = 130 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 786
    , name = "カプ・テテフ"
    , englishName = "カプ・テテフ"
    , pokemonType = PsychicFairy
    , stats = { hp = 70, attack = 85, defense = 75, specialAttack = 130, specialDefense = 115, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 787
    , name = "カプ・ブルル"
    , englishName = "カプ・ブルル"
    , pokemonType = GrassFairy
    , stats = { hp = 70, attack = 130, defense = 115, specialAttack = 85, specialDefense = 95, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 788
    , name = "カプ・レヒレ"
    , englishName = "カプ・レヒレ"
    , pokemonType = WaterFairy
    , stats = { hp = 70, attack = 75, defense = 115, specialAttack = 95, specialDefense = 130, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 938
    , name = "カプサイジ"
    , englishName = "カプサイジ"
    , pokemonType = GrassType
    , stats = { hp = 50, attack = 62, defense = 40, specialAttack = 62, specialDefense = 40, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 140
    , name = "カブト"
    , englishName = "カブト"
    , pokemonType = WaterRock
    , stats = { hp = 30, attack = 80, defense = 90, specialAttack = 55, specialDefense = 45, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 141
    , name = "カブトプス"
    , englishName = "カブトプス"
    , pokemonType = WaterRock
    , stats = { hp = 60, attack = 115, defense = 105, specialAttack = 65, specialDefense = 70, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 445
    , name = "ガブリアス"
    , englishName = "ガブリアス"
    , pokemonType = GroundDragon
    , stats = { hp = 108, attack = 130, defense = 95, specialAttack = 80, specialDefense = 85, speed = 102 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10058
    , name = "ガブリアス(メガ)"
    , englishName = "ガブリアス(メガ)"
    , pokemonType = GroundDragon
    , stats = { hp = 108, attack = 170, defense = 115, specialAttack = 120, specialDefense = 95, speed = 92 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 588
    , name = "カブルモ"
    , englishName = "カブルモ"
    , pokemonType = BugType
    , stats = { hp = 50, attack = 75, defense = 45, specialAttack = 40, specialDefense = 45, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 237
    , name = "カポエラー"
    , englishName = "カポエラー"
    , pokemonType = FightingType
    , stats = { hp = 50, attack = 95, defense = 95, specialAttack = 35, specialDefense = 110, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 536
    , name = "ガマガル"
    , englishName = "ガマガル"
    , pokemonType = WaterGround
    , stats = { hp = 75, attack = 65, defense = 55, specialAttack = 65, specialDefense = 55, speed = 69 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 537
    , name = "ガマゲロゲ"
    , englishName = "ガマゲロゲ"
    , pokemonType = WaterGround
    , stats = { hp = 105, attack = 95, defense = 75, specialAttack = 85, specialDefense = 75, speed = 74 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 847
    , name = "カマスジョー"
    , englishName = "カマスジョー"
    , pokemonType = WaterType
    , stats = { hp = 61, attack = 123, defense = 60, specialAttack = 60, specialDefense = 50, speed = 136 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20029
    , name = "カミツオロチ"
    , englishName = "カミツオロチ"
    , pokemonType = GrassDragon
    , stats = { hp = 106, attack = 80, defense = 110, specialAttack = 120, specialDefense = 80, speed = 44 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20017
    , name = "カミッチュ"
    , englishName = "カミッチュ"
    , pokemonType = GrassDragon
    , stats = { hp = 80, attack = 80, defense = 110, specialAttack = 95, specialDefense = 80, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 798
    , name = "カミツルギ"
    , englishName = "カミツルギ"
    , pokemonType = GrassSteel
    , stats = { hp = 59, attack = 181, defense = 131, specialAttack = 59, specialDefense = 31, speed = 109 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 833
    , name = "カムカメ"
    , englishName = "カムカメ"
    , pokemonType = WaterType
    , stats = { hp = 50, attack = 64, defense = 50, specialAttack = 38, specialDefense = 38, speed = 44 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 8
    , name = "カメール"
    , englishName = "カメール"
    , pokemonType = WaterType
    , stats = { hp = 59, attack = 63, defense = 80, specialAttack = 65, specialDefense = 80, speed = 58 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 9
    , name = "カメックス"
    , englishName = "カメックス"
    , pokemonType = WaterType
    , stats = { hp = 79, attack = 83, defense = 100, specialAttack = 85, specialDefense = 105, speed = 78 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10036
    , name = "カメックス(メガ)"
    , englishName = "カメックス(メガ)"
    , pokemonType = WaterType
    , stats = { hp = 79, attack = 103, defense = 120, specialAttack = 135, specialDefense = 115, speed = 78 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 688
    , name = "カメテテ"
    , englishName = "カメテテ"
    , pokemonType = WaterRock
    , stats = { hp = 42, attack = 52, defense = 67, specialAttack = 39, specialDefense = 56, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 689
    , name = "ガメノデス"
    , englishName = "ガメノデス"
    , pokemonType = WaterRock
    , stats = { hp = 72, attack = 105, defense = 115, specialAttack = 54, specialDefense = 86, speed = 68 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 83
    , name = "カモネギ"
    , englishName = "カモネギ"
    , pokemonType = NormalFlying
    , stats = { hp = 52, attack = 90, defense = 55, specialAttack = 58, specialDefense = 62, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10166
    , name = "カモネギ(ガラル)"
    , englishName = "カモネギ(ガラル)"
    , pokemonType = FightingType
    , stats = { hp = 52, attack = 95, defense = 55, specialAttack = 58, specialDefense = 62, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 104
    , name = "カラカラ"
    , englishName = "カラカラ"
    , pokemonType = GroundType
    , stats = { hp = 50, attack = 50, defense = 95, specialAttack = 40, specialDefense = 50, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 105
    , name = "ガラガラ"
    , englishName = "ガラガラ"
    , pokemonType = GroundType
    , stats = { hp = 60, attack = 80, defense = 110, specialAttack = 50, specialDefense = 80, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10115
    , name = "ガラガラ(アローラ)"
    , englishName = "ガラガラ(アローラ)"
    , pokemonType = FireGhost
    , stats = { hp = 60, attack = 80, defense = 110, specialAttack = 50, specialDefense = 80, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 266
    , name = "カラサリス"
    , englishName = "カラサリス"
    , pokemonType = BugType
    , stats = { hp = 50, attack = 35, defense = 55, specialAttack = 25, specialDefense = 25, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 422
    , name = "カラナクシ"
    , englishName = "カラナクシ"
    , pokemonType = WaterType
    , stats = { hp = 76, attack = 48, defense = 48, specialAttack = 57, specialDefense = 62, speed = 34 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 687
    , name = "カラマネロ"
    , englishName = "カラマネロ"
    , pokemonType = PsychicDark
    , stats = { hp = 86, attack = 92, defense = 88, specialAttack = 68, specialDefense = 75, speed = 73 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 961
    , name = "カラミンゴ"
    , englishName = "カラミンゴ"
    , pokemonType = FightingFlying
    , stats = { hp = 82, attack = 115, defense = 74, specialAttack = 75, specialDefense = 64, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 753
    , name = "カリキリ"
    , englishName = "カリキリ"
    , pokemonType = GrassType
    , stats = { hp = 40, attack = 55, defense = 35, specialAttack = 50, specialDefense = 35, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 115
    , name = "ガルーラ"
    , englishName = "ガルーラ"
    , pokemonType = NormalType
    , stats = { hp = 105, attack = 95, defense = 80, specialAttack = 40, specialDefense = 80, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10039
    , name = "ガルーラ(メガ)"
    , englishName = "ガルーラ(メガ)"
    , pokemonType = NormalType
    , stats = { hp = 105, attack = 125, defense = 100, specialAttack = 60, specialDefense = 100, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 1003
    , name = "カルボウ"
    , englishName = "カルボウ"
    , pokemonType = FireType
    , stats = { hp = 40, attack = 50, defense = 40, specialAttack = 50, specialDefense = 40, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 525
    , name = "ガントル"
    , englishName = "ガントル"
    , pokemonType = RockType
    , stats = { hp = 70, attack = 105, defense = 105, specialAttack = 50, specialDefense = 40, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 599
    , name = "ギアル"
    , englishName = "ギアル"
    , pokemonType = SteelType
    , stats = { hp = 40, attack = 55, defense = 70, specialAttack = 45, specialDefense = 60, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 526
    , name = "ギガイアス"
    , englishName = "ギガイアス"
    , pokemonType = RockType
    , stats = { hp = 85, attack = 135, defense = 130, specialAttack = 60, specialDefense = 80, speed = 25 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 600
    , name = "ギギアル"
    , englishName = "ギギアル"
    , pokemonType = SteelType
    , stats = { hp = 60, attack = 80, defense = 95, specialAttack = 70, specialDefense = 85, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 601
    , name = "ギギギアル"
    , englishName = "ギギギアル"
    , pokemonType = SteelType
    , stats = { hp = 60, attack = 100, defense = 115, specialAttack = 70, specialDefense = 85, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20022
    , name = "キチキギス"
    , englishName = "キチキギス"
    , pokemonType = PoisonFairy
    , stats = { hp = 88, attack = 91, defense = 82, specialAttack = 70, specialDefense = 125, speed = 99 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 760
    , name = "キテルグマ"
    , englishName = "キテルグマ"
    , pokemonType = NormalFighting
    , stats = { hp = 120, attack = 125, defense = 80, specialAttack = 55, specialDefense = 60, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 286
    , name = "キノガッサ"
    , englishName = "キノガッサ"
    , pokemonType = GrassFighting
    , stats = { hp = 60, attack = 130, defense = 80, specialAttack = 60, specialDefense = 60, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 285
    , name = "キノココ"
    , englishName = "キノココ"
    , pokemonType = GrassType
    , stats = { hp = 60, attack = 40, defense = 60, specialAttack = 40, specialDefense = 60, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 610
    , name = "キバゴ"
    , englishName = "キバゴ"
    , pokemonType = DragonType
    , stats = { hp = 46, attack = 87, defense = 60, specialAttack = 30, specialDefense = 40, speed = 57 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 318
    , name = "キバニア"
    , englishName = "キバニア"
    , pokemonType = WaterDark
    , stats = { hp = 45, attack = 90, defense = 20, specialAttack = 65, specialDefense = 20, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 192
    , name = "キマワリ"
    , englishName = "キマワリ"
    , pokemonType = GrassType
    , stats = { hp = 75, attack = 75, defense = 55, specialAttack = 105, specialDefense = 85, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 860
    , name = "ギモー"
    , englishName = "ギモー"
    , pokemonType = DarkFairy
    , stats = { hp = 65, attack = 60, defense = 45, specialAttack = 75, specialDefense = 55, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 252
    , name = "キモリ"
    , englishName = "キモリ"
    , pokemonType = GrassType
    , stats = { hp = 40, attack = 45, defense = 35, specialAttack = 65, specialDefense = 55, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10
    , name = "キャタピー"
    , englishName = "キャタピー"
    , pokemonType = BugType
    , stats = { hp = 45, attack = 30, defense = 35, specialAttack = 20, specialDefense = 20, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 278
    , name = "キャモメ"
    , englishName = "キャモメ"
    , pokemonType = WaterFlying
    , stats = { hp = 40, attack = 30, defense = 30, specialAttack = 55, specialDefense = 30, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 130
    , name = "ギャラドス"
    , englishName = "ギャラドス"
    , pokemonType = WaterFlying
    , stats = { hp = 95, attack = 125, defense = 79, specialAttack = 60, specialDefense = 100, speed = 81 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10041
    , name = "ギャラドス(メガ)"
    , englishName = "ギャラドス(メガ)"
    , pokemonType = WaterDark
    , stats = { hp = 95, attack = 155, defense = 109, specialAttack = 70, specialDefense = 130, speed = 81 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 78
    , name = "ギャロップ"
    , englishName = "ギャロップ"
    , pokemonType = FireType
    , stats = { hp = 65, attack = 100, defense = 70, specialAttack = 80, specialDefense = 80, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10163
    , name = "ギャロップ(ガラル)"
    , englishName = "ギャロップ(ガラル)"
    , pokemonType = PsychicFairy
    , stats = { hp = 65, attack = 100, defense = 70, specialAttack = 80, specialDefense = 80, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 38
    , name = "キュウコン"
    , englishName = "キュウコン"
    , pokemonType = FireType
    , stats = { hp = 73, attack = 76, defense = 75, specialAttack = 81, specialDefense = 100, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10104
    , name = "キュウコン(アローラ)"
    , englishName = "キュウコン(アローラ)"
    , pokemonType = IceFairy
    , stats = { hp = 73, attack = 67, defense = 75, specialAttack = 81, specialDefense = 100, speed = 109 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 646
    , name = "キュレム"
    , englishName = "キュレム"
    , pokemonType = IceDragon
    , stats = { hp = 125, attack = 130, defense = 90, specialAttack = 130, specialDefense = 90, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10022
    , name = "キュレム(ブラック)"
    , englishName = "キュレム(ブラック)"
    , pokemonType = IceDragon
    , stats = { hp = 125, attack = 170, defense = 100, specialAttack = 120, specialDefense = 90, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10023
    , name = "キュレム(ホワイト)"
    , englishName = "キュレム(ホワイト)"
    , pokemonType = IceDragon
    , stats = { hp = 125, attack = 120, defense = 90, specialAttack = 170, specialDefense = 100, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 764
    , name = "キュワワー"
    , englishName = "キュワワー"
    , pokemonType = FairyType
    , stats = { hp = 51, attack = 52, defense = 90, specialAttack = 82, specialDefense = 110, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 965
    , name = "キョジオーン"
    , englishName = "キョジオーン"
    , pokemonType = RockType
    , stats = { hp = 100, attack = 100, defense = 130, specialAttack = 45, specialDefense = 90, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 966
    , name = "キラーメ"
    , englishName = "キラーメ"
    , pokemonType = PoisonRock
    , stats = { hp = 48, attack = 35, defense = 42, specialAttack = 105, specialDefense = 60, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 487
    , name = "ギラティナ(アナザー)"
    , englishName = "ギラティナ(アナザー)"
    , pokemonType = GhostDragon
    , stats = { hp = 150, attack = 100, defense = 120, specialAttack = 100, specialDefense = 120, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10007
    , name = "ギラティナ(オリジン)"
    , englishName = "ギラティナ(オリジン)"
    , pokemonType = GhostDragon
    , stats = { hp = 150, attack = 120, defense = 100, specialAttack = 120, specialDefense = 100, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 967
    , name = "キラフロル"
    , englishName = "キラフロル"
    , pokemonType = PoisonRock
    , stats = { hp = 83, attack = 55, defense = 90, specialAttack = 130, specialDefense = 81, speed = 86 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 625
    , name = "キリキザン"
    , englishName = "キリキザン"
    , pokemonType = DarkSteel
    , stats = { hp = 65, attack = 125, defense = 100, specialAttack = 60, specialDefense = 70, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 203
    , name = "キリンリキ"
    , englishName = "キリンリキ"
    , pokemonType = NormalPsychic
    , stats = { hp = 70, attack = 80, defense = 65, specialAttack = 90, specialDefense = 65, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10026
    , name = "ギルガルド(剣)"
    , englishName = "ギルガルド(剣)"
    , pokemonType = GhostSteel
    , stats = { hp = 60, attack = 140, defense = 50, specialAttack = 140, specialDefense = 50, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 681
    , name = "ギルガルド(盾)"
    , englishName = "ギルガルド(盾)"
    , pokemonType = GhostSteel
    , stats = { hp = 60, attack = 50, defense = 140, specialAttack = 50, specialDefense = 140, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 281
    , name = "キルリア"
    , englishName = "キルリア"
    , pokemonType = PsychicFairy
    , stats = { hp = 38, attack = 35, defense = 35, specialAttack = 65, specialDefense = 55, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 182
    , name = "キレイハナ"
    , englishName = "キレイハナ"
    , pokemonType = GrassType
    , stats = { hp = 75, attack = 80, defense = 95, specialAttack = 90, specialDefense = 100, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 230
    , name = "キングドラ"
    , englishName = "キングドラ"
    , pokemonType = WaterDragon
    , stats = { hp = 75, attack = 95, defense = 95, specialAttack = 95, specialDefense = 95, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 99
    , name = "キングラー"
    , englishName = "キングラー"
    , pokemonType = WaterType
    , stats = { hp = 55, attack = 130, defense = 115, specialAttack = 50, specialDefense = 50, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 631
    , name = "クイタラン"
    , englishName = "クイタラン"
    , pokemonType = FireType
    , stats = { hp = 85, attack = 97, defense = 66, specialAttack = 105, specialDefense = 66, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 927
    , name = "クエスパトラ"
    , englishName = "クエスパトラ"
    , pokemonType = PsychicType
    , stats = { hp = 95, attack = 60, defense = 60, specialAttack = 101, specialDefense = 60, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 44
    , name = "クサイハナ"
    , englishName = "クサイハナ"
    , pokemonType = GrassPoison
    , stats = { hp = 60, attack = 65, defense = 70, specialAttack = 85, specialDefense = 75, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 827
    , name = "クスネ"
    , englishName = "クスネ"
    , pokemonType = DarkType
    , stats = { hp = 40, attack = 28, defense = 28, specialAttack = 47, specialDefense = 52, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 690
    , name = "クズモー"
    , englishName = "クズモー"
    , pokemonType = WaterPoison
    , stats = { hp = 50, attack = 60, defense = 60, specialAttack = 60, specialDefense = 60, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 768
    , name = "グソクムシャ"
    , englishName = "グソクムシャ"
    , pokemonType = WaterBug
    , stats = { hp = 75, attack = 125, defense = 140, specialAttack = 60, specialDefense = 90, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 303
    , name = "クチート"
    , englishName = "クチート"
    , pokemonType = SteelFairy
    , stats = { hp = 50, attack = 85, defense = 85, specialAttack = 55, specialDefense = 55, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10052
    , name = "クチート(メガ)"
    , englishName = "クチート(メガ)"
    , pokemonType = SteelFairy
    , stats = { hp = 50, attack = 105, defense = 125, specialAttack = 55, specialDefense = 95, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 204
    , name = "クヌギダマ"
    , englishName = "クヌギダマ"
    , pokemonType = BugType
    , stats = { hp = 50, attack = 65, defense = 90, specialAttack = 35, specialDefense = 35, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 613
    , name = "クマシュン"
    , englishName = "クマシュン"
    , pokemonType = IceType
    , stats = { hp = 55, attack = 70, defense = 40, specialAttack = 60, specialDefense = 40, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 383
    , name = "グラードン"
    , englishName = "グラードン"
    , pokemonType = GroundType
    , stats = { hp = 100, attack = 150, defense = 140, specialAttack = 100, specialDefense = 90, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10078
    , name = "グラードン(ゲンシ)"
    , englishName = "グラードン(ゲンシ)"
    , pokemonType = FireGround
    , stats = { hp = 100, attack = 180, defense = 160, specialAttack = 150, specialDefense = 90, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 472
    , name = "グライオン"
    , englishName = "グライオン"
    , pokemonType = GroundFlying
    , stats = { hp = 75, attack = 95, defense = 125, specialAttack = 45, specialDefense = 75, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 207
    , name = "グライガー"
    , englishName = "グライガー"
    , pokemonType = GroundFlying
    , stats = { hp = 65, attack = 75, defense = 105, specialAttack = 35, specialDefense = 65, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 262
    , name = "グラエナ"
    , englishName = "グラエナ"
    , pokemonType = DarkType
    , stats = { hp = 70, attack = 90, defense = 70, specialAttack = 60, specialDefense = 60, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 98
    , name = "クラブ"
    , englishName = "クラブ"
    , pokemonType = WaterType
    , stats = { hp = 30, attack = 105, defense = 90, specialAttack = 25, specialDefense = 25, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 210
    , name = "グランブル"
    , englishName = "グランブル"
    , pokemonType = FairyType
    , stats = { hp = 90, attack = 120, defense = 75, specialAttack = 60, specialDefense = 60, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 621
    , name = "クリムガン"
    , englishName = "クリムガン"
    , pokemonType = DragonType
    , stats = { hp = 77, attack = 120, defense = 90, specialAttack = 60, specialDefense = 90, speed = 48 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 915
    , name = "グルトン"
    , englishName = "グルトン"
    , pokemonType = NormalType
    , stats = { hp = 54, attack = 45, defense = 40, specialAttack = 35, specialDefense = 45, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 541
    , name = "クルマユ"
    , englishName = "クルマユ"
    , pokemonType = GrassBug
    , stats = { hp = 55, attack = 63, defense = 90, specialAttack = 50, specialDefense = 80, speed = 42 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 540
    , name = "クルミル"
    , englishName = "クルミル"
    , pokemonType = GrassBug
    , stats = { hp = 45, attack = 53, defense = 70, specialAttack = 40, specialDefense = 60, speed = 42 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 471
    , name = "グレイシア"
    , englishName = "グレイシア"
    , pokemonType = IceType
    , stats = { hp = 65, attack = 60, defense = 110, specialAttack = 130, specialDefense = 95, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 488
    , name = "クレセリア"
    , englishName = "クレセリア"
    , pokemonType = PsychicType
    , stats = { hp = 120, attack = 70, defense = 110, specialAttack = 75, specialDefense = 120, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 453
    , name = "グレッグル"
    , englishName = "グレッグル"
    , pokemonType = FightingPoison
    , stats = { hp = 48, attack = 61, defense = 40, specialAttack = 61, specialDefense = 40, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 707
    , name = "クレッフィ"
    , englishName = "クレッフィ"
    , pokemonType = SteelFairy
    , stats = { hp = 57, attack = 80, defense = 91, specialAttack = 80, specialDefense = 87, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 713
    , name = "クレベース"
    , englishName = "クレベース"
    , pokemonType = IceType
    , stats = { hp = 95, attack = 117, defense = 184, specialAttack = 44, specialDefense = 46, speed = 28 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10243
    , name = "クレベース(ヒスイ)"
    , englishName = "クレベース(ヒスイ)"
    , pokemonType = IceRock
    , stats = { hp = 95, attack = 127, defense = 184, specialAttack = 34, specialDefense = 36, speed = 38 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 1004
    , name = "グレンアルマ"
    , englishName = "グレンアルマ"
    , pokemonType = FirePsychic
    , stats = { hp = 85, attack = 60, defense = 100, specialAttack = 125, specialDefense = 80, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 169
    , name = "クロバット"
    , englishName = "クロバット"
    , pokemonType = PoisonFlying
    , stats = { hp = 85, attack = 90, defense = 80, specialAttack = 70, specialDefense = 80, speed = 130 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 738
    , name = "クワガノン"
    , englishName = "クワガノン"
    , pokemonType = ElectricBug
    , stats = { hp = 77, attack = 70, defense = 90, specialAttack = 145, specialDefense = 75, speed = 43 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 912
    , name = "クワッス"
    , englishName = "クワッス"
    , pokemonType = WaterType
    , stats = { hp = 55, attack = 65, defense = 45, specialAttack = 50, specialDefense = 45, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 456
    , name = "ケイコウオ"
    , englishName = "ケイコウオ"
    , pokemonType = WaterType
    , stats = { hp = 49, attack = 49, defense = 56, specialAttack = 49, specialDefense = 61, speed = 66 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 63
    , name = "ケーシィ"
    , englishName = "ケーシィ"
    , pokemonType = PsychicType
    , stats = { hp = 25, attack = 20, defense = 15, specialAttack = 105, specialDefense = 55, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 740
    , name = "ケケンカニ"
    , englishName = "ケケンカニ"
    , pokemonType = IceFighting
    , stats = { hp = 97, attack = 132, defense = 77, specialAttack = 62, specialDefense = 67, speed = 43 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 657
    , name = "ゲコガシラ"
    , englishName = "ゲコガシラ"
    , pokemonType = WaterType
    , stats = { hp = 54, attack = 63, defense = 52, specialAttack = 83, specialDefense = 56, speed = 97 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 289
    , name = "ケッキング"
    , englishName = "ケッキング"
    , pokemonType = NormalType
    , stats = { hp = 150, attack = 160, defense = 100, specialAttack = 95, specialDefense = 65, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 658
    , name = "ゲッコウガ"
    , englishName = "ゲッコウガ"
    , pokemonType = WaterDark
    , stats = { hp = 72, attack = 95, defense = 67, specialAttack = 103, specialDefense = 71, speed = 122 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10117
    , name = "ゲッコウガ(サトシ)"
    , englishName = "ゲッコウガ(サトシ)"
    , pokemonType = WaterDark
    , stats = { hp = 72, attack = 95, defense = 67, specialAttack = 103, specialDefense = 71, speed = 122 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 649
    , name = "ゲノセクト"
    , englishName = "ゲノセクト"
    , pokemonType = BugSteel
    , stats = { hp = 71, attack = 120, defense = 95, specialAttack = 120, specialDefense = 95, speed = 99 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 265
    , name = "ケムッソ"
    , englishName = "ケムッソ"
    , pokemonType = BugType
    , stats = { hp = 45, attack = 45, defense = 35, specialAttack = 20, specialDefense = 30, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 732
    , name = "ケララッパ"
    , englishName = "ケララッパ"
    , pokemonType = NormalFlying
    , stats = { hp = 55, attack = 85, defense = 50, specialAttack = 40, specialDefense = 50, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 647
    , name = "ケルディオ"
    , englishName = "ケルディオ"
    , pokemonType = WaterFighting
    , stats = { hp = 91, attack = 72, defense = 90, specialAttack = 129, specialDefense = 90, speed = 108 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 656
    , name = "ケロマツ"
    , englishName = "ケロマツ"
    , pokemonType = WaterType
    , stats = { hp = 41, attack = 56, defense = 40, specialAttack = 62, specialDefense = 44, speed = 71 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 94
    , name = "ゲンガー"
    , englishName = "ゲンガー"
    , pokemonType = PoisonGhost
    , stats = { hp = 60, attack = 65, defense = 60, specialAttack = 130, specialDefense = 75, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10038
    , name = "ゲンガー(メガ)"
    , englishName = "ゲンガー(メガ)"
    , pokemonType = PoisonGhost
    , stats = { hp = 60, attack = 65, defense = 80, specialAttack = 170, specialDefense = 95, speed = 130 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 128
    , name = "ケンタロス"
    , englishName = "ケンタロス"
    , pokemonType = NormalType
    , stats = { hp = 75, attack = 100, defense = 95, specialAttack = 40, specialDefense = 70, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20012
    , name = "ケンタロス(パルデア炎)"
    , englishName = "ケンタロス(パルデア炎)"
    , pokemonType = FireFighting
    , stats = { hp = 75, attack = 110, defense = 105, specialAttack = 30, specialDefense = 70, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20013
    , name = "ケンタロス(パルデア水)"
    , englishName = "ケンタロス(パルデア水)"
    , pokemonType = WaterFighting
    , stats = { hp = 75, attack = 110, defense = 105, specialAttack = 30, specialDefense = 70, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20011
    , name = "ケンタロス(パルデア闘)"
    , englishName = "ケンタロス(パルデア闘)"
    , pokemonType = FightingType
    , stats = { hp = 75, attack = 110, defense = 105, specialAttack = 30, specialDefense = 70, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 521
    , name = "ケンホロウ"
    , englishName = "ケンホロウ"
    , pokemonType = NormalFlying
    , stats = { hp = 80, attack = 115, defense = 80, specialAttack = 65, specialDefense = 55, speed = 93 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 580
    , name = "コアルヒー"
    , englishName = "コアルヒー"
    , pokemonType = WaterFlying
    , stats = { hp = 62, attack = 44, defense = 50, specialAttack = 44, specialDefense = 50, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 129
    , name = "コイキング"
    , englishName = "コイキング"
    , pokemonType = WaterType
    , stats = { hp = 20, attack = 10, defense = 55, specialAttack = 15, specialDefense = 20, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 81
    , name = "コイル"
    , englishName = "コイル"
    , pokemonType = ElectricSteel
    , stats = { hp = 25, attack = 35, defense = 70, specialAttack = 95, specialDefense = 55, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 392
    , name = "ゴウカザル"
    , englishName = "ゴウカザル"
    , pokemonType = FireFighting
    , stats = { hp = 76, attack = 104, defense = 71, specialAttack = 104, specialDefense = 71, speed = 108 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 673
    , name = "ゴーゴート"
    , englishName = "ゴーゴート"
    , pokemonType = GrassType
    , stats = { hp = 123, attack = 100, defense = 62, specialAttack = 97, specialDefense = 81, speed = 68 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 92
    , name = "ゴース"
    , englishName = "ゴース"
    , pokemonType = PoisonGhost
    , stats = { hp = 30, attack = 35, defense = 30, specialAttack = 100, specialDefense = 35, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 93
    , name = "ゴースト"
    , englishName = "ゴースト"
    , pokemonType = PoisonGhost
    , stats = { hp = 45, attack = 50, defense = 45, specialAttack = 115, specialDefense = 55, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 324
    , name = "コータス"
    , englishName = "コータス"
    , pokemonType = FireType
    , stats = { hp = 70, attack = 85, defense = 140, specialAttack = 85, specialDefense = 70, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 67
    , name = "ゴーリキー"
    , englishName = "ゴーリキー"
    , pokemonType = FightingType
    , stats = { hp = 80, attack = 100, defense = 70, specialAttack = 50, specialDefense = 60, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 875
    , name = "コオリッポ(アイス)"
    , englishName = "コオリッポ(アイス)"
    , pokemonType = IceType
    , stats = { hp = 75, attack = 80, defense = 110, specialAttack = 65, specialDefense = 90, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10185
    , name = "コオリッポ(ナイス)"
    , englishName = "コオリッポ(ナイス)"
    , pokemonType = IceType
    , stats = { hp = 75, attack = 80, defense = 70, specialAttack = 65, specialDefense = 50, speed = 130 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 14
    , name = "コクーン"
    , englishName = "コクーン"
    , pokemonType = PoisonBug
    , stats = { hp = 45, attack = 25, defense = 50, specialAttack = 25, specialDefense = 25, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 316
    , name = "ゴクリン"
    , englishName = "ゴクリン"
    , pokemonType = PoisonType
    , stats = { hp = 70, attack = 43, defense = 53, specialAttack = 43, specialDefense = 53, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 821
    , name = "ココガラ"
    , englishName = "ココガラ"
    , pokemonType = FlyingType
    , stats = { hp = 38, attack = 47, defense = 35, specialAttack = 33, specialDefense = 35, speed = 57 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 304
    , name = "ココドラ"
    , englishName = "ココドラ"
    , pokemonType = RockSteel
    , stats = { hp = 50, attack = 70, defense = 100, specialAttack = 40, specialDefense = 40, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 528
    , name = "ココロモリ"
    , englishName = "ココロモリ"
    , pokemonType = FlyingPsychic
    , stats = { hp = 67, attack = 57, defense = 55, specialAttack = 77, specialDefense = 55, speed = 114 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 963
    , name = "コジオ"
    , englishName = "コジオ"
    , pokemonType = RockType
    , stats = { hp = 55, attack = 55, defense = 75, specialAttack = 35, specialDefense = 35, speed = 25 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 619
    , name = "コジョフー"
    , englishName = "コジョフー"
    , pokemonType = FightingType
    , stats = { hp = 45, attack = 85, defense = 50, specialAttack = 55, specialDefense = 50, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 620
    , name = "コジョンド"
    , englishName = "コジョンド"
    , pokemonType = FightingType
    , stats = { hp = 65, attack = 125, defense = 60, specialAttack = 95, specialDefense = 60, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 790
    , name = "コスモウム"
    , englishName = "コスモウム"
    , pokemonType = PsychicType
    , stats = { hp = 43, attack = 29, defense = 131, specialAttack = 29, specialDefense = 131, speed = 37 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 789
    , name = "コスモッグ"
    , englishName = "コスモッグ"
    , pokemonType = PsychicType
    , stats = { hp = 43, attack = 29, defense = 31, specialAttack = 29, specialDefense = 31, speed = 37 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 767
    , name = "コソクムシ"
    , englishName = "コソクムシ"
    , pokemonType = WaterBug
    , stats = { hp = 25, attack = 35, defense = 40, specialAttack = 20, specialDefense = 30, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 54
    , name = "コダック"
    , englishName = "コダック"
    , pokemonType = WaterType
    , stats = { hp = 50, attack = 52, defense = 48, specialAttack = 65, specialDefense = 50, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 575
    , name = "ゴチミル"
    , englishName = "ゴチミル"
    , pokemonType = PsychicType
    , stats = { hp = 60, attack = 45, defense = 70, specialAttack = 75, specialDefense = 85, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 574
    , name = "ゴチム"
    , englishName = "ゴチム"
    , pokemonType = PsychicType
    , stats = { hp = 45, attack = 30, defense = 50, specialAttack = 55, specialDefense = 65, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 576
    , name = "ゴチルゼル"
    , englishName = "ゴチルゼル"
    , pokemonType = PsychicType
    , stats = { hp = 70, attack = 55, defense = 95, specialAttack = 95, specialDefense = 110, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 305
    , name = "コドラ"
    , englishName = "コドラ"
    , pokemonType = RockSteel
    , stats = { hp = 60, attack = 90, defense = 140, specialAttack = 50, specialDefense = 50, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 293
    , name = "ゴニョニョ"
    , englishName = "ゴニョニョ"
    , pokemonType = NormalType
    , stats = { hp = 64, attack = 51, defense = 23, specialAttack = 51, specialDefense = 23, speed = 28 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 274
    , name = "コノハナ"
    , englishName = "コノハナ"
    , pokemonType = GrassDark
    , stats = { hp = 70, attack = 70, defense = 40, specialAttack = 60, specialDefense = 40, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 1010
    , name = "コノヨザル"
    , englishName = "コノヨザル"
    , pokemonType = FightingGhost
    , stats = { hp = 110, attack = 115, defense = 80, specialAttack = 50, specialDefense = 90, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 638
    , name = "コバルオン"
    , englishName = "コバルオン"
    , pokemonType = FightingSteel
    , stats = { hp = 91, attack = 90, defense = 129, specialAttack = 90, specialDefense = 72, speed = 108 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 622
    , name = "ゴビット"
    , englishName = "ゴビット"
    , pokemonType = GroundGhost
    , stats = { hp = 59, attack = 74, defense = 50, specialAttack = 35, specialDefense = 50, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 665
    , name = "コフーライ"
    , englishName = "コフーライ"
    , pokemonType = BugType
    , stats = { hp = 45, attack = 22, defense = 60, specialAttack = 27, specialDefense = 30, speed = 29 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 664
    , name = "コフキムシ"
    , englishName = "コフキムシ"
    , pokemonType = BugType
    , stats = { hp = 38, attack = 35, defense = 40, specialAttack = 27, specialDefense = 25, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 231
    , name = "ゴマゾウ"
    , englishName = "ゴマゾウ"
    , pokemonType = GroundType
    , stats = { hp = 90, attack = 60, defense = 60, specialAttack = 40, specialDefense = 40, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 624
    , name = "コマタナ"
    , englishName = "コマタナ"
    , pokemonType = DarkSteel
    , stats = { hp = 45, attack = 85, defense = 70, specialAttack = 40, specialDefense = 40, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 372
    , name = "コモルー"
    , englishName = "コモルー"
    , pokemonType = DragonType
    , stats = { hp = 65, attack = 95, defense = 100, specialAttack = 60, specialDefense = 50, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 998
    , name = "コライドン"
    , englishName = "コライドン"
    , pokemonType = FightingDragon
    , stats = { hp = 100, attack = 135, defense = 115, specialAttack = 85, specialDefense = 100, speed = 135 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 19
    , name = "コラッタ"
    , englishName = "コラッタ"
    , pokemonType = NormalType
    , stats = { hp = 30, attack = 56, defense = 35, specialAttack = 25, specialDefense = 35, speed = 72 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10091
    , name = "コラッタ(アローラ)"
    , englishName = "コラッタ(アローラ)"
    , pokemonType = NormalDark
    , stats = { hp = 30, attack = 56, defense = 35, specialAttack = 25, specialDefense = 35, speed = 72 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 812
    , name = "ゴリランダー"
    , englishName = "ゴリランダー"
    , pokemonType = GrassType
    , stats = { hp = 100, attack = 125, defense = 90, specialAttack = 60, specialDefense = 70, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 403
    , name = "コリンク"
    , englishName = "コリンク"
    , pokemonType = ElectricType
    , stats = { hp = 45, attack = 65, defense = 34, specialAttack = 40, specialDefense = 34, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 623
    , name = "ゴルーグ"
    , englishName = "ゴルーグ"
    , pokemonType = GroundGhost
    , stats = { hp = 89, attack = 124, defense = 80, specialAttack = 55, specialDefense = 80, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 55
    , name = "ゴルダック"
    , englishName = "ゴルダック"
    , pokemonType = WaterType
    , stats = { hp = 80, attack = 82, defense = 78, specialAttack = 95, specialDefense = 80, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 42
    , name = "ゴルバット"
    , englishName = "ゴルバット"
    , pokemonType = PoisonFlying
    , stats = { hp = 75, attack = 80, defense = 70, specialAttack = 65, specialDefense = 75, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20008
    , name = "コレクレー(徒歩)"
    , englishName = "コレクレー(徒歩)"
    , pokemonType = GhostType
    , stats = { hp = 45, attack = 30, defense = 25, specialAttack = 75, specialDefense = 45, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 976
    , name = "コレクレー(箱)"
    , englishName = "コレクレー(箱)"
    , pokemonType = GhostType
    , stats = { hp = 45, attack = 30, defense = 70, specialAttack = 75, specialDefense = 70, speed = 10 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 76
    , name = "ゴローニャ"
    , englishName = "ゴローニャ"
    , pokemonType = GroundRock
    , stats = { hp = 80, attack = 120, defense = 130, specialAttack = 55, specialDefense = 65, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10111
    , name = "ゴローニャ(アローラ)"
    , englishName = "ゴローニャ(アローラ)"
    , pokemonType = ElectricRock
    , stats = { hp = 80, attack = 120, defense = 130, specialAttack = 55, specialDefense = 65, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 75
    , name = "ゴローン"
    , englishName = "ゴローン"
    , pokemonType = GroundRock
    , stats = { hp = 55, attack = 95, defense = 115, specialAttack = 45, specialDefense = 45, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10110
    , name = "ゴローン(アローラ)"
    , englishName = "ゴローン(アローラ)"
    , pokemonType = ElectricRock
    , stats = { hp = 55, attack = 95, defense = 115, specialAttack = 45, specialDefense = 45, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 402
    , name = "コロトック"
    , englishName = "コロトック"
    , pokemonType = BugType
    , stats = { hp = 77, attack = 85, defense = 51, specialAttack = 55, specialDefense = 51, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 401
    , name = "コロボーシ"
    , englishName = "コロボーシ"
    , pokemonType = BugType
    , stats = { hp = 37, attack = 25, defense = 41, specialAttack = 25, specialDefense = 41, speed = 25 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 527
    , name = "コロモリ"
    , englishName = "コロモリ"
    , pokemonType = FlyingPsychic
    , stats = { hp = 65, attack = 45, defense = 43, specialAttack = 55, specialDefense = 43, speed = 72 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 675
    , name = "ゴロンダ"
    , englishName = "ゴロンダ"
    , pokemonType = FightingDark
    , stats = { hp = 95, attack = 124, defense = 78, specialAttack = 69, specialDefense = 71, speed = 58 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 48
    , name = "コンパン"
    , englishName = "コンパン"
    , pokemonType = PoisonBug
    , stats = { hp = 60, attack = 55, defense = 50, specialAttack = 40, specialDefense = 55, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 446
    , name = "ゴンベ"
    , englishName = "ゴンベ"
    , pokemonType = NormalType
    , stats = { hp = 135, attack = 85, defense = 40, specialAttack = 40, specialDefense = 85, speed = 5 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 282
    , name = "サーナイト"
    , englishName = "サーナイト"
    , pokemonType = PsychicFairy
    , stats = { hp = 68, attack = 65, defense = 65, specialAttack = 125, specialDefense = 115, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10051
    , name = "サーナイト(メガ)"
    , englishName = "サーナイト(メガ)"
    , pokemonType = PsychicFairy
    , stats = { hp = 68, attack = 85, defense = 65, specialAttack = 165, specialDefense = 135, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 977
    , name = "サーフゴー"
    , englishName = "サーフゴー"
    , pokemonType = GhostSteel
    , stats = { hp = 87, attack = 60, defense = 95, specialAttack = 133, specialDefense = 91, speed = 84 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 112
    , name = "サイドン"
    , englishName = "サイドン"
    , pokemonType = GroundRock
    , stats = { hp = 105, attack = 130, defense = 120, specialAttack = 45, specialDefense = 45, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 111
    , name = "サイホーン"
    , englishName = "サイホーン"
    , pokemonType = GroundRock
    , stats = { hp = 80, attack = 85, defense = 95, specialAttack = 30, specialDefense = 30, speed = 25 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 368
    , name = "サクラビス"
    , englishName = "サクラビス"
    , pokemonType = WaterType
    , stats = { hp = 55, attack = 84, defense = 105, specialAttack = 114, specialDefense = 75, speed = 52 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 982
    , name = "サケブシッポ"
    , englishName = "サケブシッポ"
    , pokemonType = PsychicFairy
    , stats = { hp = 115, attack = 65, defense = 99, specialAttack = 65, specialDefense = 115, speed = 111 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 635
    , name = "サザンドラ"
    , englishName = "サザンドラ"
    , pokemonType = DragonDark
    , stats = { hp = 92, attack = 105, defense = 90, specialAttack = 125, specialDefense = 90, speed = 98 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10188
    , name = "ザシアン(剣の王)"
    , englishName = "ザシアン(剣の王)"
    , pokemonType = SteelFairy
    , stats = { hp = 92, attack = 150, defense = 115, specialAttack = 80, specialDefense = 115, speed = 148 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 888
    , name = "ザシアン(勇者)"
    , englishName = "ザシアン(勇者)"
    , pokemonType = FairyType
    , stats = { hp = 92, attack = 120, defense = 115, specialAttack = 80, specialDefense = 115, speed = 138 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 846
    , name = "サシカマス"
    , englishName = "サシカマス"
    , pokemonType = WaterType
    , stats = { hp = 41, attack = 63, defense = 40, specialAttack = 40, specialDefense = 30, speed = 66 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 844
    , name = "サダイジャ"
    , englishName = "サダイジャ"
    , pokemonType = GroundType
    , stats = { hp = 72, attack = 107, defense = 125, specialAttack = 65, specialDefense = 70, speed = 71 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 824
    , name = "サッチムシ"
    , englishName = "サッチムシ"
    , pokemonType = BugType
    , stats = { hp = 25, attack = 20, defense = 20, specialAttack = 25, specialDefense = 45, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 247
    , name = "サナギラス"
    , englishName = "サナギラス"
    , pokemonType = GroundRock
    , stats = { hp = 70, attack = 84, defense = 70, specialAttack = 65, specialDefense = 70, speed = 51 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 222
    , name = "サニーゴ"
    , englishName = "サニーゴ"
    , pokemonType = WaterRock
    , stats = { hp = 65, attack = 55, defense = 95, specialAttack = 65, specialDefense = 95, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10173
    , name = "サニーゴ(ガラル)"
    , englishName = "サニーゴ(ガラル)"
    , pokemonType = GhostType
    , stats = { hp = 60, attack = 55, defense = 100, specialAttack = 65, specialDefense = 100, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 864
    , name = "サニゴーン"
    , englishName = "サニゴーン"
    , pokemonType = GhostType
    , stats = { hp = 60, attack = 95, defense = 50, specialAttack = 145, specialDefense = 130, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 331
    , name = "サボネア"
    , englishName = "サボネア"
    , pokemonType = GrassType
    , stats = { hp = 50, attack = 85, defense = 40, specialAttack = 85, specialDefense = 40, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10189
    , name = "ザマゼンタ(盾の王)"
    , englishName = "ザマゼンタ(盾の王)"
    , pokemonType = FightingSteel
    , stats = { hp = 92, attack = 120, defense = 140, specialAttack = 80, specialDefense = 140, speed = 128 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 889
    , name = "ザマゼンタ(勇者)"
    , englishName = "ザマゼンタ(勇者)"
    , pokemonType = FightingType
    , stats = { hp = 92, attack = 120, defense = 115, specialAttack = 80, specialDefense = 115, speed = 138 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 356
    , name = "サマヨール"
    , englishName = "サマヨール"
    , pokemonType = GhostType
    , stats = { hp = 40, attack = 70, defense = 130, specialAttack = 60, specialDefense = 130, speed = 25 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 319
    , name = "サメハダー"
    , englishName = "サメハダー"
    , pokemonType = WaterDark
    , stats = { hp = 70, attack = 120, defense = 40, specialAttack = 95, specialDefense = 40, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10070
    , name = "サメハダー(メガ)"
    , englishName = "サメハダー(メガ)"
    , pokemonType = WaterDark
    , stats = { hp = 70, attack = 140, defense = 70, specialAttack = 110, specialDefense = 65, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 893
    , name = "ザルード"
    , englishName = "ザルード"
    , pokemonType = GrassDark
    , stats = { hp = 105, attack = 120, defense = 105, specialAttack = 70, specialDefense = 95, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 810
    , name = "サルノリ"
    , englishName = "サルノリ"
    , pokemonType = GrassType
    , stats = { hp = 50, attack = 65, defense = 50, specialAttack = 40, specialDefense = 40, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 106
    , name = "サワムラー"
    , englishName = "サワムラー"
    , pokemonType = FightingType
    , stats = { hp = 50, attack = 120, defense = 53, specialAttack = 35, specialDefense = 110, speed = 87 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 335
    , name = "ザングース"
    , englishName = "ザングース"
    , pokemonType = NormalType
    , stats = { hp = 73, attack = 115, defense = 60, specialAttack = 60, specialDefense = 60, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 145
    , name = "サンダー"
    , englishName = "サンダー"
    , pokemonType = ElectricFlying
    , stats = { hp = 90, attack = 90, defense = 85, specialAttack = 125, specialDefense = 90, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10170
    , name = "サンダー(ガラル)"
    , englishName = "サンダー(ガラル)"
    , pokemonType = FightingFlying
    , stats = { hp = 90, attack = 125, defense = 90, specialAttack = 85, specialDefense = 90, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 135
    , name = "サンダース"
    , englishName = "サンダース"
    , pokemonType = ElectricType
    , stats = { hp = 65, attack = 65, defense = 60, specialAttack = 110, specialDefense = 95, speed = 130 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 27
    , name = "サンド"
    , englishName = "サンド"
    , pokemonType = GroundType
    , stats = { hp = 50, attack = 75, defense = 85, specialAttack = 20, specialDefense = 30, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10101
    , name = "サンド(アローラ)"
    , englishName = "サンド(アローラ)"
    , pokemonType = IceSteel
    , stats = { hp = 50, attack = 75, defense = 90, specialAttack = 10, specialDefense = 35, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 28
    , name = "サンドパン"
    , englishName = "サンドパン"
    , pokemonType = GroundType
    , stats = { hp = 75, attack = 100, defense = 110, specialAttack = 45, specialDefense = 55, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10102
    , name = "サンドパン(アローラ)"
    , englishName = "サンドパン(アローラ)"
    , pokemonType = IceSteel
    , stats = { hp = 75, attack = 100, defense = 120, specialAttack = 25, specialDefense = 65, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 117
    , name = "シードラ"
    , englishName = "シードラ"
    , pokemonType = WaterType
    , stats = { hp = 55, attack = 65, defense = 95, specialAttack = 95, specialDefense = 45, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 369
    , name = "ジーランス"
    , englishName = "ジーランス"
    , pokemonType = WaterRock
    , stats = { hp = 100, attack = 90, defense = 130, specialAttack = 45, specialDefense = 65, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10006
    , name = "シェイミ(スカイ)"
    , englishName = "シェイミ(スカイ)"
    , pokemonType = GrassFlying
    , stats = { hp = 100, attack = 103, defense = 75, specialAttack = 120, specialDefense = 75, speed = 127 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 492
    , name = "シェイミL"
    , englishName = "シェイミL"
    , pokemonType = GrassType
    , stats = { hp = 100, attack = 100, defense = 100, specialAttack = 100, specialDefense = 100, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 90
    , name = "シェルダー"
    , englishName = "シェルダー"
    , pokemonType = WaterType
    , stats = { hp = 30, attack = 65, defense = 100, specialAttack = 45, specialDefense = 25, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 964
    , name = "ジオヅム"
    , englishName = "ジオヅム"
    , pokemonType = RockType
    , stats = { hp = 60, attack = 60, defense = 100, specialAttack = 35, specialDefense = 65, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10118
    , name = "ジガルデ(10%)"
    , englishName = "ジガルデ(10%)"
    , pokemonType = GroundDragon
    , stats = { hp = 54, attack = 100, defense = 71, specialAttack = 61, specialDefense = 85, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10120
    , name = "ジガルデ(100%)"
    , englishName = "ジガルデ(100%)"
    , pokemonType = GroundDragon
    , stats = { hp = 216, attack = 100, defense = 121, specialAttack = 91, specialDefense = 95, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 718
    , name = "ジガルデ(50%)"
    , englishName = "ジガルデ(50%)"
    , pokemonType = GroundDragon
    , stats = { hp = 108, attack = 100, defense = 121, specialAttack = 81, specialDefense = 95, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 922
    , name = "シガロコ"
    , englishName = "シガロコ"
    , pokemonType = BugType
    , stats = { hp = 41, attack = 50, defense = 60, specialAttack = 31, specialDefense = 58, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 585
    , name = "シキジカ"
    , englishName = "シキジカ"
    , pokemonType = NormalGrass
    , stats = { hp = 60, attack = 60, defense = 50, specialAttack = 40, specialDefense = 50, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 263
    , name = "ジグザグマ"
    , englishName = "ジグザグマ"
    , pokemonType = NormalType
    , stats = { hp = 38, attack = 30, defense = 41, specialAttack = 30, specialDefense = 41, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10174
    , name = "ジグザグマ(ガラル)"
    , englishName = "ジグザグマ(ガラル)"
    , pokemonType = NormalDark
    , stats = { hp = 38, attack = 30, defense = 41, specialAttack = 30, specialDefense = 41, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 342
    , name = "シザリガー"
    , englishName = "シザリガー"
    , pokemonType = WaterDark
    , stats = { hp = 63, attack = 120, defense = 85, specialAttack = 90, specialDefense = 55, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 780
    , name = "ジジーロン"
    , englishName = "ジジーロン"
    , pokemonType = NormalDragon
    , stats = { hp = 78, attack = 60, defense = 85, specialAttack = 135, specialDefense = 91, speed = 36 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 667
    , name = "シシコ"
    , englishName = "シシコ"
    , pokemonType = NormalFire
    , stats = { hp = 62, attack = 50, defense = 58, specialAttack = 73, specialDefense = 54, speed = 72 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 751
    , name = "シズクモ"
    , englishName = "シズクモ"
    , pokemonType = WaterBug
    , stats = { hp = 38, attack = 40, defense = 52, specialAttack = 40, specialDefense = 72, speed = 27 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 462
    , name = "ジバコイル"
    , englishName = "ジバコイル"
    , pokemonType = ElectricSteel
    , stats = { hp = 70, attack = 70, defense = 115, specialAttack = 130, specialDefense = 90, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 602
    , name = "シビシラス"
    , englishName = "シビシラス"
    , pokemonType = ElectricType
    , stats = { hp = 35, attack = 55, defense = 40, specialAttack = 45, specialDefense = 40, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 603
    , name = "シビビール"
    , englishName = "シビビール"
    , pokemonType = ElectricType
    , stats = { hp = 65, attack = 85, defense = 70, specialAttack = 75, specialDefense = 70, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 604
    , name = "シビルドン"
    , englishName = "シビルドン"
    , pokemonType = ElectricType
    , stats = { hp = 85, attack = 115, defense = 80, specialAttack = 105, specialDefense = 80, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 634
    , name = "ジヘッド"
    , englishName = "ジヘッド"
    , pokemonType = DragonDark
    , stats = { hp = 72, attack = 85, defense = 70, specialAttack = 65, specialDefense = 70, speed = 58 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 522
    , name = "シママ"
    , englishName = "シママ"
    , pokemonType = ElectricType
    , stats = { hp = 45, attack = 60, defense = 32, specialAttack = 50, specialDefense = 32, speed = 76 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 817
    , name = "ジメレオン"
    , englishName = "ジメレオン"
    , pokemonType = WaterType
    , stats = { hp = 65, attack = 60, defense = 55, specialAttack = 95, specialDefense = 55, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 496
    , name = "ジャノビー"
    , englishName = "ジャノビー"
    , pokemonType = GrassType
    , stats = { hp = 60, attack = 60, defense = 75, specialAttack = 60, specialDefense = 75, speed = 83 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 782
    , name = "ジャラコ"
    , englishName = "ジャラコ"
    , pokemonType = DragonType
    , stats = { hp = 45, attack = 55, defense = 65, specialAttack = 45, specialDefense = 45, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 784
    , name = "ジャラランガ"
    , englishName = "ジャラランガ"
    , pokemonType = FightingDragon
    , stats = { hp = 75, attack = 110, defense = 125, specialAttack = 100, specialDefense = 105, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 783
    , name = "ジャランゴ"
    , englishName = "ジャランゴ"
    , pokemonType = FightingDragon
    , stats = { hp = 55, attack = 75, defense = 90, specialAttack = 65, specialDefense = 70, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 952
    , name = "シャリタツ"
    , englishName = "シャリタツ"
    , pokemonType = WaterDragon
    , stats = { hp = 68, attack = 50, defense = 60, specialAttack = 120, specialDefense = 95, speed = 82 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 497
    , name = "ジャローダ"
    , englishName = "ジャローダ"
    , pokemonType = GrassType
    , stats = { hp = 75, attack = 75, defense = 95, specialAttack = 75, specialDefense = 95, speed = 113 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 134
    , name = "シャワーズ"
    , englishName = "シャワーズ"
    , pokemonType = WaterType
    , stats = { hp = 130, attack = 65, defense = 60, specialAttack = 110, specialDefense = 95, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 609
    , name = "シャンデラ"
    , englishName = "シャンデラ"
    , pokemonType = FireGhost
    , stats = { hp = 60, attack = 55, defense = 90, specialAttack = 145, specialDefense = 90, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 254
    , name = "ジュカイン"
    , englishName = "ジュカイン"
    , pokemonType = GrassType
    , stats = { hp = 70, attack = 85, defense = 65, specialAttack = 105, specialDefense = 85, speed = 120 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10065
    , name = "ジュカイン(メガ)"
    , englishName = "ジュカイン(メガ)"
    , pokemonType = GrassDragon
    , stats = { hp = 70, attack = 110, defense = 75, specialAttack = 145, specialDefense = 85, speed = 145 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 87
    , name = "ジュゴン"
    , englishName = "ジュゴン"
    , pokemonType = WaterIce
    , stats = { hp = 90, attack = 70, defense = 80, specialAttack = 70, specialDefense = 95, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 682
    , name = "シュシュプ"
    , englishName = "シュシュプ"
    , pokemonType = FairyType
    , stats = { hp = 78, attack = 52, defense = 60, specialAttack = 63, specialDefense = 65, speed = 23 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 724
    , name = "ジュナイパー"
    , englishName = "ジュナイパー"
    , pokemonType = GrassGhost
    , stats = { hp = 78, attack = 107, defense = 75, specialAttack = 100, specialDefense = 100, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10244
    , name = "ジュナイパー(ヒスイ)"
    , englishName = "ジュナイパー(ヒスイ)"
    , pokemonType = GrassFighting
    , stats = { hp = 88, attack = 112, defense = 80, specialAttack = 95, specialDefense = 95, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 589
    , name = "シュバルゴ"
    , englishName = "シュバルゴ"
    , pokemonType = BugSteel
    , stats = { hp = 70, attack = 135, defense = 105, specialAttack = 60, specialDefense = 105, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 253
    , name = "ジュプトル"
    , englishName = "ジュプトル"
    , pokemonType = GrassType
    , stats = { hp = 50, attack = 65, defense = 45, specialAttack = 85, specialDefense = 65, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 354
    , name = "ジュペッタ"
    , englishName = "ジュペッタ"
    , pokemonType = GhostType
    , stats = { hp = 64, attack = 115, defense = 65, specialAttack = 83, specialDefense = 63, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10056
    , name = "ジュペッタ(メガ)"
    , englishName = "ジュペッタ(メガ)"
    , pokemonType = GhostType
    , stats = { hp = 64, attack = 165, defense = 75, specialAttack = 93, specialDefense = 83, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 884
    , name = "ジュラルドン"
    , englishName = "ジュラルドン"
    , pokemonType = DragonSteel
    , stats = { hp = 70, attack = 95, defense = 115, specialAttack = 120, specialDefense = 50, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 385
    , name = "ジラーチ"
    , englishName = "ジラーチ"
    , pokemonType = PsychicSteel
    , stats = { hp = 100, attack = 100, defense = 100, specialAttack = 100, specialDefense = 100, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 773
    , name = "シルヴァディ"
    , englishName = "シルヴァディ"
    , pokemonType = NormalType
    , stats = { hp = 95, attack = 95, defense = 95, specialAttack = 95, specialDefense = 95, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 968
    , name = "シルシュルー"
    , englishName = "シルシュルー"
    , pokemonType = NormalPoison
    , stats = { hp = 40, attack = 65, defense = 35, specialAttack = 40, specialDefense = 35, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 770
    , name = "シロデスナ"
    , englishName = "シロデスナ"
    , pokemonType = GroundGhost
    , stats = { hp = 85, attack = 75, defense = 110, specialAttack = 100, specialDefense = 75, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 561
    , name = "シンボラー"
    , englishName = "シンボラー"
    , pokemonType = FlyingPsychic
    , stats = { hp = 72, attack = 58, defense = 80, specialAttack = 103, specialDefense = 80, speed = 97 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 245
    , name = "スイクン"
    , englishName = "スイクン"
    , pokemonType = WaterType
    , stats = { hp = 100, attack = 75, defense = 115, specialAttack = 90, specialDefense = 115, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 408
    , name = "ズガイドス"
    , englishName = "ズガイドス"
    , pokemonType = RockType
    , stats = { hp = 67, attack = 125, defense = 40, specialAttack = 30, specialDefense = 30, speed = 58 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 435
    , name = "スカタンク"
    , englishName = "スカタンク"
    , pokemonType = PoisonDark
    , stats = { hp = 103, attack = 93, defense = 67, specialAttack = 71, specialDefense = 61, speed = 84 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 806
    , name = "ズガドーン"
    , englishName = "ズガドーン"
    , pokemonType = FireGhost
    , stats = { hp = 53, attack = 127, defense = 53, specialAttack = 151, specialDefense = 79, speed = 107 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 434
    , name = "スカンプー"
    , englishName = "スカンプー"
    , pokemonType = PoisonDark
    , stats = { hp = 63, attack = 63, defense = 47, specialAttack = 41, specialDefense = 41, speed = 74 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 939
    , name = "スコヴィラン"
    , englishName = "スコヴィラン"
    , pokemonType = FireGrass
    , stats = { hp = 65, attack = 108, defense = 65, specialAttack = 108, specialDefense = 65, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 451
    , name = "スコルピ"
    , englishName = "スコルピ"
    , pokemonType = PoisonBug
    , stats = { hp = 40, attack = 50, defense = 90, specialAttack = 30, specialDefense = 55, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 121
    , name = "スターミー"
    , englishName = "スターミー"
    , pokemonType = WaterPsychic
    , stats = { hp = 60, attack = 75, defense = 85, specialAttack = 100, specialDefense = 85, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 123
    , name = "ストライク"
    , englishName = "ストライク"
    , pokemonType = FlyingBug
    , stats = { hp = 70, attack = 110, defense = 80, specialAttack = 55, specialDefense = 80, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 849
    , name = "ストリンダー(ハイ)"
    , englishName = "ストリンダー(ハイ)"
    , pokemonType = ElectricPoison
    , stats = { hp = 75, attack = 98, defense = 70, specialAttack = 114, specialDefense = 70, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10184
    , name = "ストリンダー(ロー)"
    , englishName = "ストリンダー(ロー)"
    , pokemonType = ElectricPoison
    , stats = { hp = 75, attack = 98, defense = 70, specialAttack = 114, specialDefense = 70, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 981
    , name = "スナノケガワ"
    , englishName = "スナノケガワ"
    , pokemonType = ElectricGround
    , stats = { hp = 85, attack = 81, defense = 97, specialAttack = 121, specialDefense = 85, speed = 101 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 769
    , name = "スナバァ"
    , englishName = "スナバァ"
    , pokemonType = GroundGhost
    , stats = { hp = 55, attack = 55, defense = 80, specialAttack = 70, specialDefense = 45, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 843
    , name = "スナヘビ"
    , englishName = "スナヘビ"
    , pokemonType = GroundType
    , stats = { hp = 52, attack = 57, defense = 75, specialAttack = 35, specialDefense = 50, speed = 46 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 41
    , name = "ズバット"
    , englishName = "ズバット"
    , pokemonType = PoisonFlying
    , stats = { hp = 40, attack = 45, defense = 35, specialAttack = 30, specialDefense = 40, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 276
    , name = "スバメ"
    , englishName = "スバメ"
    , pokemonType = NormalFlying
    , stats = { hp = 40, attack = 55, defense = 30, specialAttack = 30, specialDefense = 30, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 15
    , name = "スピアー"
    , englishName = "スピアー"
    , pokemonType = PoisonBug
    , stats = { hp = 65, attack = 90, defense = 40, specialAttack = 45, specialDefense = 80, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10090
    , name = "スピアー(メガ)"
    , englishName = "スピアー(メガ)"
    , pokemonType = PoisonBug
    , stats = { hp = 65, attack = 150, defense = 40, specialAttack = 15, specialDefense = 80, speed = 145 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 940
    , name = "ズピカ"
    , englishName = "ズピカ"
    , pokemonType = ElectricType
    , stats = { hp = 61, attack = 31, defense = 41, specialAttack = 59, specialDefense = 35, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 406
    , name = "スボミー"
    , englishName = "スボミー"
    , pokemonType = GrassPoison
    , stats = { hp = 40, attack = 30, defense = 35, specialAttack = 50, specialDefense = 70, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 97
    , name = "スリーパー"
    , englishName = "スリーパー"
    , pokemonType = PsychicType
    , stats = { hp = 85, attack = 73, defense = 70, specialAttack = 73, specialDefense = 115, speed = 67 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 96
    , name = "スリープ"
    , englishName = "スリープ"
    , pokemonType = PsychicType
    , stats = { hp = 60, attack = 48, defense = 45, specialAttack = 43, specialDefense = 90, speed = 42 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 560
    , name = "ズルズキン"
    , englishName = "ズルズキン"
    , pokemonType = FightingDark
    , stats = { hp = 65, attack = 90, defense = 115, specialAttack = 45, specialDefense = 115, speed = 58 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 559
    , name = "ズルッグ"
    , englishName = "ズルッグ"
    , pokemonType = FightingDark
    , stats = { hp = 50, attack = 75, defense = 70, specialAttack = 35, specialDefense = 70, speed = 48 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 581
    , name = "スワンナ"
    , englishName = "スワンナ"
    , pokemonType = WaterFlying
    , stats = { hp = 75, attack = 87, defense = 63, specialAttack = 87, specialDefense = 63, speed = 98 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 839
    , name = "セキタンザン"
    , englishName = "セキタンザン"
    , pokemonType = FireRock
    , stats = { hp = 110, attack = 80, defense = 120, specialAttack = 80, specialDefense = 90, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 951
    , name = "セグレイブ"
    , englishName = "セグレイブ"
    , pokemonType = IceDragon
    , stats = { hp = 115, attack = 145, defense = 92, specialAttack = 75, specialDefense = 86, speed = 87 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 644
    , name = "ゼクロム"
    , englishName = "ゼクロム"
    , pokemonType = ElectricDragon
    , stats = { hp = 100, attack = 150, defense = 120, specialAttack = 120, specialDefense = 100, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 950
    , name = "セゴール"
    , englishName = "セゴール"
    , pokemonType = IceDragon
    , stats = { hp = 90, attack = 95, defense = 66, specialAttack = 45, specialDefense = 65, speed = 62 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 7
    , name = "ゼニガメ"
    , englishName = "ゼニガメ"
    , pokemonType = WaterType
    , stats = { hp = 44, attack = 48, defense = 65, specialAttack = 50, specialDefense = 64, speed = 43 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 949
    , name = "セビエ"
    , englishName = "セビエ"
    , pokemonType = IceDragon
    , stats = { hp = 65, attack = 75, defense = 45, specialAttack = 35, specialDefense = 45, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 523
    , name = "ゼブライカ"
    , englishName = "ゼブライカ"
    , pokemonType = ElectricType
    , stats = { hp = 75, attack = 100, defense = 63, specialAttack = 80, specialDefense = 63, speed = 116 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 807
    , name = "ゼラオラ"
    , englishName = "ゼラオラ"
    , pokemonType = ElectricType
    , stats = { hp = 88, attack = 112, defense = 75, specialAttack = 102, specialDefense = 80, speed = 143 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 716
    , name = "ゼルネアス"
    , englishName = "ゼルネアス"
    , pokemonType = FairyType
    , stats = { hp = 126, attack = 131, defense = 95, specialAttack = 131, specialDefense = 98, speed = 99 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 251
    , name = "セレビィ"
    , englishName = "セレビィ"
    , pokemonType = GrassPsychic
    , stats = { hp = 100, attack = 100, defense = 100, specialAttack = 100, specialDefense = 100, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 878
    , name = "ゾウドウ"
    , englishName = "ゾウドウ"
    , pokemonType = SteelType
    , stats = { hp = 72, attack = 80, defense = 49, specialAttack = 40, specialDefense = 49, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 1005
    , name = "ソウブレイズ"
    , englishName = "ソウブレイズ"
    , pokemonType = FireGhost
    , stats = { hp = 75, attack = 125, defense = 80, specialAttack = 60, specialDefense = 100, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 360
    , name = "ソーナノ"
    , englishName = "ソーナノ"
    , pokemonType = PsychicType
    , stats = { hp = 95, attack = 23, defense = 48, specialAttack = 23, specialDefense = 48, speed = 23 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 202
    , name = "ソーナンス"
    , englishName = "ソーナンス"
    , pokemonType = PsychicType
    , stats = { hp = 190, attack = 33, defense = 58, specialAttack = 33, specialDefense = 58, speed = 33 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 791
    , name = "ソルガレオ"
    , englishName = "ソルガレオ"
    , pokemonType = PsychicSteel
    , stats = { hp = 137, attack = 137, defense = 107, specialAttack = 113, specialDefense = 89, speed = 97 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 338
    , name = "ソルロック"
    , englishName = "ソルロック"
    , pokemonType = PsychicRock
    , stats = { hp = 90, attack = 95, defense = 85, specialAttack = 55, specialDefense = 65, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 570
    , name = "ゾロア"
    , englishName = "ゾロア"
    , pokemonType = DarkType
    , stats = { hp = 40, attack = 65, defense = 40, specialAttack = 80, specialDefense = 40, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10238
    , name = "ゾロア(ヒスイ)"
    , englishName = "ゾロア(ヒスイ)"
    , pokemonType = NormalGhost
    , stats = { hp = 35, attack = 60, defense = 40, specialAttack = 85, specialDefense = 40, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 571
    , name = "ゾロアーク"
    , englishName = "ゾロアーク"
    , pokemonType = DarkType
    , stats = { hp = 60, attack = 105, defense = 60, specialAttack = 120, specialDefense = 60, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10239
    , name = "ゾロアーク(ヒスイ)"
    , englishName = "ゾロアーク(ヒスイ)"
    , pokemonType = NormalGhost
    , stats = { hp = 55, attack = 100, defense = 60, specialAttack = 125, specialDefense = 60, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 491
    , name = "ダークライ"
    , englishName = "ダークライ"
    , pokemonType = DarkType
    , stats = { hp = 70, attack = 90, defense = 90, specialAttack = 135, specialDefense = 90, speed = 125 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 275
    , name = "ダーテング"
    , englishName = "ダーテング"
    , pokemonType = GrassDark
    , stats = { hp = 90, attack = 100, defense = 60, specialAttack = 90, specialDefense = 60, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 879
    , name = "ダイオウドウ"
    , englishName = "ダイオウドウ"
    , pokemonType = SteelType
    , stats = { hp = 122, attack = 130, defense = 69, specialAttack = 80, specialDefense = 69, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 958
    , name = "タイカイデン"
    , englishName = "タイカイデン"
    , pokemonType = ElectricFlying
    , stats = { hp = 70, attack = 70, defense = 60, specialAttack = 105, specialDefense = 60, speed = 125 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 503
    , name = "ダイケンキ"
    , englishName = "ダイケンキ"
    , pokemonType = WaterType
    , stats = { hp = 95, attack = 100, defense = 85, specialAttack = 108, specialDefense = 70, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10236
    , name = "ダイケンキ(ヒスイ)"
    , englishName = "ダイケンキ(ヒスイ)"
    , pokemonType = WaterDark
    , stats = { hp = 90, attack = 108, defense = 80, specialAttack = 100, specialDefense = 65, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 476
    , name = "ダイノーズ"
    , englishName = "ダイノーズ"
    , pokemonType = RockSteel
    , stats = { hp = 60, attack = 55, defense = 145, specialAttack = 75, specialDefense = 150, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 772
    , name = "タイプ：ヌル"
    , englishName = "タイプ：ヌル"
    , pokemonType = NormalType
    , stats = { hp = 95, attack = 95, defense = 95, specialAttack = 95, specialDefense = 95, speed = 59 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 870
    , name = "タイレーツ"
    , englishName = "タイレーツ"
    , pokemonType = FightingType
    , stats = { hp = 65, attack = 100, defense = 100, specialAttack = 70, specialDefense = 60, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 969
    , name = "タギングル"
    , englishName = "タギングル"
    , pokemonType = NormalPoison
    , stats = { hp = 63, attack = 95, defense = 65, specialAttack = 80, specialDefense = 72, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 51
    , name = "ダグトリオ"
    , englishName = "ダグトリオ"
    , pokemonType = GroundType
    , stats = { hp = 35, attack = 100, defense = 50, specialAttack = 50, specialDefense = 70, speed = 120 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10106
    , name = "ダグトリオ(アローラ)"
    , englishName = "ダグトリオ(アローラ)"
    , pokemonType = GroundSteel
    , stats = { hp = 35, attack = 100, defense = 60, specialAttack = 50, specialDefense = 70, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 891
    , name = "ダクマ"
    , englishName = "ダクマ"
    , pokemonType = FightingType
    , stats = { hp = 60, attack = 90, defense = 60, specialAttack = 53, specialDefense = 50, speed = 72 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 539
    , name = "ダゲキ"
    , englishName = "ダゲキ"
    , pokemonType = FightingType
    , stats = { hp = 75, attack = 125, defense = 75, specialAttack = 30, specialDefense = 75, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20031
    , name = "タケルライコ"
    , englishName = "タケルライコ"
    , pokemonType = ElectricDragon
    , stats = { hp = 125, attack = 73, defense = 91, specialAttack = 137, specialDefense = 89, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 569
    , name = "ダストダス"
    , englishName = "ダストダス"
    , pokemonType = PoisonType
    , stats = { hp = 80, attack = 95, defense = 82, specialAttack = 60, specialDefense = 82, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 852
    , name = "タタッコ"
    , englishName = "タタッコ"
    , pokemonType = FightingType
    , stats = { hp = 50, attack = 68, defense = 60, specialAttack = 50, specialDefense = 50, speed = 32 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 781
    , name = "ダダリン"
    , englishName = "ダダリン"
    , pokemonType = GrassGhost
    , stats = { hp = 70, attack = 131, defense = 100, specialAttack = 86, specialDefense = 90, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 862
    , name = "タチフサグマ"
    , englishName = "タチフサグマ"
    , pokemonType = NormalDark
    , stats = { hp = 93, attack = 90, defense = 101, specialAttack = 60, specialDefense = 81, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 116
    , name = "タッツー"
    , englishName = "タッツー"
    , pokemonType = WaterType
    , stats = { hp = 30, attack = 40, defense = 70, specialAttack = 70, specialDefense = 25, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 371
    , name = "タツベイ"
    , englishName = "タツベイ"
    , pokemonType = DragonType
    , stats = { hp = 45, attack = 75, defense = 60, specialAttack = 40, specialDefense = 30, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 410
    , name = "タテトプス"
    , englishName = "タテトプス"
    , pokemonType = RockSteel
    , stats = { hp = 30, attack = 42, defense = 118, specialAttack = 42, specialDefense = 88, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 273
    , name = "タネボー"
    , englishName = "タネボー"
    , pokemonType = GrassType
    , stats = { hp = 40, attack = 40, defense = 50, specialAttack = 30, specialDefense = 30, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 578
    , name = "ダブラン"
    , englishName = "ダブラン"
    , pokemonType = PsychicType
    , stats = { hp = 65, attack = 40, defense = 50, specialAttack = 125, specialDefense = 60, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 531
    , name = "タブンネ"
    , englishName = "タブンネ"
    , pokemonType = NormalType
    , stats = { hp = 103, attack = 60, defense = 86, specialAttack = 60, specialDefense = 86, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10069
    , name = "タブンネ(メガ)"
    , englishName = "タブンネ(メガ)"
    , pokemonType = NormalFairy
    , stats = { hp = 103, attack = 60, defense = 126, specialAttack = 80, specialDefense = 126, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 590
    , name = "タマゲタケ"
    , englishName = "タマゲタケ"
    , pokemonType = GrassPoison
    , stats = { hp = 69, attack = 55, defense = 45, specialAttack = 55, specialDefense = 55, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 363
    , name = "タマザラシ"
    , englishName = "タマザラシ"
    , pokemonType = WaterIce
    , stats = { hp = 70, attack = 40, defense = 50, specialAttack = 55, specialDefense = 50, speed = 25 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 102
    , name = "タマタマ"
    , englishName = "タマタマ"
    , pokemonType = GrassPsychic
    , stats = { hp = 60, attack = 40, defense = 80, specialAttack = 60, specialDefense = 45, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 458
    , name = "タマンタ"
    , englishName = "タマンタ"
    , pokemonType = WaterFlying
    , stats = { hp = 45, attack = 20, defense = 50, specialAttack = 60, specialDefense = 120, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 918
    , name = "タマンチュラ"
    , englishName = "タマンチュラ"
    , pokemonType = BugType
    , stats = { hp = 35, attack = 41, defense = 45, specialAttack = 29, specialDefense = 40, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 842
    , name = "タルップル"
    , englishName = "タルップル"
    , pokemonType = GrassDragon
    , stats = { hp = 110, attack = 85, defense = 80, specialAttack = 100, specialDefense = 80, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 554
    , name = "ダルマッカ"
    , englishName = "ダルマッカ"
    , pokemonType = FireType
    , stats = { hp = 70, attack = 90, defense = 45, specialAttack = 15, specialDefense = 45, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10176
    , name = "ダルマッカ(ガラル)"
    , englishName = "ダルマッカ(ガラル)"
    , pokemonType = IceType
    , stats = { hp = 70, attack = 90, defense = 45, specialAttack = 15, specialDefense = 45, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 524
    , name = "ダンゴロ"
    , englishName = "ダンゴロ"
    , pokemonType = RockType
    , stats = { hp = 55, attack = 75, defense = 85, specialAttack = 25, specialDefense = 25, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 837
    , name = "タンドン"
    , englishName = "タンドン"
    , pokemonType = RockType
    , stats = { hp = 30, attack = 40, defense = 50, specialAttack = 40, specialDefense = 50, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 374
    , name = "ダンバル"
    , englishName = "ダンバル"
    , pokemonType = PsychicSteel
    , stats = { hp = 40, attack = 55, defense = 80, specialAttack = 35, specialDefense = 60, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 421
    , name = "チェリム"
    , englishName = "チェリム"
    , pokemonType = GrassType
    , stats = { hp = 70, attack = 60, defense = 70, specialAttack = 87, specialDefense = 78, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 420
    , name = "チェリンボ"
    , englishName = "チェリンボ"
    , pokemonType = GrassType
    , stats = { hp = 45, attack = 35, defense = 45, specialAttack = 62, specialDefense = 53, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 996
    , name = "チオンジェン"
    , englishName = "チオンジェン"
    , pokemonType = GrassDark
    , stats = { hp = 85, attack = 85, defense = 100, specialAttack = 95, specialDefense = 135, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 696
    , name = "チゴラス"
    , englishName = "チゴラス"
    , pokemonType = RockDragon
    , stats = { hp = 58, attack = 89, defense = 77, specialAttack = 45, specialDefense = 45, speed = 48 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 152
    , name = "チコリータ"
    , englishName = "チコリータ"
    , pokemonType = GrassType
    , stats = { hp = 45, attack = 49, defense = 65, specialAttack = 49, specialDefense = 65, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 308
    , name = "チャーレム"
    , englishName = "チャーレム"
    , pokemonType = FightingPsychic
    , stats = { hp = 60, attack = 60, defense = 75, specialAttack = 60, specialDefense = 75, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10054
    , name = "チャーレム(メガ)"
    , englishName = "チャーレム(メガ)"
    , pokemonType = FightingPsychic
    , stats = { hp = 60, attack = 100, defense = 85, specialAttack = 80, specialDefense = 85, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 499
    , name = "チャオブー"
    , englishName = "チャオブー"
    , pokemonType = FireFighting
    , stats = { hp = 90, attack = 93, defense = 55, specialAttack = 70, specialDefense = 55, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20018
    , name = "チャデス"
    , englishName = "チャデス"
    , pokemonType = GrassGhost
    , stats = { hp = 40, attack = 45, defense = 45, specialAttack = 74, specialDefense = 54, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 548
    , name = "チュリネ"
    , englishName = "チュリネ"
    , pokemonType = GrassType
    , stats = { hp = 45, attack = 35, defense = 50, specialAttack = 70, specialDefense = 50, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 616
    , name = "チョボマキ"
    , englishName = "チョボマキ"
    , pokemonType = BugType
    , stats = { hp = 50, attack = 40, defense = 85, specialAttack = 40, specialDefense = 65, speed = 25 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 509
    , name = "チョロネコ"
    , englishName = "チョロネコ"
    , pokemonType = DarkType
    , stats = { hp = 41, attack = 50, defense = 37, specialAttack = 50, specialDefense = 37, speed = 66 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 170
    , name = "チョンチー"
    , englishName = "チョンチー"
    , pokemonType = WaterElectric
    , stats = { hp = 75, attack = 38, defense = 38, specialAttack = 56, specialDefense = 56, speed = 67 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 572
    , name = "チラーミィ"
    , englishName = "チラーミィ"
    , pokemonType = NormalType
    , stats = { hp = 55, attack = 50, defense = 40, specialAttack = 40, specialDefense = 40, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 573
    , name = "チラチーノ"
    , englishName = "チラチーノ"
    , pokemonType = NormalType
    , stats = { hp = 75, attack = 95, defense = 60, specialAttack = 65, specialDefense = 60, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 358
    , name = "チリーン"
    , englishName = "チリーン"
    , pokemonType = PsychicType
    , stats = { hp = 75, attack = 50, defense = 80, specialAttack = 95, specialDefense = 90, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 334
    , name = "チルタリス"
    , englishName = "チルタリス"
    , pokemonType = FlyingDragon
    , stats = { hp = 75, attack = 70, defense = 90, specialAttack = 70, specialDefense = 105, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10067
    , name = "チルタリス(メガ)"
    , englishName = "チルタリス(メガ)"
    , pokemonType = DragonFairy
    , stats = { hp = 75, attack = 110, defense = 110, specialAttack = 110, specialDefense = 105, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 333
    , name = "チルット"
    , englishName = "チルット"
    , pokemonType = NormalFlying
    , stats = { hp = 45, attack = 40, defense = 60, specialAttack = 40, specialDefense = 75, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 984
    , name = "チヲハウハネ"
    , englishName = "チヲハウハネ"
    , pokemonType = FightingBug
    , stats = { hp = 85, attack = 135, defense = 79, specialAttack = 85, specialDefense = 105, speed = 81 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 495
    , name = "ツタージャ"
    , englishName = "ツタージャ"
    , pokemonType = GrassType
    , stats = { hp = 45, attack = 45, defense = 55, specialAttack = 45, specialDefense = 55, speed = 63 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 290
    , name = "ツチニン"
    , englishName = "ツチニン"
    , pokemonType = GroundBug
    , stats = { hp = 31, attack = 45, defense = 90, specialAttack = 30, specialDefense = 30, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 731
    , name = "ツツケラ"
    , englishName = "ツツケラ"
    , pokemonType = NormalFlying
    , stats = { hp = 35, attack = 75, defense = 30, specialAttack = 30, specialDefense = 30, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 213
    , name = "ツボツボ"
    , englishName = "ツボツボ"
    , pokemonType = BugRock
    , stats = { hp = 20, attack = 10, defense = 230, specialAttack = 10, specialDefense = 230, speed = 5 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 805
    , name = "ツンデツンデ"
    , englishName = "ツンデツンデ"
    , pokemonType = RockSteel
    , stats = { hp = 61, attack = 131, defense = 211, specialAttack = 53, specialDefense = 101, speed = 13 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 614
    , name = "ツンベアー"
    , englishName = "ツンベアー"
    , pokemonType = IceType
    , stats = { hp = 95, attack = 130, defense = 80, specialAttack = 70, specialDefense = 80, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 483
    , name = "ディアルガ"
    , englishName = "ディアルガ"
    , pokemonType = DragonSteel
    , stats = { hp = 100, attack = 120, defense = 120, specialAttack = 150, specialDefense = 100, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10245
    , name = "ディアルガ(オリジン)"
    , englishName = "ディアルガ(オリジン)"
    , pokemonType = DragonSteel
    , stats = { hp = 100, attack = 100, defense = 120, specialAttack = 150, specialDefense = 120, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 719
    , name = "ディアンシー"
    , englishName = "ディアンシー"
    , pokemonType = RockFairy
    , stats = { hp = 50, attack = 100, defense = 150, specialAttack = 100, specialDefense = 150, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10075
    , name = "ディアンシー(メガ)"
    , englishName = "ディアンシー(メガ)"
    , pokemonType = RockFairy
    , stats = { hp = 50, attack = 160, defense = 110, specialAttack = 160, specialDefense = 110, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 50
    , name = "ディグダ"
    , englishName = "ディグダ"
    , pokemonType = GroundType
    , stats = { hp = 10, attack = 55, defense = 25, specialAttack = 35, specialDefense = 45, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10105
    , name = "ディグダ(アローラ)"
    , englishName = "ディグダ(アローラ)"
    , pokemonType = GroundSteel
    , stats = { hp = 10, attack = 55, defense = 30, specialAttack = 35, specialDefense = 45, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 994
    , name = "ディンルー"
    , englishName = "ディンルー"
    , pokemonType = GroundDark
    , stats = { hp = 155, attack = 110, defense = 125, specialAttack = 55, specialDefense = 80, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 654
    , name = "テールナー"
    , englishName = "テールナー"
    , pokemonType = FireType
    , stats = { hp = 59, attack = 59, defense = 58, specialAttack = 90, specialDefense = 70, speed = 73 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10001
    , name = "デオキシス(アタック)"
    , englishName = "デオキシス(アタック)"
    , pokemonType = PsychicType
    , stats = { hp = 50, attack = 180, defense = 20, specialAttack = 180, specialDefense = 20, speed = 150 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10003
    , name = "デオキシス(スピード)"
    , englishName = "デオキシス(スピード)"
    , pokemonType = PsychicType
    , stats = { hp = 50, attack = 95, defense = 90, specialAttack = 95, specialDefense = 90, speed = 180 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10002
    , name = "デオキシス(ディフェンス)"
    , englishName = "デオキシス(ディフェンス)"
    , pokemonType = PsychicType
    , stats = { hp = 50, attack = 70, defense = 160, specialAttack = 70, specialDefense = 160, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 386
    , name = "デオキシス(ノーマル)"
    , englishName = "デオキシス(ノーマル)"
    , pokemonType = PsychicType
    , stats = { hp = 50, attack = 150, defense = 50, specialAttack = 150, specialDefense = 50, speed = 150 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 735
    , name = "デカグース"
    , englishName = "デカグース"
    , pokemonType = NormalType
    , stats = { hp = 88, attack = 110, defense = 60, specialAttack = 55, specialDefense = 60, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 1002
    , name = "デカヌチャン"
    , englishName = "デカヌチャン"
    , pokemonType = SteelFairy
    , stats = { hp = 85, attack = 75, defense = 77, specialAttack = 70, specialDefense = 105, speed = 94 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 563
    , name = "デスカーン"
    , englishName = "デスカーン"
    , pokemonType = GhostType
    , stats = { hp = 58, attack = 50, defense = 145, specialAttack = 95, specialDefense = 105, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 867
    , name = "デスバーン"
    , englishName = "デスバーン"
    , pokemonType = GroundGhost
    , stats = { hp = 58, attack = 95, defense = 145, specialAttack = 50, specialDefense = 105, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 562
    , name = "デスマス"
    , englishName = "デスマス"
    , pokemonType = GhostType
    , stats = { hp = 38, attack = 30, defense = 85, specialAttack = 55, specialDefense = 65, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10179
    , name = "デスマス(ガラル)"
    , englishName = "デスマス(ガラル)"
    , pokemonType = GroundGhost
    , stats = { hp = 38, attack = 55, defense = 85, specialAttack = 30, specialDefense = 65, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 797
    , name = "テッカグヤ"
    , englishName = "テッカグヤ"
    , pokemonType = FlyingSteel
    , stats = { hp = 97, attack = 101, defense = 103, specialAttack = 107, specialDefense = 101, speed = 61 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 291
    , name = "テッカニン"
    , englishName = "テッカニン"
    , pokemonType = FlyingBug
    , stats = { hp = 61, attack = 90, defense = 45, specialAttack = 50, specialDefense = 50, speed = 160 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 597
    , name = "テッシード"
    , englishName = "テッシード"
    , pokemonType = GrassSteel
    , stats = { hp = 44, attack = 50, defense = 91, specialAttack = 24, specialDefense = 86, speed = 10 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20016
    , name = "テツノイサハ"
    , englishName = "テツノイサハ"
    , pokemonType = GrassPsychic
    , stats = { hp = 90, attack = 130, defense = 88, specialAttack = 70, specialDefense = 108, speed = 104 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 991
    , name = "テツノイバラ"
    , englishName = "テツノイバラ"
    , pokemonType = ElectricRock
    , stats = { hp = 100, attack = 134, defense = 110, specialAttack = 70, specialDefense = 84, speed = 72 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20032
    , name = "テツノイワオ"
    , englishName = "テツノイワオ"
    , pokemonType = PsychicRock
    , stats = { hp = 90, attack = 120, defense = 80, specialAttack = 68, specialDefense = 108, speed = 124 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 989
    , name = "テツノカイナ"
    , englishName = "テツノカイナ"
    , pokemonType = ElectricFighting
    , stats = { hp = 154, attack = 140, defense = 108, specialAttack = 50, specialDefense = 68, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20033
    , name = "テツノカシラ"
    , englishName = "テツノカシラ"
    , pokemonType = PsychicSteel
    , stats = { hp = 90, attack = 72, defense = 100, specialAttack = 122, specialDefense = 108, speed = 98 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 990
    , name = "テツノコウベ"
    , englishName = "テツノコウベ"
    , pokemonType = FlyingDark
    , stats = { hp = 94, attack = 80, defense = 86, specialAttack = 122, specialDefense = 80, speed = 108 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 992
    , name = "テツノツツミ"
    , englishName = "テツノツツミ"
    , pokemonType = WaterIce
    , stats = { hp = 56, attack = 80, defense = 114, specialAttack = 124, specialDefense = 60, speed = 136 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 988
    , name = "テツノドクガ"
    , englishName = "テツノドクガ"
    , pokemonType = FirePoison
    , stats = { hp = 80, attack = 70, defense = 60, specialAttack = 140, specialDefense = 110, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 993
    , name = "テツノブジン"
    , englishName = "テツノブジン"
    , pokemonType = FightingFairy
    , stats = { hp = 74, attack = 130, defense = 90, specialAttack = 120, specialDefense = 60, speed = 116 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 986
    , name = "テツノワダチ"
    , englishName = "テツノワダチ"
    , pokemonType = GroundSteel
    , stats = { hp = 90, attack = 112, defense = 120, specialAttack = 72, specialDefense = 70, speed = 106 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 223
    , name = "テッポウオ"
    , englishName = "テッポウオ"
    , pokemonType = WaterType
    , stats = { hp = 35, attack = 65, defense = 35, specialAttack = 65, specialDefense = 35, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 702
    , name = "デデンネ"
    , englishName = "デデンネ"
    , pokemonType = ElectricFairy
    , stats = { hp = 67, attack = 58, defense = 57, specialAttack = 81, specialDefense = 67, speed = 101 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 857
    , name = "テブリム"
    , englishName = "テブリム"
    , pokemonType = PsychicType
    , stats = { hp = 57, attack = 40, defense = 65, specialAttack = 86, specialDefense = 73, speed = 49 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 639
    , name = "テラキオン"
    , englishName = "テラキオン"
    , pokemonType = FightingRock
    , stats = { hp = 91, attack = 129, defense = 90, specialAttack = 72, specialDefense = 90, speed = 108 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20036
    , name = "テラパゴス(ステラ)"
    , englishName = "テラパゴス(ステラ)"
    , pokemonType = NormalType
    , stats = { hp = 160, attack = 105, defense = 110, specialAttack = 130, specialDefense = 110, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20035
    , name = "テラパゴス(テラスタル)"
    , englishName = "テラパゴス(テラスタル)"
    , pokemonType = NormalType
    , stats = { hp = 95, attack = 95, defense = 110, specialAttack = 105, specialDefense = 110, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20034
    , name = "テラパゴス(ノーマル)"
    , englishName = "テラパゴス(ノーマル)"
    , pokemonType = NormalType
    , stats = { hp = 90, attack = 65, defense = 85, specialAttack = 65, specialDefense = 85, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 225
    , name = "デリバード"
    , englishName = "デリバード"
    , pokemonType = IceFlying
    , stats = { hp = 45, attack = 55, defense = 45, specialAttack = 65, specialDefense = 45, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 228
    , name = "デルビル"
    , englishName = "デルビル"
    , pokemonType = FireDark
    , stats = { hp = 45, attack = 60, defense = 30, specialAttack = 80, specialDefense = 50, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 796
    , name = "デンジュモク"
    , englishName = "デンジュモク"
    , pokemonType = ElectricType
    , stats = { hp = 83, attack = 89, defense = 71, specialAttack = 173, specialDefense = 71, speed = 83 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 737
    , name = "デンヂムシ"
    , englishName = "デンヂムシ"
    , pokemonType = ElectricBug
    , stats = { hp = 57, attack = 82, defense = 95, specialAttack = 55, specialDefense = 75, speed = 36 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 596
    , name = "デンチュラ"
    , englishName = "デンチュラ"
    , pokemonType = ElectricBug
    , stats = { hp = 70, attack = 77, defense = 60, specialAttack = 97, specialDefense = 60, speed = 108 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 181
    , name = "デンリュウ"
    , englishName = "デンリュウ"
    , pokemonType = ElectricType
    , stats = { hp = 90, attack = 75, defense = 85, specialAttack = 115, specialDefense = 90, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10045
    , name = "デンリュウ(メガ)"
    , englishName = "デンリュウ(メガ)"
    , pokemonType = ElectricDragon
    , stats = { hp = 90, attack = 95, defense = 105, specialAttack = 165, specialDefense = 110, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 1009
    , name = "ドオー"
    , englishName = "ドオー"
    , pokemonType = PoisonGround
    , stats = { hp = 130, attack = 75, defense = 60, specialAttack = 45, specialDefense = 100, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 437
    , name = "ドータクン"
    , englishName = "ドータクン"
    , pokemonType = PsychicSteel
    , stats = { hp = 67, attack = 89, defense = 116, specialAttack = 79, specialDefense = 116, speed = 33 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 84
    , name = "ドードー"
    , englishName = "ドードー"
    , pokemonType = NormalFlying
    , stats = { hp = 35, attack = 85, defense = 45, specialAttack = 35, specialDefense = 35, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 85
    , name = "ドードリオ"
    , englishName = "ドードリオ"
    , pokemonType = NormalFlying
    , stats = { hp = 60, attack = 110, defense = 70, specialAttack = 60, specialDefense = 60, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 235
    , name = "ドーブル"
    , englishName = "ドーブル"
    , pokemonType = NormalType
    , stats = { hp = 55, attack = 20, defense = 35, specialAttack = 20, specialDefense = 45, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 436
    , name = "ドーミラー"
    , englishName = "ドーミラー"
    , pokemonType = PsychicSteel
    , stats = { hp = 57, attack = 24, defense = 86, specialAttack = 24, specialDefense = 86, speed = 23 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 109
    , name = "ドガース"
    , englishName = "ドガース"
    , pokemonType = PoisonType
    , stats = { hp = 40, attack = 65, defense = 95, specialAttack = 60, specialDefense = 45, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 73
    , name = "ドククラゲ"
    , englishName = "ドククラゲ"
    , pokemonType = WaterPoison
    , stats = { hp = 80, attack = 70, defense = 65, specialAttack = 80, specialDefense = 120, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 269
    , name = "ドクケイル"
    , englishName = "ドクケイル"
    , pokemonType = PoisonBug
    , stats = { hp = 60, attack = 50, defense = 70, specialAttack = 50, specialDefense = 90, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 454
    , name = "ドクロッグ"
    , englishName = "ドクロッグ"
    , pokemonType = FightingPoison
    , stats = { hp = 83, attack = 106, defense = 65, specialAttack = 86, specialDefense = 65, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 468
    , name = "トゲキッス"
    , englishName = "トゲキッス"
    , pokemonType = FlyingFairy
    , stats = { hp = 85, attack = 50, defense = 95, specialAttack = 120, specialDefense = 115, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 176
    , name = "トゲチック"
    , englishName = "トゲチック"
    , pokemonType = FlyingFairy
    , stats = { hp = 55, attack = 40, defense = 85, specialAttack = 80, specialDefense = 105, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 777
    , name = "トゲデマル"
    , englishName = "トゲデマル"
    , pokemonType = ElectricSteel
    , stats = { hp = 65, attack = 98, defense = 63, specialAttack = 40, specialDefense = 73, speed = 96 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 175
    , name = "トゲピー"
    , englishName = "トゲピー"
    , pokemonType = FairyType
    , stats = { hp = 35, attack = 20, defense = 65, specialAttack = 40, specialDefense = 65, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 294
    , name = "ドゴーム"
    , englishName = "ドゴーム"
    , pokemonType = NormalType
    , stats = { hp = 84, attack = 71, defense = 43, specialAttack = 71, specialDefense = 43, speed = 48 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 464
    , name = "ドサイドン"
    , englishName = "ドサイドン"
    , pokemonType = GroundRock
    , stats = { hp = 115, attack = 140, defense = 130, specialAttack = 55, specialDefense = 55, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 118
    , name = "トサキント"
    , englishName = "トサキント"
    , pokemonType = WaterType
    , stats = { hp = 45, attack = 67, defense = 60, specialAttack = 35, specialDefense = 50, speed = 63 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 339
    , name = "ドジョッチ"
    , englishName = "ドジョッチ"
    , pokemonType = WaterGround
    , stats = { hp = 50, attack = 48, defense = 43, specialAttack = 46, specialDefense = 41, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 389
    , name = "ドダイトス"
    , englishName = "ドダイトス"
    , pokemonType = GrassGround
    , stats = { hp = 95, attack = 109, defense = 105, specialAttack = 75, specialDefense = 85, speed = 56 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 532
    , name = "ドッコラー"
    , englishName = "ドッコラー"
    , pokemonType = FightingType
    , stats = { hp = 75, attack = 80, defense = 55, specialAttack = 25, specialDefense = 35, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 733
    , name = "ドデカバシ"
    , englishName = "ドデカバシ"
    , pokemonType = NormalFlying
    , stats = { hp = 80, attack = 120, defense = 75, specialAttack = 75, specialDefense = 75, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 533
    , name = "ドテッコツ"
    , englishName = "ドテッコツ"
    , pokemonType = FightingType
    , stats = { hp = 85, attack = 105, defense = 85, specialAttack = 40, specialDefense = 50, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 364
    , name = "トドグラー"
    , englishName = "トドグラー"
    , pokemonType = WaterIce
    , stats = { hp = 90, attack = 60, defense = 70, specialAttack = 75, specialDefense = 70, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 1008
    , name = "ドドゲザン"
    , englishName = "ドドゲザン"
    , pokemonType = DarkSteel
    , stats = { hp = 100, attack = 135, defense = 120, specialAttack = 60, specialDefense = 85, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 365
    , name = "トドゼルガ"
    , englishName = "トドゼルガ"
    , pokemonType = WaterIce
    , stats = { hp = 110, attack = 80, defense = 90, specialAttack = 95, specialDefense = 90, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 985
    , name = "トドロクツキ"
    , englishName = "トドロクツキ"
    , pokemonType = DragonDark
    , stats = { hp = 105, attack = 139, defense = 71, specialAttack = 55, specialDefense = 101, speed = 119 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 748
    , name = "ドヒドイデ"
    , englishName = "ドヒドイデ"
    , pokemonType = WaterPoison
    , stats = { hp = 50, attack = 63, defense = 152, specialAttack = 53, specialDefense = 142, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 887
    , name = "ドラパルト"
    , englishName = "ドラパルト"
    , pokemonType = GhostDragon
    , stats = { hp = 88, attack = 120, defense = 75, specialAttack = 100, specialDefense = 75, speed = 142 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 452
    , name = "ドラピオン"
    , englishName = "ドラピオン"
    , pokemonType = PoisonDark
    , stats = { hp = 70, attack = 90, defense = 110, specialAttack = 60, specialDefense = 75, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 691
    , name = "ドラミドロ"
    , englishName = "ドラミドロ"
    , pokemonType = PoisonDragon
    , stats = { hp = 65, attack = 75, defense = 90, specialAttack = 97, specialDefense = 123, speed = 44 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 885
    , name = "ドラメシヤ"
    , englishName = "ドラメシヤ"
    , pokemonType = GhostDragon
    , stats = { hp = 28, attack = 60, defense = 30, specialAttack = 40, specialDefense = 30, speed = 82 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 11
    , name = "トランセル"
    , englishName = "トランセル"
    , pokemonType = BugType
    , stats = { hp = 50, attack = 20, defense = 55, specialAttack = 25, specialDefense = 25, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 411
    , name = "トリデプス"
    , englishName = "トリデプス"
    , pokemonType = RockSteel
    , stats = { hp = 60, attack = 52, defense = 168, specialAttack = 47, specialDefense = 138, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 423
    , name = "トリトドン"
    , englishName = "トリトドン"
    , pokemonType = WaterGround
    , stats = { hp = 111, attack = 83, defense = 68, specialAttack = 92, specialDefense = 82, speed = 39 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 676
    , name = "トリミアン"
    , englishName = "トリミアン"
    , pokemonType = NormalType
    , stats = { hp = 75, attack = 80, defense = 60, specialAttack = 65, specialDefense = 90, speed = 102 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 530
    , name = "ドリュウズ"
    , englishName = "ドリュウズ"
    , pokemonType = GroundSteel
    , stats = { hp = 110, attack = 135, defense = 60, specialAttack = 50, specialDefense = 65, speed = 88 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 641
    , name = "トルネロス(化身)"
    , englishName = "トルネロス(化身)"
    , pokemonType = FlyingType
    , stats = { hp = 79, attack = 115, defense = 70, specialAttack = 125, specialDefense = 80, speed = 111 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10019
    , name = "トルネロス(霊獣)"
    , englishName = "トルネロス(霊獣)"
    , pokemonType = FlyingType
    , stats = { hp = 79, attack = 100, defense = 80, specialAttack = 110, specialDefense = 90, speed = 121 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 549
    , name = "ドレディア"
    , englishName = "ドレディア"
    , pokemonType = GrassType
    , stats = { hp = 70, attack = 60, defense = 75, specialAttack = 110, specialDefense = 75, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10237
    , name = "ドレディア(ヒスイ)"
    , englishName = "ドレディア(ヒスイ)"
    , pokemonType = GrassFighting
    , stats = { hp = 70, attack = 105, defense = 75, specialAttack = 50, specialDefense = 75, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 838
    , name = "トロッゴン"
    , englishName = "トロッゴン"
    , pokemonType = FireRock
    , stats = { hp = 80, attack = 60, defense = 90, specialAttack = 60, specialDefense = 70, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 749
    , name = "ドロバンコ"
    , englishName = "ドロバンコ"
    , pokemonType = GroundType
    , stats = { hp = 70, attack = 100, defense = 70, specialAttack = 45, specialDefense = 55, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 357
    , name = "トロピウス"
    , englishName = "トロピウス"
    , pokemonType = GrassFlying
    , stats = { hp = 99, attack = 68, defense = 83, specialAttack = 72, specialDefense = 87, speed = 51 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 886
    , name = "ドロンチ"
    , englishName = "ドロンチ"
    , pokemonType = GhostDragon
    , stats = { hp = 68, attack = 80, defense = 50, specialAttack = 60, specialDefense = 50, speed = 102 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 430
    , name = "ドンカラス"
    , englishName = "ドンカラス"
    , pokemonType = FlyingDark
    , stats = { hp = 100, attack = 125, defense = 52, specialAttack = 105, specialDefense = 52, speed = 71 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 232
    , name = "ドンファン"
    , englishName = "ドンファン"
    , pokemonType = GroundType
    , stats = { hp = 90, attack = 120, defense = 120, specialAttack = 60, specialDefense = 60, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 322
    , name = "ドンメル"
    , englishName = "ドンメル"
    , pokemonType = FireGround
    , stats = { hp = 60, attack = 60, defense = 40, specialAttack = 65, specialDefense = 45, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 387
    , name = "ナエトル"
    , englishName = "ナエトル"
    , pokemonType = GrassType
    , stats = { hp = 55, attack = 68, defense = 64, specialAttack = 45, specialDefense = 55, speed = 31 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 1001
    , name = "ナカヌチャン"
    , englishName = "ナカヌチャン"
    , pokemonType = SteelFairy
    , stats = { hp = 65, attack = 55, defense = 55, specialAttack = 45, specialDefense = 82, speed = 78 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 538
    , name = "ナゲキ"
    , englishName = "ナゲキ"
    , pokemonType = FightingType
    , stats = { hp = 120, attack = 100, defense = 85, specialAttack = 30, specialDefense = 85, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 766
    , name = "ナゲツケサル"
    , englishName = "ナゲツケサル"
    , pokemonType = FightingType
    , stats = { hp = 100, attack = 120, defense = 90, specialAttack = 40, specialDefense = 60, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 43
    , name = "ナゾノクサ"
    , englishName = "ナゾノクサ"
    , pokemonType = GrassPoison
    , stats = { hp = 45, attack = 50, defense = 55, specialAttack = 75, specialDefense = 65, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 328
    , name = "ナックラー"
    , englishName = "ナックラー"
    , pokemonType = GroundType
    , stats = { hp = 45, attack = 100, defense = 45, specialAttack = 45, specialDefense = 45, speed = 10 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 103
    , name = "ナッシー"
    , englishName = "ナッシー"
    , pokemonType = GrassPsychic
    , stats = { hp = 95, attack = 95, defense = 85, specialAttack = 125, specialDefense = 75, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10114
    , name = "ナッシー(アローラ)"
    , englishName = "ナッシー(アローラ)"
    , pokemonType = GrassDragon
    , stats = { hp = 95, attack = 105, defense = 85, specialAttack = 125, specialDefense = 75, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 598
    , name = "ナットレイ"
    , englishName = "ナットレイ"
    , pokemonType = GrassSteel
    , stats = { hp = 74, attack = 94, defense = 131, specialAttack = 54, specialDefense = 116, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 287
    , name = "ナマケロ"
    , englishName = "ナマケロ"
    , pokemonType = NormalType
    , stats = { hp = 60, attack = 60, defense = 60, specialAttack = 35, specialDefense = 35, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 771
    , name = "ナマコブシ"
    , englishName = "ナマコブシ"
    , pokemonType = WaterType
    , stats = { hp = 55, attack = 60, defense = 130, specialAttack = 30, specialDefense = 130, speed = 5 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 340
    , name = "ナマズン"
    , englishName = "ナマズン"
    , pokemonType = WaterGround
    , stats = { hp = 110, attack = 78, defense = 73, specialAttack = 76, specialDefense = 71, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 933
    , name = "ナミイルカ"
    , englishName = "ナミイルカ"
    , pokemonType = WaterType
    , stats = { hp = 70, attack = 45, defense = 40, specialAttack = 45, specialDefense = 40, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 680
    , name = "ニダンギル"
    , englishName = "ニダンギル"
    , pokemonType = GhostSteel
    , stats = { hp = 59, attack = 110, defense = 150, specialAttack = 45, specialDefense = 49, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 34
    , name = "ニドキング"
    , englishName = "ニドキング"
    , pokemonType = PoisonGround
    , stats = { hp = 81, attack = 102, defense = 77, specialAttack = 85, specialDefense = 75, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 31
    , name = "ニドクイン"
    , englishName = "ニドクイン"
    , pokemonType = PoisonGround
    , stats = { hp = 90, attack = 92, defense = 87, specialAttack = 75, specialDefense = 85, speed = 76 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 29
    , name = "ニドラン♀"
    , englishName = "ニドラン♀"
    , pokemonType = PoisonType
    , stats = { hp = 55, attack = 47, defense = 52, specialAttack = 40, specialDefense = 40, speed = 41 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 32
    , name = "ニドラン♂"
    , englishName = "ニドラン♂"
    , pokemonType = PoisonType
    , stats = { hp = 46, attack = 57, defense = 40, specialAttack = 40, specialDefense = 40, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 30
    , name = "ニドリーナ"
    , englishName = "ニドリーナ"
    , pokemonType = PoisonType
    , stats = { hp = 70, attack = 62, defense = 67, specialAttack = 55, specialDefense = 55, speed = 56 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 33
    , name = "ニドリーノ"
    , englishName = "ニドリーノ"
    , pokemonType = PoisonType
    , stats = { hp = 61, attack = 72, defense = 57, specialAttack = 55, specialDefense = 55, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 52
    , name = "ニャース"
    , englishName = "ニャース"
    , pokemonType = NormalType
    , stats = { hp = 40, attack = 45, defense = 35, specialAttack = 40, specialDefense = 40, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10107
    , name = "ニャース(アローラ)"
    , englishName = "ニャース(アローラ)"
    , pokemonType = DarkType
    , stats = { hp = 40, attack = 35, defense = 35, specialAttack = 50, specialDefense = 40, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10161
    , name = "ニャース(ガラル)"
    , englishName = "ニャース(ガラル)"
    , pokemonType = SteelType
    , stats = { hp = 50, attack = 65, defense = 55, specialAttack = 40, specialDefense = 40, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 863
    , name = "ニャイキング"
    , englishName = "ニャイキング"
    , pokemonType = SteelType
    , stats = { hp = 70, attack = 110, defense = 100, specialAttack = 50, specialDefense = 60, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10025
    , name = "ニャオニクス(♀)"
    , englishName = "ニャオニクス(♀)"
    , pokemonType = PsychicType
    , stats = { hp = 74, attack = 48, defense = 76, specialAttack = 83, specialDefense = 81, speed = 104 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 678
    , name = "ニャオニクス(♂)"
    , englishName = "ニャオニクス(♂)"
    , pokemonType = PsychicType
    , stats = { hp = 74, attack = 48, defense = 76, specialAttack = 83, specialDefense = 81, speed = 104 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 906
    , name = "ニャオハ"
    , englishName = "ニャオハ"
    , pokemonType = GrassType
    , stats = { hp = 40, attack = 61, defense = 54, specialAttack = 45, specialDefense = 45, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 677
    , name = "ニャスパー"
    , englishName = "ニャスパー"
    , pokemonType = PsychicType
    , stats = { hp = 62, attack = 48, defense = 54, specialAttack = 63, specialDefense = 60, speed = 68 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 725
    , name = "ニャビー"
    , englishName = "ニャビー"
    , pokemonType = FireType
    , stats = { hp = 45, attack = 65, defense = 40, specialAttack = 60, specialDefense = 40, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 726
    , name = "ニャヒート"
    , englishName = "ニャヒート"
    , pokemonType = FireType
    , stats = { hp = 65, attack = 85, defense = 50, specialAttack = 80, specialDefense = 50, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 431
    , name = "ニャルマー"
    , englishName = "ニャルマー"
    , pokemonType = NormalType
    , stats = { hp = 49, attack = 55, defense = 42, specialAttack = 42, specialDefense = 37, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 907
    , name = "ニャローテ"
    , englishName = "ニャローテ"
    , pokemonType = GrassType
    , stats = { hp = 61, attack = 80, defense = 63, specialAttack = 60, specialDefense = 63, speed = 83 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 215
    , name = "ニューラ"
    , englishName = "ニューラ"
    , pokemonType = IceDark
    , stats = { hp = 55, attack = 95, defense = 55, specialAttack = 35, specialDefense = 75, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10235
    , name = "ニューラ(ヒスイ)"
    , englishName = "ニューラ(ヒスイ)"
    , pokemonType = FightingPoison
    , stats = { hp = 55, attack = 95, defense = 55, specialAttack = 35, specialDefense = 75, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 61
    , name = "ニョロゾ"
    , englishName = "ニョロゾ"
    , pokemonType = WaterType
    , stats = { hp = 65, attack = 65, defense = 65, specialAttack = 50, specialDefense = 50, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 186
    , name = "ニョロトノ"
    , englishName = "ニョロトノ"
    , pokemonType = WaterType
    , stats = { hp = 90, attack = 75, defense = 75, specialAttack = 90, specialDefense = 100, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 62
    , name = "ニョロボン"
    , englishName = "ニョロボン"
    , pokemonType = WaterFighting
    , stats = { hp = 90, attack = 95, defense = 95, specialAttack = 70, specialDefense = 90, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 60
    , name = "ニョロモ"
    , englishName = "ニョロモ"
    , pokemonType = WaterType
    , stats = { hp = 40, attack = 50, defense = 40, specialAttack = 40, specialDefense = 40, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 700
    , name = "ニンフィア"
    , englishName = "ニンフィア"
    , pokemonType = FairyType
    , stats = { hp = 95, attack = 65, defense = 65, specialAttack = 110, specialDefense = 130, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 759
    , name = "ヌイコグマ"
    , englishName = "ヌイコグマ"
    , pokemonType = NormalFighting
    , stats = { hp = 70, attack = 75, defense = 50, specialAttack = 45, specialDefense = 50, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 195
    , name = "ヌオー"
    , englishName = "ヌオー"
    , pokemonType = WaterGround
    , stats = { hp = 95, attack = 85, defense = 85, specialAttack = 65, specialDefense = 65, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 292
    , name = "ヌケニン"
    , englishName = "ヌケニン"
    , pokemonType = BugGhost
    , stats = { hp = 1, attack = 90, defense = 45, specialAttack = 30, specialDefense = 30, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 259
    , name = "ヌマクロー"
    , englishName = "ヌマクロー"
    , pokemonType = WaterGround
    , stats = { hp = 70, attack = 85, defense = 70, specialAttack = 60, specialDefense = 70, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 705
    , name = "ヌメイル"
    , englishName = "ヌメイル"
    , pokemonType = DragonType
    , stats = { hp = 68, attack = 75, defense = 53, specialAttack = 83, specialDefense = 113, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10241
    , name = "ヌメイル(ヒスイ)"
    , englishName = "ヌメイル(ヒスイ)"
    , pokemonType = DragonSteel
    , stats = { hp = 58, attack = 75, defense = 83, specialAttack = 83, specialDefense = 113, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 704
    , name = "ヌメラ"
    , englishName = "ヌメラ"
    , pokemonType = DragonType
    , stats = { hp = 45, attack = 50, defense = 35, specialAttack = 55, specialDefense = 75, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 706
    , name = "ヌメルゴン"
    , englishName = "ヌメルゴン"
    , pokemonType = DragonType
    , stats = { hp = 90, attack = 100, defense = 70, specialAttack = 110, specialDefense = 150, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10242
    , name = "ヌメルゴン(ヒスイ)"
    , englishName = "ヌメルゴン(ヒスイ)"
    , pokemonType = DragonSteel
    , stats = { hp = 80, attack = 100, defense = 100, specialAttack = 110, specialDefense = 150, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 177
    , name = "ネイティ"
    , englishName = "ネイティ"
    , pokemonType = FlyingPsychic
    , stats = { hp = 40, attack = 50, defense = 45, specialAttack = 70, specialDefense = 45, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 178
    , name = "ネイティオ"
    , englishName = "ネイティオ"
    , pokemonType = FlyingPsychic
    , stats = { hp = 65, attack = 75, defense = 70, specialAttack = 95, specialDefense = 70, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 457
    , name = "ネオラント"
    , englishName = "ネオラント"
    , pokemonType = WaterType
    , stats = { hp = 69, attack = 69, defense = 76, specialAttack = 69, specialDefense = 86, speed = 91 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 865
    , name = "ネギガナイト"
    , englishName = "ネギガナイト"
    , pokemonType = FightingType
    , stats = { hp = 62, attack = 135, defense = 95, specialAttack = 68, specialDefense = 82, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 800
    , name = "ネクロズマ"
    , englishName = "ネクロズマ"
    , pokemonType = PsychicType
    , stats = { hp = 97, attack = 107, defense = 101, specialAttack = 127, specialDefense = 89, speed = 79 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10157
    , name = "ネクロズマ(ウルトラ)"
    , englishName = "ネクロズマ(ウルトラ)"
    , pokemonType = PsychicDragon
    , stats = { hp = 97, attack = 167, defense = 97, specialAttack = 167, specialDefense = 97, speed = 129 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10156
    , name = "ネクロズマ(月食)"
    , englishName = "ネクロズマ(月食)"
    , pokemonType = PsychicGhost
    , stats = { hp = 97, attack = 113, defense = 109, specialAttack = 157, specialDefense = 127, speed = 77 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10155
    , name = "ネクロズマ(日食)"
    , englishName = "ネクロズマ(日食)"
    , pokemonType = PsychicSteel
    , stats = { hp = 97, attack = 157, defense = 127, specialAttack = 113, specialDefense = 109, speed = 77 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 775
    , name = "ネッコアラ"
    , englishName = "ネッコアラ"
    , pokemonType = NormalType
    , stats = { hp = 65, attack = 115, defense = 65, specialAttack = 75, specialDefense = 95, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 755
    , name = "ネマシュ"
    , englishName = "ネマシュ"
    , pokemonType = GrassFairy
    , stats = { hp = 40, attack = 35, defense = 55, specialAttack = 65, specialDefense = 75, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 344
    , name = "ネンドール"
    , englishName = "ネンドール"
    , pokemonType = GroundPsychic
    , stats = { hp = 60, attack = 70, defense = 105, specialAttack = 70, specialDefense = 120, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 332
    , name = "ノクタス"
    , englishName = "ノクタス"
    , pokemonType = GrassDark
    , stats = { hp = 70, attack = 115, defense = 60, specialAttack = 115, specialDefense = 60, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 917
    , name = "ノココッチ"
    , englishName = "ノココッチ"
    , pokemonType = NormalType
    , stats = { hp = 125, attack = 100, defense = 80, specialAttack = 85, specialDefense = 75, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 206
    , name = "ノコッチ"
    , englishName = "ノコッチ"
    , pokemonType = NormalType
    , stats = { hp = 100, attack = 70, defense = 70, specialAttack = 65, specialDefense = 65, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 299
    , name = "ノズパス"
    , englishName = "ノズパス"
    , pokemonType = RockType
    , stats = { hp = 30, attack = 45, defense = 135, specialAttack = 45, specialDefense = 90, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 1006
    , name = "ノノクラゲ"
    , englishName = "ノノクラゲ"
    , pokemonType = GrassGround
    , stats = { hp = 40, attack = 40, defense = 35, specialAttack = 50, specialDefense = 100, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 507
    , name = "ハーデリア"
    , englishName = "ハーデリア"
    , pokemonType = NormalType
    , stats = { hp = 65, attack = 80, defense = 65, specialAttack = 35, specialDefense = 65, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 956
    , name = "パーモット"
    , englishName = "パーモット"
    , pokemonType = ElectricFighting
    , stats = { hp = 70, attack = 115, defense = 70, specialAttack = 70, specialDefense = 60, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 366
    , name = "パールル"
    , englishName = "パールル"
    , pokemonType = WaterType
    , stats = { hp = 35, attack = 64, defense = 85, specialAttack = 74, specialDefense = 55, speed = 32 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 832
    , name = "バイウールー"
    , englishName = "バイウールー"
    , pokemonType = NormalType
    , stats = { hp = 72, attack = 80, defense = 100, specialAttack = 60, specialDefense = 90, speed = 88 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 584
    , name = "バイバニラ"
    , englishName = "バイバニラ"
    , pokemonType = IceType
    , stats = { hp = 71, attack = 95, defense = 85, specialAttack = 110, specialDefense = 95, speed = 79 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 971
    , name = "バウッツェル"
    , englishName = "バウッツェル"
    , pokemonType = FairyType
    , stats = { hp = 57, attack = 80, defense = 115, specialAttack = 50, specialDefense = 80, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 86
    , name = "パウワウ"
    , englishName = "パウワウ"
    , pokemonType = WaterType
    , stats = { hp = 65, attack = 45, defense = 55, specialAttack = 45, specialDefense = 70, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 995
    , name = "パオジアン"
    , englishName = "パオジアン"
    , pokemonType = IceDark
    , stats = { hp = 80, attack = 120, defense = 80, specialAttack = 90, specialDefense = 65, speed = 135 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 514
    , name = "バオッキー"
    , englishName = "バオッキー"
    , pokemonType = FireType
    , stats = { hp = 75, attack = 98, defense = 63, specialAttack = 98, specialDefense = 63, speed = 101 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 513
    , name = "バオップ"
    , englishName = "バオップ"
    , pokemonType = FireType
    , stats = { hp = 50, attack = 53, defense = 48, specialAttack = 53, specialDefense = 48, speed = 64 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 925
    , name = "ハカドッグ"
    , englishName = "ハカドッグ"
    , pokemonType = GhostType
    , stats = { hp = 72, attack = 101, defense = 100, specialAttack = 50, specialDefense = 97, speed = 68 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 208
    , name = "ハガネール"
    , englishName = "ハガネール"
    , pokemonType = GroundSteel
    , stats = { hp = 75, attack = 85, defense = 200, specialAttack = 55, specialDefense = 65, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10072
    , name = "ハガネール(メガ)"
    , englishName = "ハガネール(メガ)"
    , pokemonType = GroundSteel
    , stats = { hp = 75, attack = 125, defense = 230, specialAttack = 55, specialDefense = 95, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 779
    , name = "ハギギシリ"
    , englishName = "ハギギシリ"
    , pokemonType = WaterPsychic
    , stats = { hp = 68, attack = 105, defense = 70, specialAttack = 70, specialDefense = 70, speed = 92 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 323
    , name = "バクーダ"
    , englishName = "バクーダ"
    , pokemonType = FireGround
    , stats = { hp = 70, attack = 100, defense = 70, specialAttack = 105, specialDefense = 75, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10087
    , name = "バクーダ(メガ)"
    , englishName = "バクーダ(メガ)"
    , pokemonType = FireGround
    , stats = { hp = 70, attack = 120, defense = 100, specialAttack = 145, specialDefense = 105, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 295
    , name = "バクオング"
    , englishName = "バクオング"
    , pokemonType = NormalType
    , stats = { hp = 104, attack = 91, defense = 63, specialAttack = 91, specialDefense = 73, speed = 68 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 776
    , name = "バクガメス"
    , englishName = "バクガメス"
    , pokemonType = FireDragon
    , stats = { hp = 60, attack = 78, defense = 135, specialAttack = 91, specialDefense = 85, speed = 36 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 157
    , name = "バクフーン"
    , englishName = "バクフーン"
    , pokemonType = FireType
    , stats = { hp = 78, attack = 84, defense = 78, specialAttack = 109, specialDefense = 85, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10233
    , name = "バクフーン(ヒスイ)"
    , englishName = "バクフーン(ヒスイ)"
    , pokemonType = FireGhost
    , stats = { hp = 73, attack = 84, defense = 78, specialAttack = 119, specialDefense = 85, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 148
    , name = "ハクリュー"
    , englishName = "ハクリュー"
    , pokemonType = DragonType
    , stats = { hp = 61, attack = 84, defense = 65, specialAttack = 70, specialDefense = 70, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 710
    , name = "バケッチャ"
    , englishName = "バケッチャ"
    , pokemonType = GrassGhost
    , stats = { hp = 49, attack = 66, defense = 70, specialAttack = 44, specialDefense = 55, speed = 51 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10027
    , name = "バケッチャ(小)"
    , englishName = "バケッチャ(小)"
    , pokemonType = GrassGhost
    , stats = { hp = 44, attack = 66, defense = 70, specialAttack = 44, specialDefense = 55, speed = 56 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10028
    , name = "バケッチャ(大)"
    , englishName = "バケッチャ(大)"
    , pokemonType = GrassGhost
    , stats = { hp = 54, attack = 66, defense = 70, specialAttack = 44, specialDefense = 55, speed = 46 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10029
    , name = "バケッチャ(特大)"
    , englishName = "バケッチャ(特大)"
    , pokemonType = GrassGhost
    , stats = { hp = 59, attack = 66, defense = 70, specialAttack = 44, specialDefense = 55, speed = 41 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 900
    , name = "バサギリ"
    , englishName = "バサギリ"
    , pokemonType = BugRock
    , stats = { hp = 70, attack = 135, defense = 95, specialAttack = 45, specialDefense = 70, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 257
    , name = "バシャーモ"
    , englishName = "バシャーモ"
    , pokemonType = FireFighting
    , stats = { hp = 80, attack = 120, defense = 70, specialAttack = 110, specialDefense = 70, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10050
    , name = "バシャーモ(メガ)"
    , englishName = "バシャーモ(メガ)"
    , pokemonType = FireFighting
    , stats = { hp = 80, attack = 160, defense = 80, specialAttack = 130, specialDefense = 80, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 271
    , name = "ハスブレロ"
    , englishName = "ハスブレロ"
    , pokemonType = WaterGrass
    , stats = { hp = 60, attack = 50, defense = 50, specialAttack = 60, specialDefense = 70, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 270
    , name = "ハスボー"
    , englishName = "ハスボー"
    , pokemonType = WaterGrass
    , stats = { hp = 40, attack = 30, defense = 30, specialAttack = 40, specialDefense = 50, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10016
    , name = "バスラオ(青筋)"
    , englishName = "バスラオ(青筋)"
    , pokemonType = WaterType
    , stats = { hp = 70, attack = 92, defense = 65, specialAttack = 80, specialDefense = 55, speed = 98 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 550
    , name = "バスラオ(赤筋)"
    , englishName = "バスラオ(赤筋)"
    , pokemonType = WaterType
    , stats = { hp = 70, attack = 92, defense = 65, specialAttack = 80, specialDefense = 55, speed = 98 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10247
    , name = "バスラオ(白筋)"
    , englishName = "バスラオ(白筋)"
    , pokemonType = WaterType
    , stats = { hp = 70, attack = 92, defense = 65, specialAttack = 80, specialDefense = 55, speed = 98 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 12
    , name = "バタフリー"
    , englishName = "バタフリー"
    , pokemonType = FlyingBug
    , stats = { hp = 60, attack = 45, defense = 50, specialAttack = 90, specialDefense = 80, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 595
    , name = "バチュル"
    , englishName = "バチュル"
    , pokemonType = ElectricBug
    , stats = { hp = 50, attack = 47, defense = 50, specialAttack = 57, specialDefense = 50, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 417
    , name = "パチリス"
    , englishName = "パチリス"
    , pokemonType = ElectricType
    , stats = { hp = 60, attack = 45, defense = 70, specialAttack = 45, specialDefense = 90, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 871
    , name = "バチンウニ"
    , englishName = "バチンウニ"
    , pokemonType = ElectricType
    , stats = { hp = 48, attack = 101, defense = 95, specialAttack = 91, specialDefense = 85, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 811
    , name = "バチンキー"
    , englishName = "バチンキー"
    , pokemonType = GrassType
    , stats = { hp = 70, attack = 85, defense = 70, specialAttack = 55, specialDefense = 60, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 212
    , name = "ハッサム"
    , englishName = "ハッサム"
    , pokemonType = BugSteel
    , stats = { hp = 70, attack = 130, defense = 100, specialAttack = 55, specialDefense = 80, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10046
    , name = "ハッサム(メガ)"
    , englishName = "ハッサム(メガ)"
    , pokemonType = BugSteel
    , stats = { hp = 70, attack = 150, defense = 140, specialAttack = 65, specialDefense = 100, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 327
    , name = "パッチール"
    , englishName = "パッチール"
    , pokemonType = NormalType
    , stats = { hp = 60, attack = 60, defense = 60, specialAttack = 60, specialDefense = 60, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 880
    , name = "パッチラゴン"
    , englishName = "パッチラゴン"
    , pokemonType = ElectricDragon
    , stats = { hp = 90, attack = 100, defense = 90, specialAttack = 80, specialDefense = 70, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 881
    , name = "パッチルドン"
    , englishName = "パッチルドン"
    , pokemonType = ElectricIce
    , stats = { hp = 90, attack = 100, defense = 90, specialAttack = 90, specialDefense = 80, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 626
    , name = "バッフロン"
    , englishName = "バッフロン"
    , pokemonType = NormalType
    , stats = { hp = 95, attack = 110, defense = 95, specialAttack = 40, specialDefense = 95, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 520
    , name = "ハトーボー"
    , englishName = "ハトーボー"
    , pokemonType = NormalFlying
    , stats = { hp = 62, attack = 77, defense = 62, specialAttack = 50, specialDefense = 42, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 898
    , name = "バドレックス"
    , englishName = "バドレックス"
    , pokemonType = GrassPsychic
    , stats = { hp = 100, attack = 80, defense = 80, specialAttack = 80, specialDefense = 80, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10194
    , name = "バドレックス(黒馬)"
    , englishName = "バドレックス(黒馬)"
    , pokemonType = PsychicGhost
    , stats = { hp = 100, attack = 85, defense = 80, specialAttack = 165, specialDefense = 100, speed = 150 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10193
    , name = "バドレックス(白馬)"
    , englishName = "バドレックス(白馬)"
    , pokemonType = IcePsychic
    , stats = { hp = 100, attack = 165, defense = 150, specialAttack = 85, specialDefense = 130, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 582
    , name = "バニプッチ"
    , englishName = "バニプッチ"
    , pokemonType = IceType
    , stats = { hp = 36, attack = 50, defense = 50, specialAttack = 65, specialDefense = 60, speed = 44 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 583
    , name = "バニリッチ"
    , englishName = "バニリッチ"
    , pokemonType = IceType
    , stats = { hp = 51, attack = 65, defense = 65, specialAttack = 80, specialDefense = 75, speed = 59 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 187
    , name = "ハネッコ"
    , englishName = "ハネッコ"
    , pokemonType = GrassFlying
    , stats = { hp = 35, attack = 35, defense = 40, specialAttack = 35, specialDefense = 55, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 325
    , name = "バネブー"
    , englishName = "バネブー"
    , pokemonType = PsychicType
    , stats = { hp = 60, attack = 25, defense = 35, specialAttack = 70, specialDefense = 80, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 542
    , name = "ハハコモリ"
    , englishName = "ハハコモリ"
    , pokemonType = GrassBug
    , stats = { hp = 75, attack = 103, defense = 80, specialAttack = 70, specialDefense = 80, speed = 92 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 983
    , name = "ハバタクカミ"
    , englishName = "ハバタクカミ"
    , pokemonType = GhostFairy
    , stats = { hp = 55, attack = 55, defense = 55, specialAttack = 135, specialDefense = 135, speed = 135 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 242
    , name = "ハピナス"
    , englishName = "ハピナス"
    , pokemonType = NormalType
    , stats = { hp = 255, attack = 10, defense = 10, specialAttack = 75, specialDefense = 135, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 970
    , name = "パピモッチ"
    , englishName = "パピモッチ"
    , pokemonType = FairyType
    , stats = { hp = 37, attack = 55, defense = 70, specialAttack = 30, specialDefense = 55, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 336
    , name = "ハブネーク"
    , englishName = "ハブネーク"
    , pokemonType = PoisonType
    , stats = { hp = 73, attack = 100, defense = 60, specialAttack = 100, specialDefense = 60, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20000
    , name = "パフュートン(♀)"
    , englishName = "パフュートン(♀)"
    , pokemonType = NormalType
    , stats = { hp = 115, attack = 90, defense = 70, specialAttack = 59, specialDefense = 90, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 916
    , name = "パフュートン(♂)"
    , englishName = "パフュートン(♂)"
    , pokemonType = NormalType
    , stats = { hp = 110, attack = 100, defense = 75, specialAttack = 59, specialDefense = 80, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 954
    , name = "パモ"
    , englishName = "パモ"
    , pokemonType = ElectricType
    , stats = { hp = 45, attack = 50, defense = 20, specialAttack = 40, specialDefense = 25, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 955
    , name = "パモット"
    , englishName = "パモット"
    , pokemonType = ElectricFighting
    , stats = { hp = 60, attack = 75, defense = 40, specialAttack = 50, specialDefense = 40, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 388
    , name = "ハヤシガメ"
    , englishName = "ハヤシガメ"
    , pokemonType = GrassType
    , stats = { hp = 75, attack = 89, defense = 85, specialAttack = 55, specialDefense = 65, speed = 36 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 46
    , name = "パラス"
    , englishName = "パラス"
    , pokemonType = GrassBug
    , stats = { hp = 35, attack = 70, defense = 55, specialAttack = 45, specialDefense = 55, speed = 25 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 47
    , name = "パラセクト"
    , englishName = "パラセクト"
    , pokemonType = GrassBug
    , stats = { hp = 60, attack = 95, defense = 80, specialAttack = 60, specialDefense = 80, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 941
    , name = "ハラバリー"
    , englishName = "ハラバリー"
    , pokemonType = ElectricType
    , stats = { hp = 109, attack = 64, defense = 91, specialAttack = 103, specialDefense = 83, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 211
    , name = "ハリーセン"
    , englishName = "ハリーセン"
    , pokemonType = WaterPoison
    , stats = { hp = 65, attack = 95, defense = 85, specialAttack = 55, specialDefense = 55, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10234
    , name = "ハリーセン(ヒスイ)"
    , englishName = "ハリーセン(ヒスイ)"
    , pokemonType = PoisonDark
    , stats = { hp = 65, attack = 95, defense = 85, specialAttack = 55, specialDefense = 55, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 904
    , name = "ハリーマン"
    , englishName = "ハリーマン"
    , pokemonType = PoisonDark
    , stats = { hp = 85, attack = 115, defense = 95, specialAttack = 65, specialDefense = 65, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 866
    , name = "バリコオル"
    , englishName = "バリコオル"
    , pokemonType = IcePsychic
    , stats = { hp = 80, attack = 85, defense = 75, specialAttack = 110, specialDefense = 100, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 297
    , name = "ハリテヤマ"
    , englishName = "ハリテヤマ"
    , pokemonType = FightingType
    , stats = { hp = 144, attack = 120, defense = 60, specialAttack = 40, specialDefense = 60, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 651
    , name = "ハリボーグ"
    , englishName = "ハリボーグ"
    , pokemonType = GrassType
    , stats = { hp = 61, attack = 78, defense = 95, specialAttack = 56, specialDefense = 58, speed = 57 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 650
    , name = "ハリマロン"
    , englishName = "ハリマロン"
    , pokemonType = GrassType
    , stats = { hp = 56, attack = 61, defense = 65, specialAttack = 48, specialDefense = 45, speed = 38 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 122
    , name = "バリヤード"
    , englishName = "バリヤード"
    , pokemonType = PsychicFairy
    , stats = { hp = 40, attack = 45, defense = 65, specialAttack = 100, specialDefense = 120, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10168
    , name = "バリヤード(ガラル)"
    , englishName = "バリヤード(ガラル)"
    , pokemonType = IcePsychic
    , stats = { hp = 50, attack = 65, defense = 65, specialAttack = 90, specialDefense = 90, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 484
    , name = "パルキア"
    , englishName = "パルキア"
    , pokemonType = WaterDragon
    , stats = { hp = 90, attack = 120, defense = 100, specialAttack = 150, specialDefense = 120, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10246
    , name = "パルキア(オリジン)"
    , englishName = "パルキア(オリジン)"
    , pokemonType = WaterDragon
    , stats = { hp = 90, attack = 100, defense = 100, specialAttack = 150, specialDefense = 120, speed = 120 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 236
    , name = "バルキー"
    , englishName = "バルキー"
    , pokemonType = FightingType
    , stats = { hp = 35, attack = 35, defense = 35, specialAttack = 35, specialDefense = 35, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 948
    , name = "ハルクジラ"
    , englishName = "ハルクジラ"
    , pokemonType = IceType
    , stats = { hp = 170, attack = 113, defense = 65, specialAttack = 45, specialDefense = 55, speed = 73 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 630
    , name = "バルジーナ"
    , englishName = "バルジーナ"
    , pokemonType = FlyingDark
    , stats = { hp = 110, attack = 65, defense = 105, specialAttack = 55, specialDefense = 95, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 91
    , name = "パルシェン"
    , englishName = "パルシェン"
    , pokemonType = WaterIce
    , stats = { hp = 50, attack = 95, defense = 180, specialAttack = 85, specialDefense = 45, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 836
    , name = "パルスワン"
    , englishName = "パルスワン"
    , pokemonType = ElectricType
    , stats = { hp = 69, attack = 90, defense = 60, specialAttack = 90, specialDefense = 60, speed = 121 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 629
    , name = "バルチャイ"
    , englishName = "バルチャイ"
    , pokemonType = FlyingDark
    , stats = { hp = 70, attack = 55, defense = 75, specialAttack = 45, specialDefense = 65, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 313
    , name = "バルビート"
    , englishName = "バルビート"
    , pokemonType = BugType
    , stats = { hp = 65, attack = 73, defense = 75, specialAttack = 47, specialDefense = 85, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 248
    , name = "バンギラス"
    , englishName = "バンギラス"
    , pokemonType = RockDark
    , stats = { hp = 100, attack = 134, defense = 110, specialAttack = 95, specialDefense = 100, speed = 61 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10049
    , name = "バンギラス(メガ)"
    , englishName = "バンギラス(メガ)"
    , pokemonType = RockDark
    , stats = { hp = 100, attack = 164, defense = 150, specialAttack = 95, specialDefense = 120, speed = 71 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 367
    , name = "ハンテール"
    , englishName = "ハンテール"
    , pokemonType = WaterType
    , stats = { hp = 55, attack = 104, defense = 105, specialAttack = 94, specialDefense = 75, speed = 52 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 750
    , name = "バンバドロ"
    , englishName = "バンバドロ"
    , pokemonType = GroundType
    , stats = { hp = 100, attack = 125, defense = 100, specialAttack = 55, specialDefense = 85, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 711
    , name = "パンプジン"
    , englishName = "パンプジン"
    , pokemonType = GrassGhost
    , stats = { hp = 65, attack = 90, defense = 122, specialAttack = 58, specialDefense = 75, speed = 84 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10030
    , name = "パンプジン(小)"
    , englishName = "パンプジン(小)"
    , pokemonType = GrassGhost
    , stats = { hp = 55, attack = 85, defense = 122, specialAttack = 58, specialDefense = 75, speed = 99 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10031
    , name = "パンプジン(大)"
    , englishName = "パンプジン(大)"
    , pokemonType = GrassGhost
    , stats = { hp = 75, attack = 95, defense = 122, specialAttack = 58, specialDefense = 75, speed = 69 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10032
    , name = "パンプジン(特大)"
    , englishName = "パンプジン(特大)"
    , pokemonType = GrassGhost
    , stats = { hp = 85, attack = 100, defense = 122, specialAttack = 58, specialDefense = 75, speed = 54 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 173
    , name = "ピィ"
    , englishName = "ピィ"
    , pokemonType = FairyType
    , stats = { hp = 50, attack = 25, defense = 28, specialAttack = 45, specialDefense = 55, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 416
    , name = "ビークイン"
    , englishName = "ビークイン"
    , pokemonType = FlyingBug
    , stats = { hp = 70, attack = 80, defense = 102, specialAttack = 80, specialDefense = 102, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 400
    , name = "ビーダル"
    , englishName = "ビーダル"
    , pokemonType = NormalWater
    , stats = { hp = 79, attack = 85, defense = 60, specialAttack = 55, specialDefense = 60, speed = 71 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 485
    , name = "ヒードラン"
    , englishName = "ヒードラン"
    , pokemonType = FireSteel
    , stats = { hp = 91, attack = 90, defense = 106, specialAttack = 130, specialDefense = 106, speed = 77 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 13
    , name = "ビードル"
    , englishName = "ビードル"
    , pokemonType = PoisonBug
    , stats = { hp = 40, attack = 35, defense = 30, specialAttack = 20, specialDefense = 20, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 25
    , name = "ピカチュウ"
    , englishName = "ピカチュウ"
    , pokemonType = ElectricType
    , stats = { hp = 35, attack = 55, defense = 40, specialAttack = 50, specialDefense = 50, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 36
    , name = "ピクシー"
    , englishName = "ピクシー"
    , pokemonType = FairyType
    , stats = { hp = 95, attack = 70, defense = 73, specialAttack = 95, specialDefense = 90, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 494
    , name = "ビクティニ"
    , englishName = "ビクティニ"
    , pokemonType = FirePsychic
    , stats = { hp = 100, attack = 100, defense = 100, specialAttack = 100, specialDefense = 100, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 390
    , name = "ヒコザル"
    , englishName = "ヒコザル"
    , pokemonType = FireType
    , stats = { hp = 44, attack = 58, defense = 44, specialAttack = 58, specialDefense = 44, speed = 61 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 18
    , name = "ピジョット"
    , englishName = "ピジョット"
    , pokemonType = NormalFlying
    , stats = { hp = 83, attack = 80, defense = 75, specialAttack = 70, specialDefense = 70, speed = 101 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10073
    , name = "ピジョット(メガ)"
    , englishName = "ピジョット(メガ)"
    , pokemonType = NormalFlying
    , stats = { hp = 83, attack = 80, defense = 80, specialAttack = 135, specialDefense = 80, speed = 121 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 17
    , name = "ピジョン"
    , englishName = "ピジョン"
    , pokemonType = NormalFlying
    , stats = { hp = 63, attack = 60, defense = 55, specialAttack = 50, specialDefense = 50, speed = 71 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 172
    , name = "ピチュー"
    , englishName = "ピチュー"
    , pokemonType = ElectricType
    , stats = { hp = 20, attack = 40, defense = 15, specialAttack = 35, specialDefense = 35, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 399
    , name = "ビッパ"
    , englishName = "ビッパ"
    , pokemonType = NormalType
    , stats = { hp = 59, attack = 45, defense = 40, specialAttack = 35, specialDefense = 40, speed = 31 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 35
    , name = "ピッピ"
    , englishName = "ピッピ"
    , pokemonType = FairyType
    , stats = { hp = 70, attack = 45, defense = 48, specialAttack = 60, specialDefense = 65, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 747
    , name = "ヒドイデ"
    , englishName = "ヒドイデ"
    , pokemonType = WaterPoison
    , stats = { hp = 50, attack = 53, defense = 62, specialAttack = 43, specialDefense = 52, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 4
    , name = "ヒトカゲ"
    , englishName = "ヒトカゲ"
    , pokemonType = FireType
    , stats = { hp = 39, attack = 52, defense = 43, specialAttack = 60, specialDefense = 50, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 679
    , name = "ヒトツキ"
    , englishName = "ヒトツキ"
    , pokemonType = GhostSteel
    , stats = { hp = 45, attack = 80, defense = 100, specialAttack = 35, specialDefense = 37, speed = 28 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 120
    , name = "ヒトデマン"
    , englishName = "ヒトデマン"
    , pokemonType = WaterType
    , stats = { hp = 30, attack = 45, defense = 55, specialAttack = 70, specialDefense = 55, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 607
    , name = "ヒトモシ"
    , englishName = "ヒトモシ"
    , pokemonType = FireGhost
    , stats = { hp = 50, attack = 30, defense = 55, specialAttack = 65, specialDefense = 55, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 155
    , name = "ヒノアラシ"
    , englishName = "ヒノアラシ"
    , pokemonType = FireType
    , stats = { hp = 39, attack = 52, defense = 43, specialAttack = 60, specialDefense = 50, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 662
    , name = "ヒノヤコマ"
    , englishName = "ヒノヤコマ"
    , pokemonType = FireFlying
    , stats = { hp = 62, attack = 73, defense = 55, specialAttack = 56, specialDefense = 52, speed = 84 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 813
    , name = "ヒバニー"
    , englishName = "ヒバニー"
    , pokemonType = FireType
    , stats = { hp = 50, attack = 71, defense = 40, specialAttack = 40, specialDefense = 40, speed = 69 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 555
    , name = "ヒヒダルマ"
    , englishName = "ヒヒダルマ"
    , pokemonType = FireType
    , stats = { hp = 105, attack = 140, defense = 55, specialAttack = 30, specialDefense = 55, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10178
    , name = "ヒヒダルマ(ガラル,ダルマ)"
    , englishName = "ヒヒダルマ(ガラル,ダルマ)"
    , pokemonType = FireIce
    , stats = { hp = 105, attack = 160, defense = 55, specialAttack = 30, specialDefense = 55, speed = 135 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10177
    , name = "ヒヒダルマ(ガラル)"
    , englishName = "ヒヒダルマ(ガラル)"
    , pokemonType = IceType
    , stats = { hp = 105, attack = 140, defense = 55, specialAttack = 30, specialDefense = 55, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10017
    , name = "ヒヒダルマ(達磨)"
    , englishName = "ヒヒダルマ(達磨)"
    , pokemonType = FirePsychic
    , stats = { hp = 105, attack = 30, defense = 105, specialAttack = 140, specialDefense = 105, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 666
    , name = "ビビヨン"
    , englishName = "ビビヨン"
    , pokemonType = FlyingBug
    , stats = { hp = 80, attack = 52, defense = 50, specialAttack = 90, specialDefense = 50, speed = 89 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 329
    , name = "ビブラーバ"
    , englishName = "ビブラーバ"
    , pokemonType = GroundDragon
    , stats = { hp = 50, attack = 70, defense = 50, specialAttack = 50, specialDefense = 50, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 449
    , name = "ヒポポタス"
    , englishName = "ヒポポタス"
    , pokemonType = GroundType
    , stats = { hp = 68, attack = 72, defense = 78, specialAttack = 38, specialDefense = 42, speed = 32 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 191
    , name = "ヒマナッツ"
    , englishName = "ヒマナッツ"
    , pokemonType = GrassType
    , stats = { hp = 30, attack = 30, defense = 30, specialAttack = 30, specialDefense = 30, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 216
    , name = "ヒメグマ"
    , englishName = "ヒメグマ"
    , pokemonType = NormalType
    , stats = { hp = 60, attack = 80, defense = 50, specialAttack = 50, specialDefense = 50, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 829
    , name = "ヒメンカ"
    , englishName = "ヒメンカ"
    , pokemonType = GrassType
    , stats = { hp = 40, attack = 40, defense = 60, specialAttack = 40, specialDefense = 60, speed = 10 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 516
    , name = "ヒヤッキー"
    , englishName = "ヒヤッキー"
    , pokemonType = WaterType
    , stats = { hp = 75, attack = 98, defense = 63, specialAttack = 98, specialDefense = 63, speed = 101 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 515
    , name = "ヒヤップ"
    , englishName = "ヒヤップ"
    , pokemonType = WaterType
    , stats = { hp = 50, attack = 53, defense = 48, specialAttack = 53, specialDefense = 48, speed = 64 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 926
    , name = "ヒラヒナ"
    , englishName = "ヒラヒナ"
    , pokemonType = PsychicType
    , stats = { hp = 30, attack = 35, defense = 30, specialAttack = 55, specialDefense = 30, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 640
    , name = "ビリジオン"
    , englishName = "ビリジオン"
    , pokemonType = GrassFighting
    , stats = { hp = 91, attack = 90, defense = 72, specialAttack = 90, specialDefense = 129, speed = 108 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 100
    , name = "ビリリダマ"
    , englishName = "ビリリダマ"
    , pokemonType = ElectricType
    , stats = { hp = 40, attack = 30, defense = 50, specialAttack = 55, specialDefense = 55, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10231
    , name = "ビリリダマ(ヒスイ)"
    , englishName = "ビリリダマ(ヒスイ)"
    , pokemonType = ElectricGrass
    , stats = { hp = 40, attack = 30, defense = 50, specialAttack = 55, specialDefense = 55, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 349
    , name = "ヒンバス"
    , englishName = "ヒンバス"
    , pokemonType = WaterType
    , stats = { hp = 20, attack = 15, defense = 20, specialAttack = 10, specialDefense = 55, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 440
    , name = "ピンプク"
    , englishName = "ピンプク"
    , pokemonType = NormalType
    , stats = { hp = 100, attack = 5, defense = 5, specialAttack = 15, specialDefense = 65, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 663
    , name = "ファイアロー"
    , englishName = "ファイアロー"
    , pokemonType = FireFlying
    , stats = { hp = 78, attack = 81, defense = 71, specialAttack = 74, specialDefense = 69, speed = 126 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 146
    , name = "ファイヤー"
    , englishName = "ファイヤー"
    , pokemonType = FireFlying
    , stats = { hp = 90, attack = 100, defense = 90, specialAttack = 125, specialDefense = 85, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10171
    , name = "ファイヤー(ガラル)"
    , englishName = "ファイヤー(ガラル)"
    , pokemonType = FlyingDark
    , stats = { hp = 90, attack = 85, defense = 90, specialAttack = 100, specialDefense = 125, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 489
    , name = "フィオネ"
    , englishName = "フィオネ"
    , pokemonType = WaterType
    , stats = { hp = 80, attack = 80, defense = 80, specialAttack = 80, specialDefense = 80, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 418
    , name = "ブイゼル"
    , englishName = "ブイゼル"
    , pokemonType = WaterType
    , stats = { hp = 55, attack = 65, defense = 35, specialAttack = 60, specialDefense = 30, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 136
    , name = "ブースター"
    , englishName = "ブースター"
    , pokemonType = FireType
    , stats = { hp = 65, attack = 130, defense = 60, specialAttack = 95, specialDefense = 110, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 65
    , name = "フーディン"
    , englishName = "フーディン"
    , pokemonType = PsychicType
    , stats = { hp = 55, attack = 50, defense = 45, specialAttack = 135, specialDefense = 95, speed = 120 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10037
    , name = "フーディン(メガ)"
    , englishName = "フーディン(メガ)"
    , pokemonType = PsychicType
    , stats = { hp = 55, attack = 50, defense = 65, specialAttack = 175, specialDefense = 105, speed = 150 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10086
    , name = "フーパ(解放)"
    , englishName = "フーパ(解放)"
    , pokemonType = PsychicDark
    , stats = { hp = 80, attack = 160, defense = 60, specialAttack = 170, specialDefense = 130, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 720
    , name = "フーパ(戒め)"
    , englishName = "フーパ(戒め)"
    , pokemonType = PsychicGhost
    , stats = { hp = 80, attack = 110, defense = 60, specialAttack = 150, specialDefense = 130, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 126
    , name = "ブーバー"
    , englishName = "ブーバー"
    , pokemonType = FireType
    , stats = { hp = 65, attack = 95, defense = 57, specialAttack = 100, specialDefense = 85, speed = 93 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 467
    , name = "ブーバーン"
    , englishName = "ブーバーン"
    , pokemonType = FireType
    , stats = { hp = 75, attack = 95, defense = 67, specialAttack = 125, specialDefense = 95, speed = 83 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 326
    , name = "ブーピッグ"
    , englishName = "ブーピッグ"
    , pokemonType = PsychicType
    , stats = { hp = 80, attack = 45, defense = 65, specialAttack = 90, specialDefense = 110, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 795
    , name = "フェローチェ"
    , englishName = "フェローチェ"
    , pokemonType = FightingBug
    , stats = { hp = 71, attack = 137, defense = 37, specialAttack = 137, specialDefense = 37, speed = 151 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 828
    , name = "フォクスライ"
    , englishName = "フォクスライ"
    , pokemonType = DarkType
    , stats = { hp = 70, attack = 58, defense = 58, specialAttack = 87, specialDefense = 92, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 653
    , name = "フォッコ"
    , englishName = "フォッコ"
    , pokemonType = FireType
    , stats = { hp = 40, attack = 45, defense = 40, specialAttack = 62, specialDefense = 60, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 205
    , name = "フォレトス"
    , englishName = "フォレトス"
    , pokemonType = BugSteel
    , stats = { hp = 75, attack = 90, defense = 140, specialAttack = 60, specialDefense = 60, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 443
    , name = "フカマル"
    , englishName = "フカマル"
    , pokemonType = GroundDragon
    , stats = { hp = 58, attack = 70, defense = 45, specialAttack = 40, specialDefense = 45, speed = 42 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 723
    , name = "フクスロー"
    , englishName = "フクスロー"
    , pokemonType = GrassFlying
    , stats = { hp = 78, attack = 75, defense = 75, specialAttack = 70, specialDefense = 70, speed = 52 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 40
    , name = "プクリン"
    , englishName = "プクリン"
    , pokemonType = NormalFairy
    , stats = { hp = 140, attack = 70, defense = 45, specialAttack = 85, specialDefense = 50, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 2
    , name = "フシギソウ"
    , englishName = "フシギソウ"
    , pokemonType = GrassPoison
    , stats = { hp = 60, attack = 62, defense = 63, specialAttack = 80, specialDefense = 80, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 1
    , name = "フシギダネ"
    , englishName = "フシギダネ"
    , pokemonType = GrassPoison
    , stats = { hp = 45, attack = 49, defense = 49, specialAttack = 65, specialDefense = 65, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 3
    , name = "フシギバナ"
    , englishName = "フシギバナ"
    , pokemonType = GrassPoison
    , stats = { hp = 80, attack = 82, defense = 83, specialAttack = 100, specialDefense = 100, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10033
    , name = "フシギバナ(メガ)"
    , englishName = "フシギバナ(メガ)"
    , pokemonType = GrassPoison
    , stats = { hp = 80, attack = 100, defense = 123, specialAttack = 122, specialDefense = 120, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 543
    , name = "フシデ"
    , englishName = "フシデ"
    , pokemonType = PoisonBug
    , stats = { hp = 30, attack = 45, defense = 59, specialAttack = 30, specialDefense = 39, speed = 57 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 502
    , name = "フタチマル"
    , englishName = "フタチマル"
    , pokemonType = WaterType
    , stats = { hp = 75, attack = 75, defense = 60, specialAttack = 83, specialDefense = 60, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 142
    , name = "プテラ"
    , englishName = "プテラ"
    , pokemonType = FlyingRock
    , stats = { hp = 80, attack = 105, defense = 65, specialAttack = 60, specialDefense = 75, speed = 130 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10042
    , name = "プテラ(メガ)"
    , englishName = "プテラ(メガ)"
    , pokemonType = FlyingRock
    , stats = { hp = 80, attack = 135, defense = 85, specialAttack = 70, specialDefense = 95, speed = 150 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 432
    , name = "ブニャット"
    , englishName = "ブニャット"
    , pokemonType = NormalType
    , stats = { hp = 71, attack = 82, defense = 64, specialAttack = 64, specialDefense = 59, speed = 112 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 240
    , name = "ブビィ"
    , englishName = "ブビィ"
    , pokemonType = FireType
    , stats = { hp = 45, attack = 75, defense = 37, specialAttack = 70, specialDefense = 55, speed = 83 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 174
    , name = "ププリン"
    , englishName = "ププリン"
    , pokemonType = NormalFairy
    , stats = { hp = 90, attack = 30, defense = 15, specialAttack = 40, specialDefense = 20, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 671
    , name = "フラージェス"
    , englishName = "フラージェス"
    , pokemonType = FairyType
    , stats = { hp = 78, attack = 65, defense = 68, specialAttack = 112, specialDefense = 154, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 330
    , name = "フライゴン"
    , englishName = "フライゴン"
    , pokemonType = GroundDragon
    , stats = { hp = 80, attack = 100, defense = 80, specialAttack = 80, specialDefense = 80, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 670
    , name = "フラエッテ"
    , englishName = "フラエッテ"
    , pokemonType = FairyType
    , stats = { hp = 54, attack = 45, defense = 47, specialAttack = 75, specialDefense = 98, speed = 52 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 311
    , name = "プラスル"
    , englishName = "プラスル"
    , pokemonType = ElectricType
    , stats = { hp = 60, attack = 50, defense = 40, specialAttack = 85, specialDefense = 75, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 197
    , name = "ブラッキー"
    , englishName = "ブラッキー"
    , pokemonType = DarkType
    , stats = { hp = 95, attack = 65, defense = 110, specialAttack = 60, specialDefense = 130, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 669
    , name = "フラベベ"
    , englishName = "フラベベ"
    , pokemonType = FairyType
    , stats = { hp = 44, attack = 38, defense = 39, specialAttack = 61, specialDefense = 79, speed = 42 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 144
    , name = "フリーザー"
    , englishName = "フリーザー"
    , pokemonType = IceFlying
    , stats = { hp = 90, attack = 85, defense = 100, specialAttack = 95, specialDefense = 125, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10169
    , name = "フリーザー(ガラル)"
    , englishName = "フリーザー(ガラル)"
    , pokemonType = FlyingPsychic
    , stats = { hp = 90, attack = 85, defense = 85, specialAttack = 125, specialDefense = 100, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 615
    , name = "フリージオ"
    , englishName = "フリージオ"
    , pokemonType = IceType
    , stats = { hp = 80, attack = 50, defense = 50, specialAttack = 95, specialDefense = 135, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 652
    , name = "ブリガロン"
    , englishName = "ブリガロン"
    , pokemonType = GrassFighting
    , stats = { hp = 88, attack = 107, defense = 122, specialAttack = 74, specialDefense = 75, speed = 64 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 896
    , name = "ブリザポス"
    , englishName = "ブリザポス"
    , pokemonType = IceType
    , stats = { hp = 100, attack = 145, defense = 130, specialAttack = 65, specialDefense = 110, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20028
    , name = "ブリジュラス"
    , englishName = "ブリジュラス"
    , pokemonType = DragonSteel
    , stats = { hp = 90, attack = 105, defense = 130, specialAttack = 125, specialDefense = 65, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 858
    , name = "ブリムオン"
    , englishName = "ブリムオン"
    , pokemonType = PsychicFairy
    , stats = { hp = 57, attack = 90, defense = 95, specialAttack = 136, specialDefense = 103, speed = 29 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 39
    , name = "プリン"
    , englishName = "プリン"
    , pokemonType = NormalFairy
    , stats = { hp = 115, attack = 45, defense = 20, specialAttack = 45, specialDefense = 25, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 209
    , name = "ブルー"
    , englishName = "ブルー"
    , pokemonType = FairyType
    , stats = { hp = 60, attack = 80, defense = 50, specialAttack = 40, specialDefense = 40, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 592
    , name = "プルリル"
    , englishName = "プルリル"
    , pokemonType = WaterGhost
    , stats = { hp = 55, attack = 40, defense = 50, specialAttack = 65, specialDefense = 85, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 593
    , name = "ブルンゲル"
    , englishName = "ブルンゲル"
    , pokemonType = WaterGhost
    , stats = { hp = 100, attack = 60, defense = 70, specialAttack = 85, specialDefense = 105, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 683
    , name = "フレフワン"
    , englishName = "フレフワン"
    , pokemonType = FairyType
    , stats = { hp = 101, attack = 72, defense = 72, specialAttack = 99, specialDefense = 89, speed = 29 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 419
    , name = "フローゼル"
    , englishName = "フローゼル"
    , pokemonType = WaterType
    , stats = { hp = 85, attack = 105, defense = 55, specialAttack = 85, specialDefense = 50, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 693
    , name = "ブロスター"
    , englishName = "ブロスター"
    , pokemonType = WaterType
    , stats = { hp = 71, attack = 73, defense = 88, specialAttack = 120, specialDefense = 89, speed = 59 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 564
    , name = "プロトーガ"
    , englishName = "プロトーガ"
    , pokemonType = WaterRock
    , stats = { hp = 54, attack = 78, defense = 103, specialAttack = 53, specialDefense = 45, speed = 22 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 943
    , name = "ブロロローム"
    , englishName = "ブロロローム"
    , pokemonType = PoisonSteel
    , stats = { hp = 80, attack = 119, defense = 90, specialAttack = 54, specialDefense = 67, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 942
    , name = "ブロロン"
    , englishName = "ブロロン"
    , pokemonType = PoisonSteel
    , stats = { hp = 45, attack = 70, defense = 63, specialAttack = 30, specialDefense = 45, speed = 47 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 426
    , name = "フワライド"
    , englishName = "フワライド"
    , pokemonType = FlyingGhost
    , stats = { hp = 150, attack = 80, defense = 44, specialAttack = 90, specialDefense = 54, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 425
    , name = "フワンテ"
    , englishName = "フワンテ"
    , pokemonType = FlyingGhost
    , stats = { hp = 90, attack = 50, defense = 34, specialAttack = 60, specialDefense = 44, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 341
    , name = "ヘイガニ"
    , englishName = "ヘイガニ"
    , pokemonType = WaterType
    , stats = { hp = 43, attack = 80, defense = 65, specialAttack = 50, specialDefense = 35, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 931
    , name = "ヘイラッシャ"
    , englishName = "ヘイラッシャ"
    , pokemonType = WaterType
    , stats = { hp = 150, attack = 100, defense = 115, specialAttack = 65, specialDefense = 65, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 153
    , name = "ベイリーフ"
    , englishName = "ベイリーフ"
    , pokemonType = GrassType
    , stats = { hp = 60, attack = 62, defense = 80, specialAttack = 63, specialDefense = 80, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 88
    , name = "ベトベター"
    , englishName = "ベトベター"
    , pokemonType = PoisonType
    , stats = { hp = 80, attack = 80, defense = 50, specialAttack = 40, specialDefense = 50, speed = 25 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10112
    , name = "ベトベター(アローラ)"
    , englishName = "ベトベター(アローラ)"
    , pokemonType = PoisonDark
    , stats = { hp = 80, attack = 80, defense = 50, specialAttack = 40, specialDefense = 50, speed = 25 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 89
    , name = "ベトベトン"
    , englishName = "ベトベトン"
    , pokemonType = PoisonType
    , stats = { hp = 105, attack = 105, defense = 75, specialAttack = 65, specialDefense = 100, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10113
    , name = "ベトベトン(アローラ)"
    , englishName = "ベトベトン(アローラ)"
    , pokemonType = PoisonDark
    , stats = { hp = 105, attack = 105, defense = 75, specialAttack = 65, specialDefense = 100, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 803
    , name = "ベベノム"
    , englishName = "ベベノム"
    , pokemonType = PoisonType
    , stats = { hp = 67, attack = 73, defense = 67, specialAttack = 73, specialDefense = 67, speed = 73 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 923
    , name = "ベラカス"
    , englishName = "ベラカス"
    , pokemonType = PsychicBug
    , stats = { hp = 75, attack = 50, defense = 85, specialAttack = 115, specialDefense = 100, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 214
    , name = "ヘラクロス"
    , englishName = "ヘラクロス"
    , pokemonType = FightingBug
    , stats = { hp = 80, attack = 125, defense = 75, specialAttack = 40, specialDefense = 95, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10047
    , name = "ヘラクロス(メガ)"
    , englishName = "ヘラクロス(メガ)"
    , pokemonType = FightingBug
    , stats = { hp = 80, attack = 185, defense = 115, specialAttack = 40, specialDefense = 105, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 441
    , name = "ペラップ"
    , englishName = "ペラップ"
    , pokemonType = NormalFlying
    , stats = { hp = 76, attack = 65, defense = 45, specialAttack = 92, specialDefense = 42, speed = 91 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 279
    , name = "ペリッパー"
    , englishName = "ペリッパー"
    , pokemonType = WaterFlying
    , stats = { hp = 60, attack = 50, defense = 100, specialAttack = 95, specialDefense = 70, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 229
    , name = "ヘルガー"
    , englishName = "ヘルガー"
    , pokemonType = FireDark
    , stats = { hp = 75, attack = 90, defense = 50, specialAttack = 110, specialDefense = 80, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10048
    , name = "ヘルガー(メガ)"
    , englishName = "ヘルガー(メガ)"
    , pokemonType = FireDark
    , stats = { hp = 75, attack = 90, defense = 90, specialAttack = 140, specialDefense = 90, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 53
    , name = "ペルシアン"
    , englishName = "ペルシアン"
    , pokemonType = NormalType
    , stats = { hp = 65, attack = 70, defense = 60, specialAttack = 65, specialDefense = 65, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10108
    , name = "ペルシアン(アローラ)"
    , englishName = "ペルシアン(アローラ)"
    , pokemonType = DarkType
    , stats = { hp = 65, attack = 60, defense = 60, specialAttack = 75, specialDefense = 65, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 684
    , name = "ペロッパフ"
    , englishName = "ペロッパフ"
    , pokemonType = FairyType
    , stats = { hp = 62, attack = 48, defense = 66, specialAttack = 59, specialDefense = 57, speed = 49 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 859
    , name = "ベロバー"
    , englishName = "ベロバー"
    , pokemonType = DarkFairy
    , stats = { hp = 45, attack = 45, defense = 30, specialAttack = 55, specialDefense = 40, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 463
    , name = "ベロベルト"
    , englishName = "ベロベルト"
    , pokemonType = NormalType
    , stats = { hp = 110, attack = 85, defense = 95, specialAttack = 80, specialDefense = 95, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 685
    , name = "ペロリーム"
    , englishName = "ペロリーム"
    , pokemonType = FairyType
    , stats = { hp = 82, attack = 80, defense = 86, specialAttack = 85, specialDefense = 75, speed = 72 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 108
    , name = "ベロリンガ"
    , englishName = "ベロリンガ"
    , pokemonType = NormalType
    , stats = { hp = 90, attack = 55, defense = 75, specialAttack = 60, specialDefense = 75, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 545
    , name = "ペンドラー"
    , englishName = "ペンドラー"
    , pokemonType = PoisonBug
    , stats = { hp = 60, attack = 100, defense = 89, specialAttack = 55, specialDefense = 69, speed = 112 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 544
    , name = "ホイーガ"
    , englishName = "ホイーガ"
    , pokemonType = PoisonBug
    , stats = { hp = 40, attack = 55, defense = 99, specialAttack = 40, specialDefense = 79, speed = 47 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 250
    , name = "ホウオウ"
    , englishName = "ホウオウ"
    , pokemonType = FireFlying
    , stats = { hp = 106, attack = 130, defense = 90, specialAttack = 110, specialDefense = 154, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 321
    , name = "ホエルオー"
    , englishName = "ホエルオー"
    , pokemonType = WaterType
    , stats = { hp = 170, attack = 90, defense = 45, specialAttack = 90, specialDefense = 45, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 320
    , name = "ホエルコ"
    , englishName = "ホエルコ"
    , pokemonType = WaterType
    , stats = { hp = 130, attack = 70, defense = 35, specialAttack = 70, specialDefense = 35, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 163
    , name = "ホーホー"
    , englishName = "ホーホー"
    , pokemonType = NormalFlying
    , stats = { hp = 60, attack = 30, defense = 30, specialAttack = 36, specialDefense = 56, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 373
    , name = "ボーマンダ"
    , englishName = "ボーマンダ"
    , pokemonType = FlyingDragon
    , stats = { hp = 95, attack = 135, defense = 80, specialAttack = 110, specialDefense = 80, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10089
    , name = "ボーマンダ(メガ)"
    , englishName = "ボーマンダ(メガ)"
    , pokemonType = FlyingDragon
    , stats = { hp = 95, attack = 145, defense = 130, specialAttack = 120, specialDefense = 90, speed = 120 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 498
    , name = "ポカブ"
    , englishName = "ポカブ"
    , pokemonType = FireType
    , stats = { hp = 65, attack = 63, defense = 45, specialAttack = 45, specialDefense = 45, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 708
    , name = "ボクレー"
    , englishName = "ボクレー"
    , pokemonType = GrassGhost
    , stats = { hp = 43, attack = 70, defense = 48, specialAttack = 50, specialDefense = 60, speed = 38 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 909
    , name = "ホゲータ"
    , englishName = "ホゲータ"
    , pokemonType = FireType
    , stats = { hp = 67, attack = 45, defense = 59, specialAttack = 63, specialDefense = 40, speed = 36 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 819
    , name = "ホシガリス"
    , englishName = "ホシガリス"
    , pokemonType = NormalType
    , stats = { hp = 70, attack = 55, defense = 55, specialAttack = 35, specialDefense = 35, speed = 25 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 306
    , name = "ボスゴドラ"
    , englishName = "ボスゴドラ"
    , pokemonType = RockSteel
    , stats = { hp = 70, attack = 110, defense = 180, specialAttack = 60, specialDefense = 60, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10053
    , name = "ボスゴドラ(メガ)"
    , englishName = "ボスゴドラ(メガ)"
    , pokemonType = SteelType
    , stats = { hp = 70, attack = 140, defense = 230, specialAttack = 60, specialDefense = 80, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 924
    , name = "ボチ"
    , englishName = "ボチ"
    , pokemonType = GhostType
    , stats = { hp = 50, attack = 61, defense = 60, specialAttack = 30, specialDefense = 55, speed = 34 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 261
    , name = "ポチエナ"
    , englishName = "ポチエナ"
    , pokemonType = DarkType
    , stats = { hp = 35, attack = 55, defense = 35, specialAttack = 30, specialDefense = 30, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 394
    , name = "ポッタイシ"
    , englishName = "ポッタイシ"
    , pokemonType = WaterType
    , stats = { hp = 64, attack = 66, defense = 68, specialAttack = 81, specialDefense = 76, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 393
    , name = "ポッチャマ"
    , englishName = "ポッチャマ"
    , pokemonType = WaterType
    , stats = { hp = 53, attack = 51, defense = 53, specialAttack = 61, specialDefense = 56, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 855
    , name = "ポットデス"
    , englishName = "ポットデス"
    , pokemonType = GhostType
    , stats = { hp = 60, attack = 65, defense = 65, specialAttack = 134, specialDefense = 114, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 16
    , name = "ポッポ"
    , englishName = "ポッポ"
    , pokemonType = NormalFlying
    , stats = { hp = 40, attack = 45, defense = 40, specialAttack = 35, specialDefense = 35, speed = 56 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 77
    , name = "ポニータ"
    , englishName = "ポニータ"
    , pokemonType = FireType
    , stats = { hp = 50, attack = 85, defense = 55, specialAttack = 65, specialDefense = 65, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10162
    , name = "ポニータ(ガラル)"
    , englishName = "ポニータ(ガラル)"
    , pokemonType = PsychicType
    , stats = { hp = 50, attack = 85, defense = 55, specialAttack = 65, specialDefense = 65, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 188
    , name = "ポポッコ"
    , englishName = "ポポッコ"
    , pokemonType = GrassFlying
    , stats = { hp = 55, attack = 45, defense = 50, specialAttack = 45, specialDefense = 65, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 137
    , name = "ポリゴン"
    , englishName = "ポリゴン"
    , pokemonType = NormalType
    , stats = { hp = 65, attack = 60, defense = 70, specialAttack = 85, specialDefense = 75, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 233
    , name = "ポリゴン２"
    , englishName = "ポリゴン２"
    , pokemonType = NormalType
    , stats = { hp = 85, attack = 80, defense = 90, specialAttack = 105, specialDefense = 95, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 474
    , name = "ポリゴンＺ"
    , englishName = "ポリゴンＺ"
    , pokemonType = NormalType
    , stats = { hp = 85, attack = 80, defense = 70, specialAttack = 135, specialDefense = 75, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 660
    , name = "ホルード"
    , englishName = "ホルード"
    , pokemonType = NormalGround
    , stats = { hp = 85, attack = 56, defense = 77, specialAttack = 50, specialDefense = 77, speed = 78 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 721
    , name = "ボルケニオン"
    , englishName = "ボルケニオン"
    , pokemonType = FireWater
    , stats = { hp = 80, attack = 110, defense = 120, specialAttack = 130, specialDefense = 90, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 642
    , name = "ボルトロス(化身)"
    , englishName = "ボルトロス(化身)"
    , pokemonType = ElectricFlying
    , stats = { hp = 79, attack = 115, defense = 70, specialAttack = 125, specialDefense = 80, speed = 111 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10020
    , name = "ボルトロス(霊獣)"
    , englishName = "ボルトロス(霊獣)"
    , pokemonType = ElectricFlying
    , stats = { hp = 79, attack = 105, defense = 70, specialAttack = 145, specialDefense = 80, speed = 101 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 659
    , name = "ホルビー"
    , englishName = "ホルビー"
    , pokemonType = NormalType
    , stats = { hp = 38, attack = 36, defense = 38, specialAttack = 32, specialDefense = 36, speed = 57 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 351
    , name = "ポワルン"
    , englishName = "ポワルン"
    , pokemonType = NormalType
    , stats = { hp = 70, attack = 70, defense = 70, specialAttack = 70, specialDefense = 70, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10013
    , name = "ポワルン(炎)"
    , englishName = "ポワルン(炎)"
    , pokemonType = FireType
    , stats = { hp = 70, attack = 70, defense = 70, specialAttack = 70, specialDefense = 70, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10014
    , name = "ポワルン(水)"
    , englishName = "ポワルン(水)"
    , pokemonType = WaterType
    , stats = { hp = 70, attack = 70, defense = 70, specialAttack = 70, specialDefense = 70, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10015
    , name = "ポワルン(氷)"
    , englishName = "ポワルン(氷)"
    , pokemonType = IceType
    , stats = { hp = 70, attack = 70, defense = 70, specialAttack = 70, specialDefense = 70, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 686
    , name = "マーイーカ"
    , englishName = "マーイーカ"
    , pokemonType = PsychicDark
    , stats = { hp = 53, attack = 54, defense = 53, specialAttack = 37, specialDefense = 46, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 802
    , name = "マーシャドー"
    , englishName = "マーシャドー"
    , pokemonType = FightingGhost
    , stats = { hp = 90, attack = 125, defense = 80, specialAttack = 90, specialDefense = 90, speed = 125 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 312
    , name = "マイナン"
    , englishName = "マイナン"
    , pokemonType = ElectricType
    , stats = { hp = 60, attack = 40, defense = 50, specialAttack = 75, specialDefense = 85, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 801
    , name = "マギアナ"
    , englishName = "マギアナ"
    , pokemonType = SteelFairy
    , stats = { hp = 80, attack = 95, defense = 115, specialAttack = 130, specialDefense = 115, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 219
    , name = "マグカルゴ"
    , englishName = "マグカルゴ"
    , pokemonType = FireRock
    , stats = { hp = 60, attack = 50, defense = 120, specialAttack = 90, specialDefense = 80, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 296
    , name = "マクノシタ"
    , englishName = "マクノシタ"
    , pokemonType = FightingType
    , stats = { hp = 72, attack = 60, defense = 30, specialAttack = 20, specialDefense = 30, speed = 25 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 218
    , name = "マグマッグ"
    , englishName = "マグマッグ"
    , pokemonType = FireType
    , stats = { hp = 40, attack = 40, defense = 40, specialAttack = 70, specialDefense = 40, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 156
    , name = "マグマラシ"
    , englishName = "マグマラシ"
    , pokemonType = FireType
    , stats = { hp = 58, attack = 64, defense = 58, specialAttack = 80, specialDefense = 65, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 739
    , name = "マケンカニ"
    , englishName = "マケンカニ"
    , pokemonType = FightingType
    , stats = { hp = 47, attack = 82, defense = 57, specialAttack = 42, specialDefense = 47, speed = 63 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 756
    , name = "マシェード"
    , englishName = "マシェード"
    , pokemonType = GrassFairy
    , stats = { hp = 60, attack = 45, defense = 80, specialAttack = 90, specialDefense = 100, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20021
    , name = "マシマシラ"
    , englishName = "マシマシラ"
    , pokemonType = PoisonPsychic
    , stats = { hp = 88, attack = 75, defense = 66, specialAttack = 130, specialDefense = 90, speed = 106 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 908
    , name = "マスカーニャ"
    , englishName = "マスカーニャ"
    , pokemonType = GrassDark
    , stats = { hp = 76, attack = 110, defense = 70, specialAttack = 81, specialDefense = 70, speed = 123 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 455
    , name = "マスキッパ"
    , englishName = "マスキッパ"
    , pokemonType = GrassType
    , stats = { hp = 74, attack = 100, defense = 72, specialAttack = 90, specialDefense = 72, speed = 46 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 69
    , name = "マダツボミ"
    , englishName = "マダツボミ"
    , pokemonType = GrassPoison
    , stats = { hp = 50, attack = 75, defense = 35, specialAttack = 70, specialDefense = 30, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 110
    , name = "マタドガス"
    , englishName = "マタドガス"
    , pokemonType = PoisonType
    , stats = { hp = 65, attack = 90, defense = 120, specialAttack = 85, specialDefense = 70, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10167
    , name = "マタドガス(ガラル)"
    , englishName = "マタドガス(ガラル)"
    , pokemonType = PoisonFairy
    , stats = { hp = 65, attack = 90, defense = 120, specialAttack = 85, specialDefense = 70, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 618
    , name = "マッギョ"
    , englishName = "マッギョ"
    , pokemonType = ElectricGround
    , stats = { hp = 109, attack = 66, defense = 84, specialAttack = 81, specialDefense = 99, speed = 32 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10180
    , name = "マッギョ(ガラル)"
    , englishName = "マッギョ(ガラル)"
    , pokemonType = GroundSteel
    , stats = { hp = 109, attack = 81, defense = 99, specialAttack = 66, specialDefense = 84, speed = 32 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 794
    , name = "マッシブーン"
    , englishName = "マッシブーン"
    , pokemonType = FightingBug
    , stats = { hp = 107, attack = 139, defense = 139, specialAttack = 53, specialDefense = 53, speed = 79 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 264
    , name = "マッスグマ"
    , englishName = "マッスグマ"
    , pokemonType = NormalType
    , stats = { hp = 78, attack = 70, defense = 61, specialAttack = 50, specialDefense = 61, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10175
    , name = "マッスグマ(ガラル)"
    , englishName = "マッスグマ(ガラル)"
    , pokemonType = NormalDark
    , stats = { hp = 78, attack = 70, defense = 61, specialAttack = 50, specialDefense = 61, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 490
    , name = "マナフィ"
    , englishName = "マナフィ"
    , pokemonType = WaterType
    , stats = { hp = 100, attack = 100, defense = 100, specialAttack = 100, specialDefense = 100, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 461
    , name = "マニューラ"
    , englishName = "マニューラ"
    , pokemonType = IceDark
    , stats = { hp = 70, attack = 120, defense = 65, specialAttack = 45, specialDefense = 85, speed = 125 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 439
    , name = "マネネ"
    , englishName = "マネネ"
    , pokemonType = PsychicFairy
    , stats = { hp = 20, attack = 25, defense = 45, specialAttack = 70, specialDefense = 90, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 973
    , name = "マフィティフ"
    , englishName = "マフィティフ"
    , pokemonType = DarkType
    , stats = { hp = 80, attack = 120, defense = 90, specialAttack = 60, specialDefense = 70, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 655
    , name = "マフォクシー"
    , englishName = "マフォクシー"
    , pokemonType = FirePsychic
    , stats = { hp = 75, attack = 69, defense = 72, specialAttack = 114, specialDefense = 100, speed = 104 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 869
    , name = "マホイップ"
    , englishName = "マホイップ"
    , pokemonType = FairyType
    , stats = { hp = 65, attack = 60, defense = 75, specialAttack = 110, specialDefense = 121, speed = 64 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 868
    , name = "マホミル"
    , englishName = "マホミル"
    , pokemonType = FairyType
    , stats = { hp = 45, attack = 40, defense = 40, specialAttack = 50, specialDefense = 61, speed = 34 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 594
    , name = "ママンボウ"
    , englishName = "ママンボウ"
    , pokemonType = WaterType
    , stats = { hp = 165, attack = 75, defense = 80, specialAttack = 40, specialDefense = 45, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 920
    , name = "マメバッタ"
    , englishName = "マメバッタ"
    , pokemonType = BugType
    , stats = { hp = 33, attack = 46, defense = 40, specialAttack = 21, specialDefense = 25, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 519
    , name = "マメパト"
    , englishName = "マメパト"
    , pokemonType = NormalFlying
    , stats = { hp = 50, attack = 55, defense = 50, specialAttack = 36, specialDefense = 30, speed = 43 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 268
    , name = "マユルド"
    , englishName = "マユルド"
    , pokemonType = BugType
    , stats = { hp = 50, attack = 35, defense = 55, specialAttack = 25, specialDefense = 25, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 556
    , name = "マラカッチ"
    , englishName = "マラカッチ"
    , pokemonType = GrassType
    , stats = { hp = 75, attack = 86, defense = 67, specialAttack = 106, specialDefense = 67, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 183
    , name = "マリル"
    , englishName = "マリル"
    , pokemonType = WaterFairy
    , stats = { hp = 70, attack = 20, defense = 50, specialAttack = 20, specialDefense = 50, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 184
    , name = "マリルリ"
    , englishName = "マリルリ"
    , pokemonType = WaterFairy
    , stats = { hp = 100, attack = 50, defense = 80, specialAttack = 60, specialDefense = 80, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 317
    , name = "マルノーム"
    , englishName = "マルノーム"
    , pokemonType = PoisonType
    , stats = { hp = 100, attack = 73, defense = 83, specialAttack = 73, specialDefense = 83, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 101
    , name = "マルマイン"
    , englishName = "マルマイン"
    , pokemonType = ElectricType
    , stats = { hp = 60, attack = 50, defense = 70, specialAttack = 80, specialDefense = 80, speed = 150 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10232
    , name = "マルマイン(ヒスイ)"
    , englishName = "マルマイン(ヒスイ)"
    , pokemonType = ElectricGrass
    , stats = { hp = 60, attack = 50, defense = 70, specialAttack = 80, specialDefense = 80, speed = 150 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 851
    , name = "マルヤクデ"
    , englishName = "マルヤクデ"
    , pokemonType = FireBug
    , stats = { hp = 100, attack = 115, defense = 65, specialAttack = 90, specialDefense = 90, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 56
    , name = "マンキー"
    , englishName = "マンキー"
    , pokemonType = FightingType
    , stats = { hp = 40, attack = 80, defense = 35, specialAttack = 35, specialDefense = 45, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 226
    , name = "マンタイン"
    , englishName = "マンタイン"
    , pokemonType = WaterFlying
    , stats = { hp = 85, attack = 40, defense = 70, specialAttack = 80, specialDefense = 140, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 473
    , name = "マンムー"
    , englishName = "マンムー"
    , pokemonType = IceGround
    , stats = { hp = 110, attack = 130, defense = 80, specialAttack = 70, specialDefense = 60, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 932
    , name = "ミガルーサ"
    , englishName = "ミガルーサ"
    , pokemonType = WaterPsychic
    , stats = { hp = 90, attack = 102, defense = 73, specialAttack = 78, specialDefense = 65, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 442
    , name = "ミカルゲ"
    , englishName = "ミカルゲ"
    , pokemonType = GhostDark
    , stats = { hp = 50, attack = 92, defense = 108, specialAttack = 92, specialDefense = 108, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 501
    , name = "ミジュマル"
    , englishName = "ミジュマル"
    , pokemonType = WaterType
    , stats = { hp = 55, attack = 55, defense = 45, specialAttack = 63, specialDefense = 45, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 258
    , name = "ミズゴロウ"
    , englishName = "ミズゴロウ"
    , pokemonType = WaterType
    , stats = { hp = 50, attack = 70, defense = 50, specialAttack = 50, specialDefense = 50, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 415
    , name = "ミツハニー"
    , englishName = "ミツハニー"
    , pokemonType = FlyingBug
    , stats = { hp = 30, attack = 30, defense = 42, specialAttack = 30, specialDefense = 42, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 935
    , name = "ミニーブ"
    , englishName = "ミニーブ"
    , pokemonType = NormalGrass
    , stats = { hp = 41, attack = 35, defense = 45, specialAttack = 58, specialDefense = 51, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 147
    , name = "ミニリュウ"
    , englishName = "ミニリュウ"
    , pokemonType = DragonType
    , stats = { hp = 41, attack = 64, defense = 45, specialAttack = 50, specialDefense = 50, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 504
    , name = "ミネズミ"
    , englishName = "ミネズミ"
    , pokemonType = NormalType
    , stats = { hp = 45, attack = 55, defense = 39, specialAttack = 35, specialDefense = 39, speed = 42 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10005
    , name = "ミノマダム(鋼)"
    , englishName = "ミノマダム(鋼)"
    , pokemonType = BugSteel
    , stats = { hp = 60, attack = 69, defense = 95, specialAttack = 69, specialDefense = 95, speed = 36 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 413
    , name = "ミノマダム(草)"
    , englishName = "ミノマダム(草)"
    , pokemonType = GrassBug
    , stats = { hp = 60, attack = 59, defense = 85, specialAttack = 79, specialDefense = 105, speed = 36 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10004
    , name = "ミノマダム(地)"
    , englishName = "ミノマダム(地)"
    , pokemonType = GroundBug
    , stats = { hp = 60, attack = 79, defense = 105, specialAttack = 59, specialDefense = 85, speed = 36 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 412
    , name = "ミノムッチ"
    , englishName = "ミノムッチ"
    , pokemonType = BugType
    , stats = { hp = 40, attack = 29, defense = 45, specialAttack = 29, specialDefense = 45, speed = 36 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 856
    , name = "ミブリム"
    , englishName = "ミブリム"
    , pokemonType = PsychicType
    , stats = { hp = 42, attack = 30, defense = 45, specialAttack = 56, specialDefense = 53, speed = 39 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 944
    , name = "ミミズズ"
    , englishName = "ミミズズ"
    , pokemonType = SteelType
    , stats = { hp = 70, attack = 85, defense = 145, specialAttack = 60, specialDefense = 55, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 778
    , name = "ミミッキュ"
    , englishName = "ミミッキュ"
    , pokemonType = GhostFairy
    , stats = { hp = 55, attack = 90, defense = 80, specialAttack = 50, specialDefense = 105, speed = 96 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 428
    , name = "ミミロップ"
    , englishName = "ミミロップ"
    , pokemonType = NormalType
    , stats = { hp = 65, attack = 76, defense = 84, specialAttack = 54, specialDefense = 96, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10088
    , name = "ミミロップ(メガ)"
    , englishName = "ミミロップ(メガ)"
    , pokemonType = NormalFighting
    , stats = { hp = 65, attack = 136, defense = 94, specialAttack = 54, specialDefense = 96, speed = 135 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 427
    , name = "ミミロル"
    , englishName = "ミミロル"
    , pokemonType = NormalType
    , stats = { hp = 55, attack = 66, defense = 44, specialAttack = 44, specialDefense = 56, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 151
    , name = "ミュウ"
    , englishName = "ミュウ"
    , pokemonType = PsychicType
    , stats = { hp = 100, attack = 100, defense = 100, specialAttack = 100, specialDefense = 100, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 150
    , name = "ミュウツー"
    , englishName = "ミュウツー"
    , pokemonType = PsychicType
    , stats = { hp = 106, attack = 110, defense = 90, specialAttack = 154, specialDefense = 90, speed = 130 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10043
    , name = "ミュウツー(メガX)"
    , englishName = "ミュウツー(メガX)"
    , pokemonType = FightingPsychic
    , stats = { hp = 106, attack = 190, defense = 100, specialAttack = 154, specialDefense = 100, speed = 130 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10044
    , name = "ミュウツー(メガY)"
    , englishName = "ミュウツー(メガY)"
    , pokemonType = PsychicType
    , stats = { hp = 106, attack = 150, defense = 70, specialAttack = 194, specialDefense = 120, speed = 140 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 999
    , name = "ミライドン"
    , englishName = "ミライドン"
    , pokemonType = ElectricDragon
    , stats = { hp = 100, attack = 85, defense = 100, specialAttack = 135, specialDefense = 115, speed = 135 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 241
    , name = "ミルタンク"
    , englishName = "ミルタンク"
    , pokemonType = NormalType
    , stats = { hp = 95, attack = 80, defense = 105, specialAttack = 40, specialDefense = 70, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 505
    , name = "ミルホッグ"
    , englishName = "ミルホッグ"
    , pokemonType = NormalType
    , stats = { hp = 60, attack = 85, defense = 69, specialAttack = 60, specialDefense = 69, speed = 77 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 350
    , name = "ミロカロス"
    , englishName = "ミロカロス"
    , pokemonType = WaterType
    , stats = { hp = 95, attack = 60, defense = 79, specialAttack = 100, specialDefense = 125, speed = 81 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 200
    , name = "ムウマ"
    , englishName = "ムウマ"
    , pokemonType = GhostType
    , stats = { hp = 60, attack = 60, defense = 60, specialAttack = 85, specialDefense = 85, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 429
    , name = "ムウマージ"
    , englishName = "ムウマージ"
    , pokemonType = GhostType
    , stats = { hp = 60, attack = 60, defense = 60, specialAttack = 105, specialDefense = 105, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 508
    , name = "ムーランド"
    , englishName = "ムーランド"
    , pokemonType = NormalType
    , stats = { hp = 85, attack = 110, defense = 90, specialAttack = 45, specialDefense = 90, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 397
    , name = "ムクバード"
    , englishName = "ムクバード"
    , pokemonType = NormalFlying
    , stats = { hp = 55, attack = 75, defense = 50, specialAttack = 40, specialDefense = 40, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 398
    , name = "ムクホーク"
    , englishName = "ムクホーク"
    , pokemonType = NormalFlying
    , stats = { hp = 85, attack = 120, defense = 70, specialAttack = 50, specialDefense = 60, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 890
    , name = "ムゲンダイナ"
    , englishName = "ムゲンダイナ"
    , pokemonType = PoisonDragon
    , stats = { hp = 140, attack = 85, defense = 95, specialAttack = 145, specialDefense = 95, speed = 130 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10190
    , name = "ムゲンダイナ(ムゲン)"
    , englishName = "ムゲンダイナ(ムゲン)"
    , pokemonType = PoisonDragon
    , stats = { hp = 255, attack = 115, defense = 250, specialAttack = 125, specialDefense = 250, speed = 130 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 518
    , name = "ムシャーナ"
    , englishName = "ムシャーナ"
    , pokemonType = PsychicType
    , stats = { hp = 116, attack = 55, defense = 85, specialAttack = 107, specialDefense = 95, speed = 29 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 238
    , name = "ムチュール"
    , englishName = "ムチュール"
    , pokemonType = IcePsychic
    , stats = { hp = 45, attack = 30, defense = 15, specialAttack = 85, specialDefense = 65, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 396
    , name = "ムックル"
    , englishName = "ムックル"
    , pokemonType = NormalFlying
    , stats = { hp = 40, attack = 55, defense = 30, specialAttack = 30, specialDefense = 30, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 517
    , name = "ムンナ"
    , englishName = "ムンナ"
    , pokemonType = PsychicType
    , stats = { hp = 76, attack = 25, defense = 45, specialAttack = 67, specialDefense = 55, speed = 24 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 672
    , name = "メェークル"
    , englishName = "メェークル"
    , pokemonType = GrassType
    , stats = { hp = 66, attack = 65, defense = 48, specialAttack = 62, specialDefense = 57, speed = 52 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 154
    , name = "メガニウム"
    , englishName = "メガニウム"
    , pokemonType = GrassType
    , stats = { hp = 80, attack = 82, defense = 100, specialAttack = 83, specialDefense = 100, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 469
    , name = "メガヤンマ"
    , englishName = "メガヤンマ"
    , pokemonType = FlyingBug
    , stats = { hp = 86, attack = 76, defense = 86, specialAttack = 116, specialDefense = 56, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 551
    , name = "メグロコ"
    , englishName = "メグロコ"
    , pokemonType = GroundDark
    , stats = { hp = 50, attack = 72, defense = 35, specialAttack = 35, specialDefense = 35, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 376
    , name = "メタグロス"
    , englishName = "メタグロス"
    , pokemonType = PsychicSteel
    , stats = { hp = 80, attack = 135, defense = 130, specialAttack = 95, specialDefense = 90, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10076
    , name = "メタグロス(メガ)"
    , englishName = "メタグロス(メガ)"
    , pokemonType = PsychicSteel
    , stats = { hp = 80, attack = 145, defense = 150, specialAttack = 105, specialDefense = 110, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 132
    , name = "メタモン"
    , englishName = "メタモン"
    , pokemonType = NormalType
    , stats = { hp = 48, attack = 48, defense = 48, specialAttack = 48, specialDefense = 48, speed = 48 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 375
    , name = "メタング"
    , englishName = "メタング"
    , pokemonType = PsychicSteel
    , stats = { hp = 60, attack = 75, defense = 100, specialAttack = 55, specialDefense = 80, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 816
    , name = "メッソン"
    , englishName = "メッソン"
    , pokemonType = WaterType
    , stats = { hp = 50, attack = 40, defense = 40, specialAttack = 70, specialDefense = 40, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 774
    , name = "メテノ"
    , englishName = "メテノ"
    , pokemonType = FlyingRock
    , stats = { hp = 60, attack = 60, defense = 100, specialAttack = 60, specialDefense = 100, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10136
    , name = "メテノ(コア)"
    , englishName = "メテノ(コア)"
    , pokemonType = FlyingRock
    , stats = { hp = 60, attack = 100, defense = 60, specialAttack = 100, specialDefense = 60, speed = 120 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 72
    , name = "メノクラゲ"
    , englishName = "メノクラゲ"
    , pokemonType = WaterPoison
    , stats = { hp = 40, attack = 40, defense = 35, specialAttack = 50, specialDefense = 100, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 586
    , name = "メブキジカ"
    , englishName = "メブキジカ"
    , pokemonType = NormalGrass
    , stats = { hp = 80, attack = 100, defense = 70, specialAttack = 60, specialDefense = 70, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 636
    , name = "メラルバ"
    , englishName = "メラルバ"
    , pokemonType = FireBug
    , stats = { hp = 55, attack = 85, defense = 55, specialAttack = 50, specialDefense = 55, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 179
    , name = "メリープ"
    , englishName = "メリープ"
    , pokemonType = ElectricType
    , stats = { hp = 55, attack = 40, defense = 40, specialAttack = 65, specialDefense = 45, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 808
    , name = "メルタン"
    , englishName = "メルタン"
    , pokemonType = SteelType
    , stats = { hp = 46, attack = 65, defense = 65, specialAttack = 55, specialDefense = 35, speed = 34 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 809
    , name = "メルメタル"
    , englishName = "メルメタル"
    , pokemonType = SteelType
    , stats = { hp = 135, attack = 143, defense = 143, specialAttack = 80, specialDefense = 65, speed = 34 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 703
    , name = "メレシー"
    , englishName = "メレシー"
    , pokemonType = RockFairy
    , stats = { hp = 50, attack = 50, defense = 150, specialAttack = 50, specialDefense = 150, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 648
    , name = "メロエッタ(超)"
    , englishName = "メロエッタ(超)"
    , pokemonType = NormalPsychic
    , stats = { hp = 100, attack = 77, defense = 77, specialAttack = 128, specialDefense = 128, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10018
    , name = "メロエッタ(闘)"
    , englishName = "メロエッタ(闘)"
    , pokemonType = NormalFighting
    , stats = { hp = 100, attack = 128, defense = 90, specialAttack = 77, specialDefense = 77, speed = 128 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 391
    , name = "モウカザル"
    , englishName = "モウカザル"
    , pokemonType = FireFighting
    , stats = { hp = 64, attack = 78, defense = 52, specialAttack = 78, specialDefense = 52, speed = 81 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 529
    , name = "モグリュー"
    , englishName = "モグリュー"
    , pokemonType = GroundType
    , stats = { hp = 60, attack = 85, defense = 40, specialAttack = 30, specialDefense = 45, speed = 68 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 722
    , name = "モクロー"
    , englishName = "モクロー"
    , pokemonType = GrassFlying
    , stats = { hp = 68, attack = 55, defense = 55, specialAttack = 50, specialDefense = 50, speed = 42 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 180
    , name = "モココ"
    , englishName = "モココ"
    , pokemonType = ElectricType
    , stats = { hp = 70, attack = 55, defense = 55, specialAttack = 80, specialDefense = 60, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 465
    , name = "モジャンボ"
    , englishName = "モジャンボ"
    , pokemonType = GrassType
    , stats = { hp = 100, attack = 100, defense = 125, specialAttack = 110, specialDefense = 50, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 873
    , name = "モスノウ"
    , englishName = "モスノウ"
    , pokemonType = IceBug
    , stats = { hp = 70, attack = 65, defense = 60, specialAttack = 125, specialDefense = 90, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 953
    , name = "モトトカゲ"
    , englishName = "モトトカゲ"
    , pokemonType = NormalDragon
    , stats = { hp = 70, attack = 95, defense = 65, specialAttack = 85, specialDefense = 65, speed = 121 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 633
    , name = "モノズ"
    , englishName = "モノズ"
    , pokemonType = DragonDark
    , stats = { hp = 52, attack = 65, defense = 50, specialAttack = 45, specialDefense = 50, speed = 38 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20037
    , name = "モモワロウ"
    , englishName = "モモワロウ"
    , pokemonType = PoisonGhost
    , stats = { hp = 88, attack = 88, defense = 160, specialAttack = 88, specialDefense = 88, speed = 88 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 49
    , name = "モルフォン"
    , englishName = "モルフォン"
    , pokemonType = PoisonBug
    , stats = { hp = 70, attack = 65, defense = 60, specialAttack = 90, specialDefense = 75, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 877
    , name = "モルペコ"
    , englishName = "モルペコ"
    , pokemonType = ElectricDark
    , stats = { hp = 58, attack = 95, defense = 58, specialAttack = 70, specialDefense = 58, speed = 97 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 591
    , name = "モロバレル"
    , englishName = "モロバレル"
    , pokemonType = GrassPoison
    , stats = { hp = 114, attack = 85, defense = 70, specialAttack = 85, specialDefense = 80, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 114
    , name = "モンジャラ"
    , englishName = "モンジャラ"
    , pokemonType = GrassType
    , stats = { hp = 65, attack = 55, defense = 115, specialAttack = 100, specialDefense = 40, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 546
    , name = "モンメン"
    , englishName = "モンメン"
    , pokemonType = GrassFairy
    , stats = { hp = 40, attack = 27, defense = 60, specialAttack = 37, specialDefense = 50, speed = 66 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 850
    , name = "ヤクデ"
    , englishName = "ヤクデ"
    , pokemonType = FireBug
    , stats = { hp = 50, attack = 65, defense = 45, specialAttack = 50, specialDefense = 50, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 343
    , name = "ヤジロン"
    , englishName = "ヤジロン"
    , pokemonType = GroundPsychic
    , stats = { hp = 40, attack = 40, defense = 55, specialAttack = 40, specialDefense = 70, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 757
    , name = "ヤトウモリ"
    , englishName = "ヤトウモリ"
    , pokemonType = FirePoison
    , stats = { hp = 48, attack = 44, defense = 40, specialAttack = 71, specialDefense = 40, speed = 77 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 199
    , name = "ヤドキング"
    , englishName = "ヤドキング"
    , pokemonType = WaterPsychic
    , stats = { hp = 95, attack = 75, defense = 80, specialAttack = 100, specialDefense = 110, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10172
    , name = "ヤドキング(ガラル)"
    , englishName = "ヤドキング(ガラル)"
    , pokemonType = PoisonPsychic
    , stats = { hp = 95, attack = 65, defense = 80, specialAttack = 110, specialDefense = 110, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 80
    , name = "ヤドラン"
    , englishName = "ヤドラン"
    , pokemonType = WaterPsychic
    , stats = { hp = 95, attack = 75, defense = 110, specialAttack = 100, specialDefense = 80, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10165
    , name = "ヤドラン(ガラル)"
    , englishName = "ヤドラン(ガラル)"
    , pokemonType = PoisonPsychic
    , stats = { hp = 95, attack = 100, defense = 95, specialAttack = 100, specialDefense = 70, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10071
    , name = "ヤドラン(メガ)"
    , englishName = "ヤドラン(メガ)"
    , pokemonType = WaterPsychic
    , stats = { hp = 95, attack = 75, defense = 180, specialAttack = 130, specialDefense = 80, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 79
    , name = "ヤドン"
    , englishName = "ヤドン"
    , pokemonType = WaterPsychic
    , stats = { hp = 90, attack = 65, defense = 65, specialAttack = 40, specialDefense = 40, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10164
    , name = "ヤドン(ガラル)"
    , englishName = "ヤドン(ガラル)"
    , pokemonType = PsychicType
    , stats = { hp = 90, attack = 65, defense = 65, specialAttack = 40, specialDefense = 40, speed = 15 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 512
    , name = "ヤナッキー"
    , englishName = "ヤナッキー"
    , pokemonType = GrassType
    , stats = { hp = 75, attack = 98, defense = 63, specialAttack = 98, specialDefense = 63, speed = 101 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 511
    , name = "ヤナップ"
    , englishName = "ヤナップ"
    , pokemonType = GrassType
    , stats = { hp = 50, attack = 53, defense = 48, specialAttack = 53, specialDefense = 48, speed = 64 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20019
    , name = "ヤバソチャ"
    , englishName = "ヤバソチャ"
    , pokemonType = GrassGhost
    , stats = { hp = 71, attack = 60, defense = 106, specialAttack = 121, specialDefense = 80, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 854
    , name = "ヤバチャ"
    , englishName = "ヤバチャ"
    , pokemonType = GhostType
    , stats = { hp = 40, attack = 45, defense = 45, specialAttack = 74, specialDefense = 54, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 568
    , name = "ヤブクロン"
    , englishName = "ヤブクロン"
    , pokemonType = PoisonType
    , stats = { hp = 50, attack = 50, defense = 62, specialAttack = 40, specialDefense = 62, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 198
    , name = "ヤミカラス"
    , englishName = "ヤミカラス"
    , pokemonType = FlyingDark
    , stats = { hp = 60, attack = 85, defense = 42, specialAttack = 85, specialDefense = 42, speed = 91 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 302
    , name = "ヤミラミ"
    , englishName = "ヤミラミ"
    , pokemonType = GhostDark
    , stats = { hp = 50, attack = 75, defense = 75, specialAttack = 65, specialDefense = 65, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10066
    , name = "ヤミラミ(メガ)"
    , englishName = "ヤミラミ(メガ)"
    , pokemonType = GhostDark
    , stats = { hp = 50, attack = 85, defense = 125, specialAttack = 85, specialDefense = 115, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 661
    , name = "ヤヤコマ"
    , englishName = "ヤヤコマ"
    , pokemonType = NormalFlying
    , stats = { hp = 45, attack = 50, defense = 43, specialAttack = 40, specialDefense = 38, speed = 62 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 288
    , name = "ヤルキモノ"
    , englishName = "ヤルキモノ"
    , pokemonType = NormalType
    , stats = { hp = 80, attack = 80, defense = 80, specialAttack = 55, specialDefense = 55, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 765
    , name = "ヤレユータン"
    , englishName = "ヤレユータン"
    , pokemonType = NormalPsychic
    , stats = { hp = 90, attack = 60, defense = 80, specialAttack = 90, specialDefense = 110, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 734
    , name = "ヤングース"
    , englishName = "ヤングース"
    , pokemonType = NormalType
    , stats = { hp = 48, attack = 70, defense = 30, specialAttack = 30, specialDefense = 30, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 674
    , name = "ヤンチャム"
    , englishName = "ヤンチャム"
    , pokemonType = FightingType
    , stats = { hp = 67, attack = 82, defense = 62, specialAttack = 46, specialDefense = 48, speed = 43 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 193
    , name = "ヤンヤンマ"
    , englishName = "ヤンヤンマ"
    , pokemonType = FlyingBug
    , stats = { hp = 65, attack = 65, defense = 45, specialAttack = 75, specialDefense = 45, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 459
    , name = "ユキカブリ"
    , englishName = "ユキカブリ"
    , pokemonType = GrassIce
    , stats = { hp = 60, attack = 62, defense = 50, specialAttack = 62, specialDefense = 60, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 460
    , name = "ユキノオー"
    , englishName = "ユキノオー"
    , pokemonType = GrassIce
    , stats = { hp = 90, attack = 92, defense = 75, specialAttack = 92, specialDefense = 85, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10060
    , name = "ユキノオー(メガ)"
    , englishName = "ユキノオー(メガ)"
    , pokemonType = GrassIce
    , stats = { hp = 90, attack = 132, defense = 105, specialAttack = 132, specialDefense = 105, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 872
    , name = "ユキハミ"
    , englishName = "ユキハミ"
    , pokemonType = IceBug
    , stats = { hp = 30, attack = 25, defense = 35, specialAttack = 45, specialDefense = 30, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 478
    , name = "ユキメノコ"
    , englishName = "ユキメノコ"
    , pokemonType = IceGhost
    , stats = { hp = 70, attack = 80, defense = 70, specialAttack = 80, specialDefense = 70, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 361
    , name = "ユキワラシ"
    , englishName = "ユキワラシ"
    , pokemonType = IceType
    , stats = { hp = 50, attack = 50, defense = 50, specialAttack = 50, specialDefense = 50, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 480
    , name = "ユクシー"
    , englishName = "ユクシー"
    , pokemonType = PsychicType
    , stats = { hp = 75, attack = 75, defense = 130, specialAttack = 75, specialDefense = 130, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 577
    , name = "ユニラン"
    , englishName = "ユニラン"
    , pokemonType = PsychicType
    , stats = { hp = 45, attack = 30, defense = 40, specialAttack = 105, specialDefense = 50, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 346
    , name = "ユレイドル"
    , englishName = "ユレイドル"
    , pokemonType = GrassRock
    , stats = { hp = 86, attack = 81, defense = 97, specialAttack = 81, specialDefense = 107, speed = 43 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 64
    , name = "ユンゲラー"
    , englishName = "ユンゲラー"
    , pokemonType = PsychicType
    , stats = { hp = 40, attack = 35, defense = 30, specialAttack = 120, specialDefense = 70, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 246
    , name = "ヨーギラス"
    , englishName = "ヨーギラス"
    , pokemonType = GroundRock
    , stats = { hp = 50, attack = 64, defense = 50, specialAttack = 45, specialDefense = 50, speed = 41 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 506
    , name = "ヨーテリー"
    , englishName = "ヨーテリー"
    , pokemonType = NormalType
    , stats = { hp = 45, attack = 60, defense = 45, specialAttack = 25, specialDefense = 45, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 820
    , name = "ヨクバリス"
    , englishName = "ヨクバリス"
    , pokemonType = NormalType
    , stats = { hp = 120, attack = 95, defense = 95, specialAttack = 55, specialDefense = 75, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 477
    , name = "ヨノワール"
    , englishName = "ヨノワール"
    , pokemonType = GhostType
    , stats = { hp = 45, attack = 100, defense = 135, specialAttack = 65, specialDefense = 135, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 355
    , name = "ヨマワル"
    , englishName = "ヨマワル"
    , pokemonType = GhostType
    , stats = { hp = 20, attack = 40, defense = 90, specialAttack = 30, specialDefense = 90, speed = 25 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 164
    , name = "ヨルノズク"
    , englishName = "ヨルノズク"
    , pokemonType = NormalFlying
    , stats = { hp = 100, attack = 50, defense = 50, specialAttack = 86, specialDefense = 96, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10127
    , name = "ヨワシ(群れ)"
    , englishName = "ヨワシ(群れ)"
    , pokemonType = WaterType
    , stats = { hp = 45, attack = 140, defense = 130, specialAttack = 140, specialDefense = 135, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 746
    , name = "ヨワシ(単独)"
    , englishName = "ヨワシ(単独)"
    , pokemonType = WaterType
    , stats = { hp = 45, attack = 20, defense = 20, specialAttack = 25, specialDefense = 25, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 243
    , name = "ライコウ"
    , englishName = "ライコウ"
    , pokemonType = ElectricType
    , stats = { hp = 90, attack = 85, defense = 75, specialAttack = 115, specialDefense = 100, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 26
    , name = "ライチュウ"
    , englishName = "ライチュウ"
    , pokemonType = ElectricType
    , stats = { hp = 60, attack = 90, defense = 55, specialAttack = 90, specialDefense = 80, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10100
    , name = "ライチュウ(アローラ)"
    , englishName = "ライチュウ(アローラ)"
    , pokemonType = ElectricPsychic
    , stats = { hp = 60, attack = 85, defense = 50, specialAttack = 95, specialDefense = 85, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 310
    , name = "ライボルト"
    , englishName = "ライボルト"
    , pokemonType = ElectricType
    , stats = { hp = 70, attack = 75, defense = 60, specialAttack = 105, specialDefense = 60, speed = 105 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10055
    , name = "ライボルト(メガ)"
    , englishName = "ライボルト(メガ)"
    , pokemonType = ElectricType
    , stats = { hp = 70, attack = 75, defense = 80, specialAttack = 135, specialDefense = 80, speed = 135 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 911
    , name = "ラウドボーン"
    , englishName = "ラウドボーン"
    , pokemonType = FireGhost
    , stats = { hp = 104, attack = 75, defense = 100, specialAttack = 110, specialDefense = 75, speed = 66 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 260
    , name = "ラグラージ"
    , englishName = "ラグラージ"
    , pokemonType = WaterGround
    , stats = { hp = 100, attack = 110, defense = 90, specialAttack = 85, specialDefense = 90, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10064
    , name = "ラグラージ(メガ)"
    , englishName = "ラグラージ(メガ)"
    , pokemonType = WaterGround
    , stats = { hp = 100, attack = 150, defense = 110, specialAttack = 95, specialDefense = 110, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 309
    , name = "ラクライ"
    , englishName = "ラクライ"
    , pokemonType = ElectricType
    , stats = { hp = 40, attack = 45, defense = 40, specialAttack = 65, specialDefense = 40, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 113
    , name = "ラッキー"
    , englishName = "ラッキー"
    , pokemonType = NormalType
    , stats = { hp = 250, attack = 5, defense = 5, specialAttack = 35, specialDefense = 105, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 20
    , name = "ラッタ"
    , englishName = "ラッタ"
    , pokemonType = NormalType
    , stats = { hp = 55, attack = 81, defense = 60, specialAttack = 50, specialDefense = 70, speed = 97 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10092
    , name = "ラッタ(アローラ)"
    , englishName = "ラッタ(アローラ)"
    , pokemonType = NormalDark
    , stats = { hp = 75, attack = 71, defense = 70, specialAttack = 40, specialDefense = 80, speed = 77 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 380
    , name = "ラティアス"
    , englishName = "ラティアス"
    , pokemonType = PsychicDragon
    , stats = { hp = 80, attack = 80, defense = 90, specialAttack = 110, specialDefense = 130, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10062
    , name = "ラティアス(メガ)"
    , englishName = "ラティアス(メガ)"
    , pokemonType = PsychicDragon
    , stats = { hp = 80, attack = 100, defense = 120, specialAttack = 140, specialDefense = 150, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 381
    , name = "ラティオス"
    , englishName = "ラティオス"
    , pokemonType = PsychicDragon
    , stats = { hp = 80, attack = 90, defense = 80, specialAttack = 130, specialDefense = 110, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10063
    , name = "ラティオス(メガ)"
    , englishName = "ラティオス(メガ)"
    , pokemonType = PsychicDragon
    , stats = { hp = 80, attack = 130, defense = 100, specialAttack = 160, specialDefense = 120, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 814
    , name = "ラビフット"
    , englishName = "ラビフット"
    , pokemonType = FireType
    , stats = { hp = 65, attack = 86, defense = 60, specialAttack = 55, specialDefense = 60, speed = 94 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 370
    , name = "ラブカス"
    , englishName = "ラブカス"
    , pokemonType = WaterType
    , stats = { hp = 43, attack = 30, defense = 55, specialAttack = 40, specialDefense = 65, speed = 97 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 905
    , name = "ラブトロス(化身)"
    , englishName = "ラブトロス(化身)"
    , pokemonType = FlyingFairy
    , stats = { hp = 74, attack = 115, defense = 70, specialAttack = 135, specialDefense = 80, speed = 106 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10249
    , name = "ラブトロス(霊獣)"
    , englishName = "ラブトロス(霊獣)"
    , pokemonType = FlyingFairy
    , stats = { hp = 74, attack = 115, defense = 110, specialAttack = 135, specialDefense = 100, speed = 46 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 131
    , name = "ラプラス"
    , englishName = "ラプラス"
    , pokemonType = WaterIce
    , stats = { hp = 130, attack = 85, defense = 80, specialAttack = 85, specialDefense = 95, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 45
    , name = "ラフレシア"
    , englishName = "ラフレシア"
    , pokemonType = GrassPoison
    , stats = { hp = 75, attack = 80, defense = 85, specialAttack = 110, specialDefense = 90, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 409
    , name = "ラムパルド"
    , englishName = "ラムパルド"
    , pokemonType = RockType
    , stats = { hp = 97, attack = 165, defense = 60, specialAttack = 65, specialDefense = 50, speed = 58 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 754
    , name = "ラランテス"
    , englishName = "ラランテス"
    , pokemonType = GrassType
    , stats = { hp = 70, attack = 105, defense = 90, specialAttack = 80, specialDefense = 90, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 280
    , name = "ラルトス"
    , englishName = "ラルトス"
    , pokemonType = PsychicFairy
    , stats = { hp = 28, attack = 25, defense = 25, specialAttack = 45, specialDefense = 35, speed = 40 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 579
    , name = "ランクルス"
    , englishName = "ランクルス"
    , pokemonType = PsychicType
    , stats = { hp = 110, attack = 65, defense = 75, specialAttack = 125, specialDefense = 85, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 171
    , name = "ランターン"
    , englishName = "ランターン"
    , pokemonType = WaterElectric
    , stats = { hp = 125, attack = 58, defense = 58, specialAttack = 76, specialDefense = 76, speed = 67 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 645
    , name = "ランドロス(化身)"
    , englishName = "ランドロス(化身)"
    , pokemonType = GroundFlying
    , stats = { hp = 89, attack = 125, defense = 90, specialAttack = 115, specialDefense = 80, speed = 101 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10021
    , name = "ランドロス(霊獣)"
    , englishName = "ランドロス(霊獣)"
    , pokemonType = GroundFlying
    , stats = { hp = 89, attack = 145, defense = 90, specialAttack = 105, specialDefense = 80, speed = 91 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 608
    , name = "ランプラー"
    , englishName = "ランプラー"
    , pokemonType = FireGhost
    , stats = { hp = 60, attack = 40, defense = 60, specialAttack = 95, specialDefense = 60, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 433
    , name = "リーシャン"
    , englishName = "リーシャン"
    , pokemonType = PsychicType
    , stats = { hp = 45, attack = 30, defense = 50, specialAttack = 65, specialDefense = 50, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 470
    , name = "リーフィア"
    , englishName = "リーフィア"
    , pokemonType = GrassType
    , stats = { hp = 65, attack = 110, defense = 130, specialAttack = 60, specialDefense = 65, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 447
    , name = "リオル"
    , englishName = "リオル"
    , pokemonType = FightingType
    , stats = { hp = 40, attack = 70, defense = 40, specialAttack = 35, specialDefense = 40, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 928
    , name = "リキキリン"
    , englishName = "リキキリン"
    , pokemonType = NormalPsychic
    , stats = { hp = 120, attack = 90, defense = 70, specialAttack = 110, specialDefense = 70, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 1007
    , name = "リククラゲ"
    , englishName = "リククラゲ"
    , pokemonType = GrassGround
    , stats = { hp = 80, attack = 70, defense = 65, specialAttack = 80, specialDefense = 120, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 605
    , name = "リグレー"
    , englishName = "リグレー"
    , pokemonType = PsychicType
    , stats = { hp = 55, attack = 55, defense = 55, specialAttack = 85, specialDefense = 55, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 5
    , name = "リザード"
    , englishName = "リザード"
    , pokemonType = FireType
    , stats = { hp = 58, attack = 64, defense = 58, specialAttack = 80, specialDefense = 65, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 6
    , name = "リザードン"
    , englishName = "リザードン"
    , pokemonType = FireFlying
    , stats = { hp = 78, attack = 84, defense = 78, specialAttack = 109, specialDefense = 85, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10034
    , name = "リザードン(メガX)"
    , englishName = "リザードン(メガX)"
    , pokemonType = FireDragon
    , stats = { hp = 78, attack = 130, defense = 111, specialAttack = 130, specialDefense = 85, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10035
    , name = "リザードン(メガY)"
    , englishName = "リザードン(メガY)"
    , pokemonType = FireFlying
    , stats = { hp = 78, attack = 104, defense = 78, specialAttack = 159, specialDefense = 115, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 345
    , name = "リリーラ"
    , englishName = "リリーラ"
    , pokemonType = GrassRock
    , stats = { hp = 66, attack = 41, defense = 77, specialAttack = 61, specialDefense = 87, speed = 23 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 217
    , name = "リングマ"
    , englishName = "リングマ"
    , pokemonType = NormalType
    , stats = { hp = 90, attack = 130, defense = 75, specialAttack = 75, specialDefense = 75, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 124
    , name = "ルージュラ"
    , englishName = "ルージュラ"
    , pokemonType = IcePsychic
    , stats = { hp = 65, attack = 50, defense = 35, specialAttack = 115, specialDefense = 95, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 448
    , name = "ルカリオ"
    , englishName = "ルカリオ"
    , pokemonType = FightingSteel
    , stats = { hp = 70, attack = 110, defense = 70, specialAttack = 115, specialDefense = 70, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10059
    , name = "ルカリオ(メガ)"
    , englishName = "ルカリオ(メガ)"
    , pokemonType = FightingSteel
    , stats = { hp = 70, attack = 145, defense = 88, specialAttack = 140, specialDefense = 70, speed = 112 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10152
    , name = "ルガルガン(黄昏)"
    , englishName = "ルガルガン(黄昏)"
    , pokemonType = RockType
    , stats = { hp = 75, attack = 117, defense = 65, specialAttack = 55, specialDefense = 65, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 745
    , name = "ルガルガン(真昼)"
    , englishName = "ルガルガン(真昼)"
    , pokemonType = RockType
    , stats = { hp = 75, attack = 115, defense = 65, specialAttack = 55, specialDefense = 65, speed = 112 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10126
    , name = "ルガルガン(真夜中)"
    , englishName = "ルガルガン(真夜中)"
    , pokemonType = RockType
    , stats = { hp = 85, attack = 115, defense = 75, specialAttack = 55, specialDefense = 75, speed = 82 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 249
    , name = "ルギア"
    , englishName = "ルギア"
    , pokemonType = FlyingPsychic
    , stats = { hp = 106, attack = 90, defense = 130, specialAttack = 90, specialDefense = 154, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 404
    , name = "ルクシオ"
    , englishName = "ルクシオ"
    , pokemonType = ElectricType
    , stats = { hp = 60, attack = 85, defense = 49, specialAttack = 60, specialDefense = 49, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 701
    , name = "ルチャブル"
    , englishName = "ルチャブル"
    , pokemonType = FightingFlying
    , stats = { hp = 78, attack = 92, defense = 75, specialAttack = 74, specialDefense = 63, speed = 118 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 792
    , name = "ルナアーラ"
    , englishName = "ルナアーラ"
    , pokemonType = PsychicGhost
    , stats = { hp = 137, attack = 113, defense = 89, specialAttack = 137, specialDefense = 107, speed = 97 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 337
    , name = "ルナトーン"
    , englishName = "ルナトーン"
    , pokemonType = PsychicRock
    , stats = { hp = 90, attack = 55, defense = 65, specialAttack = 95, specialDefense = 85, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 298
    , name = "ルリリ"
    , englishName = "ルリリ"
    , pokemonType = NormalFairy
    , stats = { hp = 50, attack = 20, defense = 40, specialAttack = 20, specialDefense = 40, speed = 20 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 272
    , name = "ルンパッパ"
    , englishName = "ルンパッパ"
    , pokemonType = WaterGrass
    , stats = { hp = 80, attack = 70, defense = 70, specialAttack = 90, specialDefense = 100, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 82
    , name = "レアコイル"
    , englishName = "レアコイル"
    , pokemonType = ElectricSteel
    , stats = { hp = 50, attack = 60, defense = 95, specialAttack = 120, specialDefense = 70, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 897
    , name = "レイスポス"
    , englishName = "レイスポス"
    , pokemonType = GhostType
    , stats = { hp = 100, attack = 65, defense = 60, specialAttack = 145, specialDefense = 80, speed = 130 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 378
    , name = "レジアイス"
    , englishName = "レジアイス"
    , pokemonType = IceType
    , stats = { hp = 80, attack = 50, defense = 100, specialAttack = 100, specialDefense = 200, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 894
    , name = "レジエレキ"
    , englishName = "レジエレキ"
    , pokemonType = ElectricType
    , stats = { hp = 80, attack = 100, defense = 50, specialAttack = 100, specialDefense = 50, speed = 200 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 486
    , name = "レジギガス"
    , englishName = "レジギガス"
    , pokemonType = NormalType
    , stats = { hp = 110, attack = 160, defense = 110, specialAttack = 80, specialDefense = 110, speed = 100 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 379
    , name = "レジスチル"
    , englishName = "レジスチル"
    , pokemonType = SteelType
    , stats = { hp = 80, attack = 75, defense = 150, specialAttack = 75, specialDefense = 150, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 895
    , name = "レジドラゴ"
    , englishName = "レジドラゴ"
    , pokemonType = DragonType
    , stats = { hp = 200, attack = 100, defense = 50, specialAttack = 100, specialDefense = 50, speed = 80 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 643
    , name = "レシラム"
    , englishName = "レシラム"
    , pokemonType = FireDragon
    , stats = { hp = 100, attack = 120, defense = 100, specialAttack = 150, specialDefense = 120, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 377
    , name = "レジロック"
    , englishName = "レジロック"
    , pokemonType = RockType
    , stats = { hp = 80, attack = 100, defense = 200, specialAttack = 50, specialDefense = 100, speed = 50 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 384
    , name = "レックウザ"
    , englishName = "レックウザ"
    , pokemonType = FlyingDragon
    , stats = { hp = 105, attack = 150, defense = 90, specialAttack = 150, specialDefense = 90, speed = 95 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10079
    , name = "レックウザ(メガ)"
    , englishName = "レックウザ(メガ)"
    , pokemonType = FlyingDragon
    , stats = { hp = 105, attack = 180, defense = 100, specialAttack = 180, specialDefense = 100, speed = 115 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 166
    , name = "レディアン"
    , englishName = "レディアン"
    , pokemonType = FlyingBug
    , stats = { hp = 55, attack = 35, defense = 50, specialAttack = 55, specialDefense = 110, speed = 85 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 165
    , name = "レディバ"
    , englishName = "レディバ"
    , pokemonType = FlyingBug
    , stats = { hp = 40, attack = 20, defense = 30, specialAttack = 40, specialDefense = 80, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 825
    , name = "レドームシ"
    , englishName = "レドームシ"
    , pokemonType = PsychicBug
    , stats = { hp = 50, attack = 35, defense = 80, specialAttack = 50, specialDefense = 90, speed = 30 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 510
    , name = "レパルダス"
    , englishName = "レパルダス"
    , pokemonType = DarkType
    , stats = { hp = 64, attack = 88, defense = 50, specialAttack = 88, specialDefense = 50, speed = 106 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 405
    , name = "レントラー"
    , englishName = "レントラー"
    , pokemonType = ElectricType
    , stats = { hp = 80, attack = 120, defense = 79, specialAttack = 95, specialDefense = 79, speed = 70 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 534
    , name = "ローブシン"
    , englishName = "ローブシン"
    , pokemonType = FightingType
    , stats = { hp = 105, attack = 140, defense = 95, specialAttack = 55, specialDefense = 65, speed = 45 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 37
    , name = "ロコン"
    , englishName = "ロコン"
    , pokemonType = FireType
    , stats = { hp = 38, attack = 41, defense = 40, specialAttack = 50, specialDefense = 65, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10103
    , name = "ロコン(アローラ)"
    , englishName = "ロコン(アローラ)"
    , pokemonType = IceType
    , stats = { hp = 38, attack = 41, defense = 40, specialAttack = 50, specialDefense = 65, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 407
    , name = "ロズレイド"
    , englishName = "ロズレイド"
    , pokemonType = GrassPoison
    , stats = { hp = 60, attack = 70, defense = 65, specialAttack = 125, specialDefense = 105, speed = 90 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 315
    , name = "ロゼリア"
    , englishName = "ロゼリア"
    , pokemonType = GrassPoison
    , stats = { hp = 50, attack = 60, defense = 45, specialAttack = 100, specialDefense = 80, speed = 65 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 479
    , name = "ロトム"
    , englishName = "ロトム"
    , pokemonType = ElectricGhost
    , stats = { hp = 50, attack = 50, defense = 77, specialAttack = 95, specialDefense = 77, speed = 91 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10008
    , name = "ロトム(炎)"
    , englishName = "ロトム(炎)"
    , pokemonType = FireElectric
    , stats = { hp = 50, attack = 65, defense = 107, specialAttack = 105, specialDefense = 107, speed = 86 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10009
    , name = "ロトム(水)"
    , englishName = "ロトム(水)"
    , pokemonType = WaterElectric
    , stats = { hp = 50, attack = 65, defense = 107, specialAttack = 105, specialDefense = 107, speed = 86 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10012
    , name = "ロトム(草)"
    , englishName = "ロトム(草)"
    , pokemonType = ElectricGrass
    , stats = { hp = 50, attack = 65, defense = 107, specialAttack = 105, specialDefense = 107, speed = 86 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10011
    , name = "ロトム(飛)"
    , englishName = "ロトム(飛)"
    , pokemonType = ElectricFlying
    , stats = { hp = 50, attack = 65, defense = 107, specialAttack = 105, specialDefense = 107, speed = 86 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 10010
    , name = "ロトム(氷)"
    , englishName = "ロトム(氷)"
    , pokemonType = ElectricIce
    , stats = { hp = 50, attack = 65, defense = 107, specialAttack = 105, specialDefense = 107, speed = 86 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 256
    , name = "ワカシャモ"
    , englishName = "ワカシャモ"
    , pokemonType = FireFighting
    , stats = { hp = 60, attack = 85, defense = 60, specialAttack = 85, specialDefense = 60, speed = 55 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 627
    , name = "ワシボン"
    , englishName = "ワシボン"
    , pokemonType = NormalFlying
    , stats = { hp = 70, attack = 83, defense = 50, specialAttack = 37, specialDefense = 50, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 830
    , name = "ワタシラガ"
    , englishName = "ワタシラガ"
    , pokemonType = GrassType
    , stats = { hp = 60, attack = 50, defense = 90, specialAttack = 80, specialDefense = 120, speed = 60 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 189
    , name = "ワタッコ"
    , englishName = "ワタッコ"
    , pokemonType = GrassFlying
    , stats = { hp = 75, attack = 55, defense = 70, specialAttack = 55, specialDefense = 95, speed = 110 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 945
    , name = "ワッカネズミ"
    , englishName = "ワッカネズミ"
    , pokemonType = NormalType
    , stats = { hp = 50, attack = 50, defense = 45, specialAttack = 40, specialDefense = 45, speed = 75 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 919
    , name = "ワナイダー"
    , englishName = "ワナイダー"
    , pokemonType = BugType
    , stats = { hp = 60, attack = 79, defense = 92, specialAttack = 52, specialDefense = 86, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 158
    , name = "ワニノコ"
    , englishName = "ワニノコ"
    , pokemonType = WaterType
    , stats = { hp = 50, attack = 65, defense = 64, specialAttack = 44, specialDefense = 48, speed = 43 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 553
    , name = "ワルビアル"
    , englishName = "ワルビアル"
    , pokemonType = GroundDark
    , stats = { hp = 95, attack = 117, defense = 80, specialAttack = 65, specialDefense = 70, speed = 92 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 552
    , name = "ワルビル"
    , englishName = "ワルビル"
    , pokemonType = GroundDark
    , stats = { hp = 60, attack = 82, defense = 45, specialAttack = 45, specialDefense = 45, speed = 74 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 835
    , name = "ワンパチ"
    , englishName = "ワンパチ"
    , pokemonType = ElectricType
    , stats = { hp = 59, attack = 45, defense = 50, specialAttack = 40, specialDefense = 50, speed = 26 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    , { id = 66
    , name = "ワンリキー"
    , englishName = "ワンリキー"
    , pokemonType = FightingType
    , stats = { hp = 70, attack = 80, defense = 50, specialAttack = 35, specialDefense = 35, speed = 35 }
    , preEvolutionId = Nothing
    , evolutionMethods = []
    }
    ]


-- Helper function for filtering by ID
hasSameId : Int -> Pokemon -> Bool
hasSameId targetId pokemon =
    pokemon.id == targetId


findPokemonById : Int -> Maybe Pokemon
findPokemonById id =
    List.head (List.filter (hasSameId id) allPokemon)


-- Helper function for filtering by name
hasSameName : String -> Pokemon -> Bool
hasSameName targetName pokemon =
    pokemon.name == targetName


findPokemonByName : String -> Maybe Pokemon
findPokemonByName name =
    List.head (List.filter (hasSameName name) allPokemon)
