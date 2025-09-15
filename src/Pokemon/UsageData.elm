module Pokemon.UsageData exposing
    ( UsageRanking
    , season34Rankings
    , findRankByPokemonId
    , findRankByPokemonName
    , selectTop10
    , selectTopN
    , selectTop50Pokemon
    , selectTop150Pokemon
    )

import Pokemon.Data exposing (findPokemonById, findPokemonByName)
import Pokemon.Types exposing (Pokemon)


type alias UsageRanking =
    { rank : Int
    , pokemonId : Int
    , name : String
    }


season34Rankings : List UsageRanking
season34Rankings =
    [ { rank = 1, pokemonId = 1003, name = "ディンルー" }
    , { rank = 2, pokemonId = 1002, name = "パオジアン" }
    , { rank = 3, pokemonId = 10194, name = "バドレックス(黒馬)" }
    , { rank = 4, pokemonId = 977, name = "ヘイラッシャ" }
    , { rank = 5, pokemonId = 987, name = "ハバタクカミ" }
    , { rank = 6, pokemonId = 493, name = "アルセウス" }
    , { rank = 7, pokemonId = 1007, name = "コライドン" }
    , { rank = 8, pokemonId = 1008, name = "ミライドン" }
    , { rank = 9, pokemonId = 892, name = "ウーラオス" }
    , { rank = 10, pokemonId = 645, name = "ランドロス" }
    , { rank = 11, pokemonId = 970, name = "キラフロル" }
    , { rank = 12, pokemonId = 472, name = "グライオン" }
    , { rank = 13, pokemonId = 250, name = "ホウオウ" }
    , { rank = 14, pokemonId = 888, name = "ザシアン" }
    , { rank = 15, pokemonId = 149, name = "カイリュー" }
    , { rank = 16, pokemonId = 778, name = "ミミッキュ" }
    , { rank = 17, pokemonId = 1017, name = "オーガポン" }
    , { rank = 18, pokemonId = 382, name = "カイオーガ" }
    , { rank = 19, pokemonId = 980, name = "ドオー" }
    , { rank = 20, pokemonId = 934, name = "キョジオーン" }
    , { rank = 21, pokemonId = 901, name = "ガチグマ" }
    , { rank = 22, pokemonId = 903, name = "オオニューラ" }
    , { rank = 23, pokemonId = 861, name = "オーロンゲ" }
    , { rank = 24, pokemonId = 1018, name = "ブリジュラス" }
    , { rank = 25, pokemonId = 132, name = "メタモン" }
    , { rank = 26, pokemonId = 792, name = "ルナアーラ" }
    , { rank = 27, pokemonId = 990, name = "テツノワダチ" }
    , { rank = 28, pokemonId = 988, name = "テツノブジン" }
    , { rank = 29, pokemonId = 289, name = "ケッキング" }
    , { rank = 30, pokemonId = 1015, name = "ムゲンダイナ" }
    , { rank = 31, pokemonId = 905, name = "ラブトロス" }
    , { rank = 32, pokemonId = 1019, name = "ウネルミナモ" }
    , { rank = 33, pokemonId = 986, name = "サケブシッポ" }
    , { rank = 34, pokemonId = 959, name = "ナカヌチャン" }
    , { rank = 35, pokemonId = 464, name = "ドサイドン" }
    , { rank = 36, pokemonId = 76, name = "ゴローニャ" }
    , { rank = 37, pokemonId = 965, name = "ノココッチ" }
    , { rank = 38, pokemonId = 993, name = "テツノイバラ" }
    , { rank = 39, pokemonId = 645, name = "ランドロス" }
    , { rank = 40, pokemonId = 1001, name = "コオリッポ" }
    , { rank = 41, pokemonId = 995, name = "テツノイサハ" }
    , { rank = 42, pokemonId = 143, name = "カビゴン" }
    , { rank = 43, pokemonId = 644, name = "ゼクロム" }
    , { rank = 44, pokemonId = 643, name = "レシラム" }
    , { rank = 45, pokemonId = 1004, name = "イダイナキバ" }
    , { rank = 46, pokemonId = 984, name = "アラブルタケ" }
    , { rank = 47, pokemonId = 1016, name = "ウォーグル" }
    , { rank = 48, pokemonId = 989, name = "テツノコウベ" }
    , { rank = 49, pokemonId = 985, name = "スナノケガワ" }
    , { rank = 50, pokemonId = 487, name = "ギラティナ" }
    , { rank = 53, pokemonId = 248, name = "バンギラス" }
    , { rank = 54, pokemonId = 889, name = "ザマゼンタ" }
    , { rank = 55, pokemonId = 908, name = "マスカーニャ" }
    , { rank = 56, pokemonId = 823, name = "アーマーガア" }
    , { rank = 57, pokemonId = 892, name = "ウーラオス" }
    , { rank = 58, pokemonId = 991, name = "テツノツツミ" }
    , { rank = 59, pokemonId = 1000, name = "サーフゴー" }
    , { rank = 60, pokemonId = 493, name = "アルセウス" }
    , { rank = 61, pokemonId = 113, name = "ラッキー" }
    , { rank = 62, pokemonId = 492, name = "シェイミ" }
    , { rank = 63, pokemonId = 547, name = "エルフーン" }
    , { rank = 64, pokemonId = 184, name = "マリルリ" }
    , { rank = 65, pokemonId = 937, name = "ソウブレイズ" }
    , { rank = 66, pokemonId = 887, name = "ドラパルト" }
    , { rank = 67, pokemonId = 648, name = "メロエッタ" }
    , { rank = 68, pokemonId = 748, name = "ドヒドイデ" }
    , { rank = 69, pokemonId = 646, name = "キュレム" }
    , { rank = 70, pokemonId = 38, name = "キュウコン" }
    , { rank = 71, pokemonId = 706, name = "ヌメルゴン" }
    , { rank = 72, pokemonId = 385, name = "ジラーチ" }
    , { rank = 73, pokemonId = 384, name = "レックウザ" }
    , { rank = 74, pokemonId = 233, name = "ポリゴン２" }
    , { rank = 75, pokemonId = 485, name = "ヒードラン" }
    , { rank = 76, pokemonId = 450, name = "カバルドン" }
    , { rank = 77, pokemonId = 197, name = "ブラッキー" }
    , { rank = 78, pokemonId = 571, name = "ゾロアーク" }
    , { rank = 79, pokemonId = 474, name = "ポリゴンZ" }
    , { rank = 80, pokemonId = 475, name = "エルレイド" }
    , { rank = 81, pokemonId = 1005, name = "サケブシッポ" }
    , { rank = 82, pokemonId = 1006, name = "アラブルタケ" }
    , { rank = 83, pokemonId = 1009, name = "ハバタクカミ" }
    , { rank = 84, pokemonId = 1010, name = "チヲハウハネ" }
    , { rank = 85, pokemonId = 1011, name = "スナノケガワ" }
    , { rank = 86, pokemonId = 1012, name = "テツノワダチ" }
    , { rank = 87, pokemonId = 1014, name = "イダイナキバ" }
    , { rank = 88, pokemonId = 936, name = "グレンアルマ" }
    , { rank = 89, pokemonId = 996, name = "フリージオ" }
    , { rank = 90, pokemonId = 997, name = "テツノコウベ" }
    , { rank = 91, pokemonId = 998, name = "テツノイバラ" }
    , { rank = 92, pokemonId = 999, name = "テツノイサハ" }
    , { rank = 93, pokemonId = 483, name = "ディアルガ" }
    , { rank = 94, pokemonId = 484, name = "パルキア" }
    , { rank = 95, pokemonId = 717, name = "イベルタル" }
    , { rank = 96, pokemonId = 716, name = "ゼルネアス" }
    , { rank = 97, pokemonId = 719, name = "ディアンシー" }
    , { rank = 98, pokemonId = 720, name = "フーパ" }
    , { rank = 99, pokemonId = 721, name = "ボルケニオン" }
    , { rank = 100, pokemonId = 791, name = "ソルガレオ" }
    , { rank = 101, pokemonId = 381, name = "ラティオス" }
    , { rank = 102, pokemonId = 1021, name = "タケルライコ" }
    , { rank = 103, pokemonId = 992, name = "テツノカイナ" }
    , { rank = 104, pokemonId = 994, name = "テツノドクガ" }
    , { rank = 105, pokemonId = 1013, name = "ヤバソチャ" }
    , { rank = 106, pokemonId = 576, name = "ゴチルゼル" }
    , { rank = 107, pokemonId = 1023, name = "テツノカシラ" }
    , { rank = 108, pokemonId = 894, name = "レジエレキ" }
    , { rank = 109, pokemonId = 94, name = "ゲンガー" }
    , { rank = 110, pokemonId = 752, name = "オニシズクモ" }
    , { rank = 111, pokemonId = 493, name = "アルセウス" }
    , { rank = 112, pokemonId = 279, name = "ペリッパー" }
    , { rank = 113, pokemonId = 530, name = "ドリュウズ" }
    , { rank = 114, pokemonId = 904, name = "ハリーマン" }
    , { rank = 115, pokemonId = 488, name = "クレセリア" }
    , { rank = 116, pokemonId = 637, name = "ウルガモス" }
    , { rank = 117, pokemonId = 900, name = "バサギリ" }
    , { rank = 118, pokemonId = 130, name = "ギャラドス" }
    , { rank = 119, pokemonId = 145, name = "サンダー" }
    , { rank = 120, pokemonId = 925, name = "イッカネズミ" }
    , { rank = 121, pokemonId = 196, name = "エーフィ" }
    , { rank = 122, pokemonId = 956, name = "クエスパトラ" }
    , { rank = 123, pokemonId = 493, name = "アルセウス" }
    , { rank = 124, pokemonId = 227, name = "エアームド" }
    , { rank = 125, pokemonId = 1020, name = "ウガツホムラ" }
    , { rank = 126, pokemonId = 242, name = "ハピナス" }
    , { rank = 127, pokemonId = 646, name = "キュレム" }
    , { rank = 128, pokemonId = 720, name = "フーパ" }
    , { rank = 129, pokemonId = 380, name = "ラティアス" }
    , { rank = 130, pokemonId = 1022, name = "ウガツホムラ" }
    , { rank = 131, pokemonId = 893, name = "ザルード" }
    , { rank = 132, pokemonId = 895, name = "レジドラゴ" }
    , { rank = 133, pokemonId = 896, name = "ブリザポス" }
    , { rank = 134, pokemonId = 897, name = "レイスポス" }
    , { rank = 135, pokemonId = 902, name = "オーロット" }
    , { rank = 136, pokemonId = 906, name = "ニャイキング" }
    , { rank = 137, pokemonId = 907, name = "フラエッテ" }
    , { rank = 138, pokemonId = 909, name = "ウェーニバル" }
    , { rank = 139, pokemonId = 910, name = "ラウドボーン" }
    , { rank = 140, pokemonId = 911, name = "ドオー" }
    , { rank = 141, pokemonId = 912, name = "クルマユ" }
    , { rank = 142, pokemonId = 913, name = "ハルクジラ" }
    , { rank = 143, pokemonId = 914, name = "コノヨザル" }
    , { rank = 144, pokemonId = 915, name = "ドドゲザン" }
    , { rank = 145, pokemonId = 916, name = "イルカマン" }
    , { rank = 146, pokemonId = 917, name = "ミミズズ" }
    , { rank = 147, pokemonId = 918, name = "キョジオーン" }
    , { rank = 148, pokemonId = 919, name = "ナンジャモ" }
    , { rank = 149, pokemonId = 920, name = "セグレイブ" }
    , { rank = 150, pokemonId = 921, name = "カヌチャン" }
    ]


