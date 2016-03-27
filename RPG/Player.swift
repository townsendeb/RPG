//
//  Player.swift
//  RPG
//
//  Created by Eric Townsend on 1/17/16.
//  Copyright © 2016 KrimsonTech. All rights reserved.
//

import Foundation


class Player: Character {
     private var _name = "Player"
     private var _inventory = [String]()
    
    var name: String {
        return _name
    }
    
    var inventory: [String] {
        return _inventory
    }
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp:hp, attackPwr: attackPwr)
        
        _name = name
    }
}