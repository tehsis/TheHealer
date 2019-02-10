//
//  Game.swift
//  The Healer
//
//  Created by Pablo Terradillos on 09/02/2019.
//  Copyright © 2019 Alidion. All rights reserved.
//

import Foundation

struct Game {
    var turn = 0
    var healer: Healer = Healer()
    
    var normalVillagers: [Villager] = []
    var cursedVillagers: [Villager] = []
    
    var healedVillagers: [Villager] = []
    var deadVillagers: [Villager] = []
    
    var villagers: [Villager] {
        return normalVillagers + cursedVillagers + healedVillagers + deadVillagers
    }
    
    mutating func healerHeal(to villager: Villager) {
        if normalVillagers.contains(villager) {
            kill(villager)
        } else if let villagerToHealIndex = cursedVillagers.firstIndex(of: villager) {
            cursedVillagers.remove(at:villagerToHealIndex)
            healedVillagers.append(villager)
            healer.gold += POINTS_FOR_HEALING
        }
    }
    
    mutating private func kill(_ villager: Villager) {
        if deadVillagers.firstIndex(of: villager) == nil {
            deadVillagers.append(villager)
        }
    }
    
    mutating func endTurn() {
        let diceRoll = Int.random(in:1...10)
        
        if diceRoll >= MINIMUM_DICE_VALUE_FOR_KILL {
            let randomVillagerIndex = Int.random(in: 0..<normalVillagers.count)
            kill(normalVillagers[randomVillagerIndex])
        }
    }
    
    init(maxVillagerSize: Int) {
        for _ in 0..<maxVillagerSize {
            let villager = Villager()
            let diceRoll = Int.random(in:1...10)
            if diceRoll > 5 {
              cursedVillagers.append(villager)
            } else {
              normalVillagers.append(villager)
            }
        }
    }
}

extension Game {
    var POINTS_FOR_HEALING: Int {
        return 10
    }
    
    var MINIMUM_DICE_VALUE_FOR_KILL: Int {
        return 6
    }
}
