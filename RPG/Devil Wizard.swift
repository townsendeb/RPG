//
//  Devil Wizard.swift
//  RPG
//
//  Created by Eric Townsend on 1/17/16.
//  Copyright © 2016 KrimsonTech. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Magic Wand","Dark Amulet","Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}