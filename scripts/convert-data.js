#!/usr/bin/env node

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// データソースとターゲットのパス
const SOURCE_DIR = '/mnt/c/Users/guita/work/pokemon-saikyou/data';
const TARGET_DIR = path.join(__dirname, '../public/data/pokemon');

// タイプ名のマッピング
const TYPE_MAP = {
  'NORMAL': 'NormalType',
  'FIRE': 'FireType',
  'WATER': 'WaterType',
  'ELECTRIC': 'ElectricType',
  'GRASS': 'GrassType',
  'ICE': 'IceType',
  'FIGHTING': 'FightingType',
  'POISON': 'PoisonType',
  'GROUND': 'GroundType',
  'FLYING': 'FlyingType',
  'PSYCHIC': 'PsychicType',
  'BUG': 'BugType',
  'ROCK': 'RockType',
  'GHOST': 'GhostType',
  'DRAGON': 'DragonType',
  'DARK': 'DarkType',
  'STEEL': 'SteelType',
  'FAIRY': 'FairyType'
};

// 複合タイプの生成
function getCombinedType(types) {
  if (!types || types.length === 0) return null;
  
  if (types.length === 1) {
    return TYPE_MAP[types[0]] || 'NormalType';
  }
  
  // 複合タイプの場合、アルファベット順でソート
  const [type1, type2] = types.sort();
  
  // タイプ名から"Type"を除去して結合
  const base1 = TYPE_MAP[type1]?.replace('Type', '') || 'Normal';
  const base2 = TYPE_MAP[type2]?.replace('Type', '') || 'Normal';
  
  // アルファベット順で結合（Elmの型定義に合わせる）
  const typeOrder = ['Normal', 'Fire', 'Water', 'Electric', 'Grass', 'Ice', 
                     'Fighting', 'Poison', 'Ground', 'Flying', 'Psychic', 'Bug', 
                     'Rock', 'Ghost', 'Dragon', 'Dark', 'Steel', 'Fairy'];
  
  const index1 = typeOrder.indexOf(base1);
  const index2 = typeOrder.indexOf(base2);
  
  if (index1 < index2) {
    return base1 + base2;
  } else {
    return base2 + base1;
  }
}

// ポケモンデータの変換
function convertPokemonData() {
  const sourceFile = path.join(SOURCE_DIR, 'pokemons.json');
  const targetFile = path.join(TARGET_DIR, 'all.json');
  
  const rawData = fs.readFileSync(sourceFile, 'utf8');
  const pokemons = JSON.parse(rawData);
  
  const convertedPokemons = pokemons.map(pokemon => ({
    id: pokemon.id,
    name: pokemon.jpName,
    englishName: pokemon.jpName, // 英語名は後で追加
    pokemonType: getCombinedType(pokemon.typeNames),
    stats: {
      hp: pokemon.baseStats.HP,
      attack: pokemon.baseStats.ATTACK,
      defense: pokemon.baseStats.DEFENSE,
      specialAttack: pokemon.baseStats.SPECIAL_ATTACK,
      specialDefense: pokemon.baseStats.SPECIAL_DEFENSE,
      speed: pokemon.baseStats.SPEED
    },
    preEvolutionId: null, // 進化情報は後で追加
    evolutionMethods: [],
    weight: pokemon.weight,
    height: 0, // 高さ情報は元データにないため0
    abilities: pokemon.abilityIds || [],
    availableMoveIds: pokemon.availableMoveIds || [],
    popularMoveIds: pokemon.popularMoveIds || [],
    iconUrl: pokemon.iconUrl,
    pokedexNo: pokemon.pokedexNo
  }));
  
  // ディレクトリが存在しない場合は作成
  if (!fs.existsSync(TARGET_DIR)) {
    fs.mkdirSync(TARGET_DIR, { recursive: true });
  }
  
  fs.writeFileSync(targetFile, JSON.stringify(convertedPokemons, null, 2));
  console.log(`Converted ${convertedPokemons.length} Pokemon to ${targetFile}`);
}

