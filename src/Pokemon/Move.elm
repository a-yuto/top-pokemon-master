module Pokemon.Move exposing 
    ( Move
    , MoveCategory(..)
    , MoveTarget(..)
    , StatChange
    , StatTarget(..)
    , StatType(..)
    , StatusEffect
    , StatusCondition(..)
    , WeatherType(..)
    , TerrainType(..)
    , HazardType(..)
    , moveToString
    )

import Pokemon.Types exposing (PokemonType)


type alias Move =
    { id : Int
    , name : String
    , englishName : String
    , moveType : PokemonType  -- 技のタイプ（PokemonTypeの単タイプのみ使用）
    , category : MoveCategory
    , power : Maybe Int  -- 威力（変化技の場合はNothing）
    , accuracy : Maybe Int  -- 命中率（必中技の場合はNothing）
    , pp : Int  -- 基本PP
    , priority : Int  -- 優先度（通常は0、先制技は+1以上、後攻技は-1以下）
    , target : MoveTarget
    , description : String
    
    -- フラグ系
    , isContact : Bool           -- 直接攻撃
    , isSound : Bool              -- 音技
    , isFixedDamage : Bool        -- ダメージ固定技
    , isOneHitKO : Bool           -- 一撃必殺技
    , isMultiHit : Bool           -- 連続攻撃技
    , isRecoil : Bool             -- 反動技
    , isCharge : Bool             -- 溜め技
    , isScreen : Bool             -- 壁技
    , isTerrain : Bool            -- フィールド技
    , isPunch : Bool              -- パンチ技
    , isBite : Bool               -- かみつき技
    , isPulse : Bool              -- 波動技
    , isBall : Bool               -- 弾技
    , isDance : Bool              -- 踊り技
    , isPowder : Bool             -- 粉技
    , isDrain : Bool              -- HP吸収技
    , isProtect : Bool            -- まもる系
    , isSwitch : Bool             -- 交代技
    , canFlinch : Bool            -- ひるみ効果あり
    , canCritical : Bool          -- 急所に当たりやすい
    , bypassProtect : Bool        -- まもる貫通
    , bypassSubstitute : Bool     -- みがわり貫通
    , alwaysHit : Bool            -- 必中
    , mustRecharge : Bool         -- 次ターン反動
    , ignoreDefense : Bool        -- 防御無視
    , ignoreEvasion : Bool        -- 回避率無視
    , healUser : Bool             -- 自分回復技
    , cureStatus : Bool           -- 状態異常回復
    , removeHazards : Bool        -- 設置技除去
    
    -- 数値パラメータ
    , recoilPercent : Maybe Float      -- 反動ダメージ割合
    , drainPercent : Maybe Float       -- HP吸収割合
    , flinchChance : Maybe Float       -- ひるみ確率
    , criticalRatio : Maybe Int        -- 急所率段階
    , multiHitMin : Maybe Int          -- 連続攻撃最小回数
    , multiHitMax : Maybe Int          -- 連続攻撃最大回数
    , fixedDamageAmount : Maybe Int    -- 固定ダメージ量
    , healPercent : Maybe Float        -- 回復割合
    
    -- ステータス変化
    , statChanges : List StatChange         -- ステータス変化
    , statusEffect : Maybe StatusEffect     -- 状態異常付与
    
    -- 天候・フィールド効果
    , weatherEffect : Maybe WeatherType     -- 天候変化
    , terrainEffect : Maybe TerrainType     -- フィールド変化
    , hazardEffect : Maybe HazardType       -- 設置技
    }


-- 技の分類
type MoveCategory
    = Physical  -- 物理技
    | Special   -- 特殊技
    | Status    -- 変化技


-- 技の対象
type MoveTarget
    = SingleTarget  -- 相手1体
    | AllOpponents  -- 相手全体
    | Self  -- 自分
    | AllPokemon  -- 全体（自分含む）
    | Ally  -- 味方1体
    | UserAndAlly  -- 自分と味方
    | OpponentField  -- 相手の場
    | UserField  -- 味方の場
    | EntireField  -- 全体の場
    | RandomOpponent  -- 相手ランダム1体


-- ステータス変化
type alias StatChange =
    { stat : StatType
    , stages : Int          -- 変化段階（-6～+6）
    , chance : Float        -- 発生確率（0.0～1.0）
    , target : StatTarget   -- 対象（自分/相手）
    }


-- ステータス変化の対象
type StatTarget 
    = User      -- 自分
    | Opponent  -- 相手


-- ステータスの種類
type StatType
    = Attack
    | Defense
    | SpecialAttack
    | SpecialDefense
    | Speed
    | Accuracy
    | Evasion
    | CriticalHit


-- 状態異常効果
type alias StatusEffect =
    { condition : StatusCondition
    , chance : Float  -- 発生確率（0.0～1.0）
    }


-- 状態異常
type StatusCondition
    = Paralysis  -- まひ
    | Burn  -- やけど
    | Freeze  -- こおり
    | Poison  -- どく
    | BadPoison  -- もうどく
    | Sleep  -- ねむり
    | Confusion  -- こんらん
    | Attract  -- メロメロ
    | Taunt  -- ちょうはつ
    | Torment  -- いちゃもん
    | Disable  -- かなしばり
    | Embargo  -- さしおさえ
    | HealBlock  -- かいふくふうじ
    | Ingrain  -- ねをはる
    | Nightmare  -- あくむ
    | PerishSong  -- ほろびのうた
    | Trapped  -- バインド状態


-- 天候
type WeatherType
    = Sun  -- 晴れ
    | Rain  -- 雨
    | Sandstorm  -- 砂嵐
    | Hail  -- あられ
    | Snow  -- ゆき
    | HarshSunlight  -- 大日照り
    | HeavyRain  -- 大雨
    | StrongWinds  -- 乱気流


-- フィールド
type TerrainType
    = ElectricTerrain  -- エレキフィールド
    | GrassyTerrain  -- グラスフィールド
    | MistyTerrain  -- ミストフィールド
    | PsychicTerrain  -- サイコフィールド


-- 設置技
type HazardType
    = StealthRock  -- ステルスロック
    | Spikes  -- まきびし
    | ToxicSpikes  -- どくびし
    | StickyWeb  -- ねばねばネット
    | Reflect  -- リフレクター
    | LightScreen  -- ひかりのかべ
    | AuroraVeil  -- オーロラベール
    | Tailwind  -- おいかぜ
    | LuckyChant  -- おまじない
    | Safeguard  -- しんぴのまもり


-- 技名を文字列に変換（表示用）
moveToString : Move -> String
moveToString move =
    move.name