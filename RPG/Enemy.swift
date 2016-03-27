//
//  Enemy.swift
//  RPG
//
//  Created by Eric Townsend on 1/17/16.
//  Copyright © 2016 KrimsonTech. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return["Rusty Dagger","Cracked Buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
}