findRankByPokemonId : Int -> Maybe Int
findRankByPokemonId targetId =
    season34Rankings
        |> List.filter (\ranking -> ranking.pokemonId == targetId)
        |> List.head
        |> Maybe.map .rank


selectTop10 : List UsageRanking
selectTop10 =
    selectTopN 10


selectTopN : Int -> List UsageRanking
selectTopN n =
    season34Rankings
        |> List.take n


findRankByPokemonName : String -> Maybe Int
findRankByPokemonName targetName =
    season34Rankings
        |> List.filter (\ranking -> ranking.name == targetName)
        |> List.head
        |> Maybe.map .rank


-- 使用率上位50位のポケモンのみを取得する関数（名前ベースのマッチング）
selectTop50Pokemon : List Pokemon
selectTop50Pokemon =
    let
        getPokemonByNameFromRanking ranking =
            findPokemonByName ranking.name
    in
    season34Rankings
        |> List.take 50
        |> List.filterMap getPokemonByNameFromRanking


-- 使用率上位150位のポケモンのみを取得する関数（名前ベースのマッチング）
selectTop150Pokemon : List Pokemon
selectTop150Pokemon =
    let
        getPokemonByNameFromRanking ranking =
            findPokemonByName ranking.name
    in
    season34Rankings
        |> List.filterMap getPokemonByNameFromRanking