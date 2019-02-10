//
//  Villager.swift
//  The Healer
//
//  Created by Pablo Terradillos on 09/02/2019.
//  Copyright © 2019 Alidion. All rights reserved.
//

import Foundation

struct Villager: Equatable {
    static var ID = 0
    let id: Int;
    init() {
        id = Villager.ID
        Villager.ID += 1
    }
}
