module Pokemon.Types exposing 
    ( Pokemon
    , PokemonType(..)
    , Stats
    , Evolution
    , EvolutionMethod(..)
    , typeToString
    )


type alias Pokemon =
    { id : Int
    , name : String
    , englishName : String
    , pokemonType : PokemonType
    , stats : Stats
    , preEvolutionId : Maybe Int
    , evolutionMethods : List Evolution
    }


type alias Stats =
    { hp : Int
    , attack : Int
    , defense : Int
    , specialAttack : Int
    , specialDefense : Int
    , speed : Int
    }


type alias Evolution =
    { toId : Int
    , method : EvolutionMethod
    }


type EvolutionMethod
    = LevelUp Int
    | Stone String
    | Trade
    | TradeWithItem String
    | Friendship
    | FriendshipDay
    | FriendshipNight
    | Location String
    | Other String


-- 全てのタイプ組み合わせを表現（単タイプ + 複合タイプ）
-- 複合タイプは順序を区別しない（例：FireWaterとWaterFireは同じなので、FireWaterのみ定義）
type PokemonType
    -- 単タイプ（18種類）
    = NormalType | FireType | WaterType | ElectricType | GrassType | IceType | FightingType | PoisonType | GroundType | FlyingType | PsychicType | BugType | RockType | GhostType | DragonType | DarkType | SteelType | FairyType
    -- 複合タイプ（153種類：18×17÷2）
    -- Normal系
    | NormalFire | NormalWater | NormalElectric | NormalGrass | NormalIce | NormalFighting | NormalPoison | NormalGround | NormalFlying | NormalPsychic | NormalBug | NormalRock | NormalGhost | NormalDragon | NormalDark | NormalSteel | NormalFairy
    -- Fire系（Normalとの組み合わせは除く）
    | FireWater | FireElectric | FireGrass | FireIce | FireFighting | FirePoison | FireGround | FireFlying | FirePsychic | FireBug | FireRock | FireGhost | FireDragon | FireDark | FireSteel | FireFairy
    -- Water系（Normal、Fireとの組み合わせは除く）
    | WaterElectric | WaterGrass | WaterIce | WaterFighting | WaterPoison | WaterGround | WaterFlying | WaterPsychic | WaterBug | WaterRock | WaterGhost | WaterDragon | WaterDark | WaterSteel | WaterFairy
    -- Electric系（Normal、Fire、Waterとの組み合わせは除く）
    | ElectricGrass | ElectricIce | ElectricFighting | ElectricPoison | ElectricGround | ElectricFlying | ElectricPsychic | ElectricBug | ElectricRock | ElectricGhost | ElectricDragon | ElectricDark | ElectricSteel | ElectricFairy
    -- Grass系（以前の組み合わせは除く）
    | GrassIce | GrassFighting | GrassPoison | GrassGround | GrassFlying | GrassPsychic | GrassBug | GrassRock | GrassGhost | GrassDragon | GrassDark | GrassSteel | GrassFairy
    -- Ice系
    | IceFighting | IcePoison | IceGround | IceFlying | IcePsychic | IceBug | IceRock | IceGhost | IceDragon | IceDark | IceSteel | IceFairy
    -- Fighting系
    | FightingPoison | FightingGround | FightingFlying | FightingPsychic | FightingBug | FightingRock | FightingGhost | FightingDragon | FightingDark | FightingSteel | FightingFairy
    -- Poison系
    | PoisonGround | PoisonFlying | PoisonPsychic | PoisonBug | PoisonRock | PoisonGhost | PoisonDragon | PoisonDark | PoisonSteel | PoisonFairy
    -- Ground系
    | GroundFlying | GroundPsychic | GroundBug | GroundRock | GroundGhost | GroundDragon | GroundDark | GroundSteel | GroundFairy
    -- Flying系
    | FlyingPsychic | FlyingBug | FlyingRock | FlyingGhost | FlyingDragon | FlyingDark | FlyingSteel | FlyingFairy
    -- Psychic系
    | PsychicBug | PsychicRock | PsychicGhost | PsychicDragon | PsychicDark | PsychicSteel | PsychicFairy
    -- Bug系
    | BugRock | BugGhost | BugDragon | BugDark | BugSteel | BugFairy
    -- Rock系
    | RockGhost | RockDragon | RockDark | RockSteel | RockFairy
    -- Ghost系
    | GhostDragon | GhostDark | GhostSteel | GhostFairy
    -- Dragon系
    | DragonDark | DragonSteel | DragonFairy
    -- Dark系
    | DarkSteel | DarkFairy
    -- Steel系
    | SteelFairy


