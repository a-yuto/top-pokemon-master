#!/usr/bin/env node

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const DATA_DIR = path.join(__dirname, '../public/data/pokemon');
const OUTPUT_DIR = path.join(__dirname, '../src/Pokemon');

// JSONデータを読み込み
function loadJsonData() {
  const pokemonData = JSON.parse(fs.readFileSync(path.join(DATA_DIR, 'all.json'), 'utf8'));
  const moveData = JSON.parse(fs.readFileSync(path.join(DATA_DIR, 'moves.json'), 'utf8'));
  const abilityData = JSON.parse(fs.readFileSync(path.join(DATA_DIR, 'abilities.json'), 'utf8'));
  
  return { pokemonData, moveData, abilityData };
}

// Elmのリスト形式に変換
function convertToElmList(items, converter) {
  const elmItems = items.map(converter).join('\n    , ');
  return `[\n    ${elmItems}\n    ]`;
}

// ポケモンデータをElm形式に変換
function convertPokemonToElm(pokemon) {
  const evolutionMethods = pokemon.evolutionMethods.length > 0 
    ? `[${pokemon.evolutionMethods.map(evo => `{ toId = ${evo.toId}, method = LevelUp ${evo.level || 0} }`).join(', ')}]`
    : '[]';
    
  const preEvolutionId = pokemon.preEvolutionId ? `Just ${pokemon.preEvolutionId}` : 'Nothing';
  
  return `{ id = ${pokemon.id}
    , name = "${pokemon.name}"
    , englishName = "${pokemon.englishName}"
    , pokemonType = ${pokemon.pokemonType}
    , stats = { hp = ${pokemon.stats.hp}, attack = ${pokemon.stats.attack}, defense = ${pokemon.stats.defense}, specialAttack = ${pokemon.stats.specialAttack}, specialDefense = ${pokemon.stats.specialDefense}, speed = ${pokemon.stats.speed} }
    , preEvolutionId = ${preEvolutionId}
    , evolutionMethods = ${evolutionMethods}
    }`;
}

// 技データをElm形式に変換
function convertMoveToElm(move) {
  const power = move.power ? `Just ${move.power}` : 'Nothing';
  const accuracy = move.accuracy ? `Just ${move.accuracy}` : 'Nothing';
  const recoilPercent = move.recoilPercent ? `Just ${move.recoilPercent}` : 'Nothing';
  const drainPercent = move.drainPercent ? `Just ${move.drainPercent}` : 'Nothing';
  const flinchChance = move.flinchChance ? `Just ${move.flinchChance}` : 'Nothing';
  const criticalRatio = move.criticalRatio ? `Just ${move.criticalRatio}` : 'Nothing';
  const multiHitMin = move.multiHitMin ? `Just ${move.multiHitMin}` : 'Nothing';
  const multiHitMax = move.multiHitMax ? `Just ${move.multiHitMax}` : 'Nothing';
  const fixedDamageAmount = move.fixedDamageAmount ? `Just ${move.fixedDamageAmount}` : 'Nothing';
  const healPercent = move.healPercent ? `Just ${move.healPercent}` : 'Nothing';
  
  const statusEffect = move.statusEffect ? `Just { condition = ${move.statusEffect.condition}, chance = ${move.statusEffect.chance} }` : 'Nothing';
  const weatherEffect = move.weatherEffect ? `Just ${move.weatherEffect}` : 'Nothing';
  const terrainEffect = move.terrainEffect ? `Just ${move.terrainEffect}` : 'Nothing';
  const hazardEffect = move.hazardEffect ? `Just ${move.hazardEffect}` : 'Nothing';
  
  return `{ id = ${move.id}
    , name = "${move.name}"
    , englishName = "${move.englishName}"
    , moveType = ${move.moveType}
    , category = ${move.category}
    , power = ${power}
    , accuracy = ${accuracy}
    , pp = ${move.pp}
    , priority = ${move.priority}
    , target = ${move.target}
    , description = "${move.description}"
    , isContact = ${move.isContact}
    , isSound = ${move.isSound}
    , isFixedDamage = ${move.isFixedDamage}
    , isOneHitKO = ${move.isOneHitKO}
    , isMultiHit = ${move.isMultiHit}
    , isRecoil = ${move.isRecoil}
    , isCharge = ${move.isCharge}
    , isScreen = ${move.isScreen}
    , isTerrain = ${move.isTerrain}
    , isPunch = ${move.isPunch}
    , isBite = ${move.isBite}
    , isPulse = ${move.isPulse}
    , isBall = ${move.isBall}
    , isDance = ${move.isDance}
    , isPowder = ${move.isPowder}
    , isDrain = ${move.isDrain}
    , isProtect = ${move.isProtect}
    , isSwitch = ${move.isSwitch}
    , canFlinch = ${move.canFlinch}
    , canCritical = ${move.canCritical}
    , bypassProtect = ${move.bypassProtect}
    , bypassSubstitute = ${move.bypassSubstitute}
    , alwaysHit = ${move.alwaysHit}
    , mustRecharge = ${move.mustRecharge}
    , ignoreDefense = ${move.ignoreDefense}
    , ignoreEvasion = ${move.ignoreEvasion}
    , healUser = ${move.healUser}
    , cureStatus = ${move.cureStatus}
    , removeHazards = ${move.removeHazards}
    , recoilPercent = ${recoilPercent}
    , drainPercent = ${drainPercent}
    , flinchChance = ${flinchChance}
    , criticalRatio = ${criticalRatio}
    , multiHitMin = ${multiHitMin}
    , multiHitMax = ${multiHitMax}
    , fixedDamageAmount = ${fixedDamageAmount}
    , healPercent = ${healPercent}
    , statChanges = []
    , statusEffect = ${statusEffect}
    , weatherEffect = ${weatherEffect}
    , terrainEffect = ${terrainEffect}
    , hazardEffect = ${hazardEffect}
    }`;
}