// 技データの変換
function convertMoveData() {
  const sourceFile = path.join(SOURCE_DIR, 'moves.json');
  const targetFile = path.join(TARGET_DIR, 'moves.json');
  
  const rawData = fs.readFileSync(sourceFile, 'utf8');
  const moves = JSON.parse(rawData);
  
  const convertedMoves = moves.map(move => {
    // カテゴリの変換
    const categoryMap = {
      'PHYSICAL': 'Physical',
      'SPECIAL': 'Special',
      'STATUS': 'Status'
    };
    
    // フラグの設定（genresとirregularから推測）
    const flags = {
      isContact: move.moveCategory === 'PHYSICAL' && !move.genres?.includes('NON_CONTACT'),
      isSound: move.genres?.includes('SOUND') || false,
      isFixedDamage: move.irregular?.irregularType === 'FIXED_DAMAGE' || false,
      isOneHitKO: move.irregular?.irregularType === 'ONE_HIT_KO' || false,
      isMultiHit: move.numberOfStrikes !== null && move.numberOfStrikes !== 1,
      isRecoil: move.genres?.includes('RECOIL') || false,
      isCharge: move.genres?.includes('CHARGE') || false,
      isScreen: move.genres?.includes('SCREEN') || false,
      isTerrain: move.genres?.includes('TERRAIN') || false,
      isPunch: move.genres?.includes('PUNCH') || move.jpName?.includes('パンチ'),
      isBite: move.genres?.includes('BITE') || move.jpName?.includes('かみ'),
      isPulse: move.genres?.includes('PULSE') || move.jpName?.includes('はどう'),
      isBall: move.genres?.includes('BALL') || move.jpName?.includes('ボール'),
      isDance: move.genres?.includes('DANCE') || move.jpName?.includes('ダンス'),
      isPowder: move.genres?.includes('POWDER') || move.jpName?.includes('こな'),
      isDrain: move.genres?.includes('DRAIN') || false,
      isProtect: move.genres?.includes('PROTECT') || false,
      isSwitch: move.genres?.includes('SWITCH') || false,
      canFlinch: move.genres?.includes('FLINCH') || false,
      canCritical: move.genres?.includes('CRITICAL') || false,
      bypassProtect: false,
      bypassSubstitute: false,
      alwaysHit: move.genres?.includes('ALWAYS_HIT') || false,
      mustRecharge: move.genres?.includes('RECHARGE') || false,
      ignoreDefense: move.irregular?.irregularType === 'SACRED_SWORD' || false,
      ignoreEvasion: false,
      healUser: move.genres?.includes('HEAL') || false,
      cureStatus: false,
      removeHazards: false
    };
    
    return {
      id: move.id,
      name: move.jpName,
      englishName: move.jpName, // 英語名は後で追加
      moveType: TYPE_MAP[move.typeName] || 'NormalType',
      category: categoryMap[move.moveCategory] || 'Physical',
      power: move.power || null,
      accuracy: 100, // デフォルト値
      pp: 10, // デフォルト値
      priority: 0, // デフォルト値
      target: 'SingleTarget', // デフォルト値
      description: '',
      ...flags,
      recoilPercent: null,
      drainPercent: null,
      flinchChance: null,
      criticalRatio: null,
      multiHitMin: move.numberOfStrikes,
      multiHitMax: move.numberOfStrikes,
      fixedDamageAmount: null,
      healPercent: null,
      statChanges: [],
      statusEffect: null,
      weatherEffect: null,
      terrainEffect: null,
      hazardEffect: null
    };
  });
  
  fs.writeFileSync(targetFile, JSON.stringify(convertedMoves, null, 2));
  console.log(`Converted ${convertedMoves.length} moves to ${targetFile}`);
}

// 特性データの変換
function convertAbilityData() {
  const sourceFile = path.join(SOURCE_DIR, 'abilities.json');
  const targetFile = path.join(TARGET_DIR, 'abilities.json');
  
  const rawData = fs.readFileSync(sourceFile, 'utf8');
  const abilities = JSON.parse(rawData);
  
  const convertedAbilities = abilities.map(ability => ({
    id: ability.id,
    name: ability.jpName,
    englishName: ability.jpName, // 英語名は後で追加
    description: '',
    irregular: ability.irregular
  }));
  
  fs.writeFileSync(targetFile, JSON.stringify(convertedAbilities, null, 2));
  console.log(`Converted ${convertedAbilities.length} abilities to ${targetFile}`);
}

// メイン実行
function main() {
  console.log('Starting data conversion...');
  
  try {
    convertPokemonData();
    convertMoveData();
    convertAbilityData();
    console.log('Data conversion completed successfully!');
  } catch (error) {
    console.error('Error during conversion:', error);
    process.exit(1);
  }
}

main();