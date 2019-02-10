//
//  ViewController.swift
//  The Healer
//
//  Created by Pablo Terradillos on 09/02/2019.
//  Copyright © 2019 Alidion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game! = nil {
        didSet {
            updateViewFromModel()
        }
    }
    
    var ButtonsVillagersMap: [UIButton:Villager] = [:]
    
    @IBOutlet var VillagersButtons: [UIButton]!
    
    @IBAction func onVillagerSelected(_ sender: UIButton) {
        if let villager = ButtonsVillagersMap[sender] {
            game.healerHeal(to: villager)
        }
    }
    
    @IBAction func onSleepTouched() {
        game.endTurn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(maxVillagerSize: VillagersButtons.count)
        for (index, villager) in game.villagers.enumerated() {
            ButtonsVillagersMap[VillagersButtons[index]] = villager
        }
    }
    
    func updateViewFromModel() {
        for (button, villager) in ButtonsVillagersMap {
            if game.deadVillagers.contains(villager) {
                button.backgroundColor = UIColor.red
            } else if game.healedVillagers.contains(villager) {
                button.backgroundColor = UIColor.green
            } else {
                button.backgroundColor = UIColor.blue
            }
        }
    }
}