// ポケモンデータモジュールを生成
function generatePokemonDataModule(pokemonData) {
  const elmList = convertToElmList(pokemonData, convertPokemonToElm);
  
  return `module Pokemon.Data exposing (allPokemon, getPokemonById, getPokemonByName)

import Pokemon.Types exposing (Pokemon, PokemonType(..), Stats, Evolution, EvolutionMethod(..))


allPokemon : List Pokemon
allPokemon =
    ${elmList}


getPokemonById : Int -> Maybe Pokemon
getPokemonById id =
    allPokemon
        |> List.filter (\\pokemon -> pokemon.id == id)
        |> List.head


getPokemonByName : String -> Maybe Pokemon
getPokemonByName name =
    allPokemon
        |> List.filter (\\pokemon -> pokemon.name == name)
        |> List.head
`;
}

// 技データモジュールを生成
function generateMoveDataModule(moveData) {
  const elmList = convertToElmList(moveData, convertMoveToElm);
  
  return `module Pokemon.MoveData exposing (allMoves, getMoveById, getMoveByName)

import Pokemon.Move exposing (Move, MoveCategory(..), MoveTarget(..), StatChange, StatTarget(..), StatType(..), StatusEffect, StatusCondition(..), WeatherType(..), TerrainType(..), HazardType(..))
import Pokemon.Types exposing (PokemonType(..))


allMoves : List Move
allMoves =
    ${elmList}


getMoveById : Int -> Maybe Move
getMoveById id =
    allMoves
        |> List.filter (\\move -> move.id == id)
        |> List.head


getMoveByName : String -> Maybe Move
getMoveByName name =
    allMoves
        |> List.filter (\\move -> move.name == name)
        |> List.head
`;
}

// 特性データをElm形式に変換
function convertAbilityToElm(ability) {
  return `{ id = ${ability.id}
    , name = "${ability.name}"
    , englishName = "${ability.englishName}"
    , description = "${ability.description}"
    }`;
}

// 特性データモジュールを生成
function generateAbilityDataModule(abilityData) {
  const elmList = convertToElmList(abilityData, convertAbilityToElm);
  
  return `module Pokemon.AbilityData exposing (allAbilities, getAbilityById, getAbilityByName, Ability)

type alias Ability =
    { id : Int
    , name : String
    , englishName : String
    , description : String
    }

allAbilities : List Ability
allAbilities =
    ${elmList}


getAbilityById : Int -> Maybe Ability
getAbilityById id =
    allAbilities
        |> List.filter (\\ability -> ability.id == id)
        |> List.head


getAbilityByName : String -> Maybe Ability
getAbilityByName name =
    allAbilities
        |> List.filter (\\ability -> ability.name == name)
        |> List.head
`;
}

// メイン実行
function main() {
  console.log('Converting JSON data to Elm modules...');
  
  try {
    const { pokemonData, moveData, abilityData } = loadJsonData();
    
    // ディレクトリが存在しない場合は作成
    if (!fs.existsSync(OUTPUT_DIR)) {
      fs.mkdirSync(OUTPUT_DIR, { recursive: true });
    }
    
    // 全ポケモンデータモジュール生成
    const pokemonModule = generatePokemonDataModule(pokemonData);
    fs.writeFileSync(path.join(OUTPUT_DIR, 'Data.elm'), pokemonModule);
    console.log(`Generated Pokemon data module with ${pokemonData.length} Pokemon`);
    
    // 全技データモジュール生成
    const moveModule = generateMoveDataModule(moveData);
    fs.writeFileSync(path.join(OUTPUT_DIR, 'MoveData.elm'), moveModule);
    console.log(`Generated Move data module with ${moveData.length} moves`);
    
    // 特性データモジュール生成
    const abilityModule = generateAbilityDataModule(abilityData);
    fs.writeFileSync(path.join(OUTPUT_DIR, 'AbilityData.elm'), abilityModule);
    console.log(`Generated Ability data module with ${abilityData.length} abilities`);
    
    console.log('Elm module generation completed successfully!');
  } catch (error) {
    console.error('Error during conversion:', error);
    process.exit(1);
  }
}

main();