-- タイプを文字列に変換（表示用）
typeToString : PokemonType -> String
typeToString pokemonType =
    case pokemonType of
        -- 単タイプ
        NormalType -> "ノーマル"
        FireType -> "ほのお"
        WaterType -> "みず"
        ElectricType -> "でんき"
        GrassType -> "くさ"
        IceType -> "こおり"
        FightingType -> "かくとう"
        PoisonType -> "どく"
        GroundType -> "じめん"
        FlyingType -> "ひこう"
        PsychicType -> "エスパー"
        BugType -> "むし"
        RockType -> "いわ"
        GhostType -> "ゴースト"
        DragonType -> "ドラゴン"
        DarkType -> "あく"
        SteelType -> "はがね"
        FairyType -> "フェアリー"
        
        -- 複合タイプ - Normal系
        NormalFire -> "ノーマル/ほのお"
        NormalWater -> "ノーマル/みず"
        NormalElectric -> "ノーマル/でんき"
        NormalGrass -> "ノーマル/くさ"
        NormalIce -> "ノーマル/こおり"
        NormalFighting -> "ノーマル/かくとう"
        NormalPoison -> "ノーマル/どく"
        NormalGround -> "ノーマル/じめん"
        NormalFlying -> "ノーマル/ひこう"
        NormalPsychic -> "ノーマル/エスパー"
        NormalBug -> "ノーマル/むし"
        NormalRock -> "ノーマル/いわ"
        NormalGhost -> "ノーマル/ゴースト"
        NormalDragon -> "ノーマル/ドラゴン"
        NormalDark -> "ノーマル/あく"
        NormalSteel -> "ノーマル/はがね"
        NormalFairy -> "ノーマル/フェアリー"
        
        -- 複合タイプ - Fire系
        FireWater -> "ほのお/みず"
        FireElectric -> "ほのお/でんき"
        FireGrass -> "ほのお/くさ"
        FireIce -> "ほのお/こおり"
        FireFighting -> "ほのお/かくとう"
        FirePoison -> "ほのお/どく"
        FireGround -> "ほのお/じめん"
        FireFlying -> "ほのお/ひこう"
        FirePsychic -> "ほのお/エスパー"
        FireBug -> "ほのお/むし"
        FireRock -> "ほのお/いわ"
        FireGhost -> "ほのお/ゴースト"
        FireDragon -> "ほのお/ドラゴン"
        FireDark -> "ほのお/あく"
        FireSteel -> "ほのお/はがね"
        FireFairy -> "ほのお/フェアリー"
        
        -- 複合タイプ - Water系
        WaterElectric -> "みず/でんき"
        WaterGrass -> "みず/くさ"
        WaterIce -> "みず/こおり"
        WaterFighting -> "みず/かくとう"
        WaterPoison -> "みず/どく"
        WaterGround -> "みず/じめん"
        WaterFlying -> "みず/ひこう"
        WaterPsychic -> "みず/エスパー"
        WaterBug -> "みず/むし"
        WaterRock -> "みず/いわ"
        WaterGhost -> "みず/ゴースト"
        WaterDragon -> "みず/ドラゴン"
        WaterDark -> "みず/あく"
        WaterSteel -> "みず/はがね"
        WaterFairy -> "みず/フェアリー"
        
        -- 複合タイプ - Electric系
        ElectricGrass -> "でんき/くさ"
        ElectricIce -> "でんき/こおり"
        ElectricFighting -> "でんき/かくとう"
        ElectricPoison -> "でんき/どく"
        ElectricGround -> "でんき/じめん"
        ElectricFlying -> "でんき/ひこう"
        ElectricPsychic -> "でんき/エスパー"
        ElectricBug -> "でんき/むし"
        ElectricRock -> "でんき/いわ"
        ElectricGhost -> "でんき/ゴースト"
        ElectricDragon -> "でんき/ドラゴン"
        ElectricDark -> "でんき/あく"
        ElectricSteel -> "でんき/はがね"
        ElectricFairy -> "でんき/フェアリー"
        
        -- 複合タイプ - Grass系
        GrassIce -> "くさ/こおり"
        GrassFighting -> "くさ/かくとう"
        GrassPoison -> "くさ/どく"
        GrassGround -> "くさ/じめん"
        GrassFlying -> "くさ/ひこう"
        GrassPsychic -> "くさ/エスパー"
        GrassBug -> "くさ/むし"
        GrassRock -> "くさ/いわ"
        GrassGhost -> "くさ/ゴースト"
        GrassDragon -> "くさ/ドラゴン"
        GrassDark -> "くさ/あく"
        GrassSteel -> "くさ/はがね"
        GrassFairy -> "くさ/フェアリー"
        
        -- 複合タイプ - Ice系
        IceFighting -> "こおり/かくとう"
        IcePoison -> "こおり/どく"
        IceGround -> "こおり/じめん"
        IceFlying -> "こおり/ひこう"
        IcePsychic -> "こおり/エスパー"
        IceBug -> "こおり/むし"
        IceRock -> "こおり/いわ"
        IceGhost -> "こおり/ゴースト"
        IceDragon -> "こおり/ドラゴン"
        IceDark -> "こおり/あく"
        IceSteel -> "こおり/はがね"
        IceFairy -> "こおり/フェアリー"
        
        -- 複合タイプ - Fighting系
        FightingPoison -> "かくとう/どく"
        FightingGround -> "かくとう/じめん"
        FightingFlying -> "かくとう/ひこう"
        FightingPsychic -> "かくとう/エスパー"
        FightingBug -> "かくとう/むし"
        FightingRock -> "かくとう/いわ"
        FightingGhost -> "かくとう/ゴースト"
        FightingDragon -> "かくとう/ドラゴン"
        FightingDark -> "かくとう/あく"
        FightingSteel -> "かくとう/はがね"
        FightingFairy -> "かくとう/フェアリー"
        
        -- 複合タイプ - Poison系
        PoisonGround -> "どく/じめん"
        PoisonFlying -> "どく/ひこう"
        PoisonPsychic -> "どく/エスパー"
        PoisonBug -> "どく/むし"
        PoisonRock -> "どく/いわ"
        PoisonGhost -> "どく/ゴースト"
        PoisonDragon -> "どく/ドラゴン"
        PoisonDark -> "どく/あく"
        PoisonSteel -> "どく/はがね"
        PoisonFairy -> "どく/フェアリー"
        
        -- 複合タイプ - Ground系
        GroundFlying -> "じめん/ひこう"
        GroundPsychic -> "じめん/エスパー"
        GroundBug -> "じめん/むし"
        GroundRock -> "じめん/いわ"
        GroundGhost -> "じめん/ゴースト"
        GroundDragon -> "じめん/ドラゴン"
        GroundDark -> "じめん/あく"
        GroundSteel -> "じめん/はがね"
        GroundFairy -> "じめん/フェアリー"
        
        -- 複合タイプ - Flying系
        FlyingPsychic -> "ひこう/エスパー"
        FlyingBug -> "ひこう/むし"
        FlyingRock -> "ひこう/いわ"
        FlyingGhost -> "ひこう/ゴースト"
        FlyingDragon -> "ひこう/ドラゴン"
        FlyingDark -> "ひこう/あく"
        FlyingSteel -> "ひこう/はがね"
        FlyingFairy -> "ひこう/フェアリー"
        
        -- 複合タイプ - Psychic系
        PsychicBug -> "エスパー/むし"
        PsychicRock -> "エスパー/いわ"
        PsychicGhost -> "エスパー/ゴースト"
        PsychicDragon -> "エスパー/ドラゴン"
        PsychicDark -> "エスパー/あく"
        PsychicSteel -> "エスパー/はがね"
        PsychicFairy -> "エスパー/フェアリー"
        
        -- 複合タイプ - Bug系
        BugRock -> "むし/いわ"
        BugGhost -> "むし/ゴースト"
        BugDragon -> "むし/ドラゴン"
        BugDark -> "むし/あく"
        BugSteel -> "むし/はがね"
        BugFairy -> "むし/フェアリー"
        
        -- 複合タイプ - Rock系
        RockGhost -> "いわ/ゴースト"
        RockDragon -> "いわ/ドラゴン"
        RockDark -> "いわ/あく"
        RockSteel -> "いわ/はがね"
        RockFairy -> "いわ/フェアリー"
        
        -- 複合タイプ - Ghost系
        GhostDragon -> "ゴースト/ドラゴン"
        GhostDark -> "ゴースト/あく"
        GhostSteel -> "ゴースト/はがね"
        GhostFairy -> "ゴースト/フェアリー"
        
        -- 複合タイプ - Dragon系
        DragonDark -> "ドラゴン/あく"
        DragonSteel -> "ドラゴン/はがね"
        DragonFairy -> "ドラゴン/フェアリー"
        
        -- 複合タイプ - Dark系
        DarkSteel -> "あく/はがね"
        DarkFairy -> "あく/フェアリー"
        
        -- 複合タイプ - Steel系
        SteelFairy -> "はがね/フェアリー"