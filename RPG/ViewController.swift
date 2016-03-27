//
//  ViewController.swift
//  RPG
//
//  Created by Eric Townsend on 1/17/16.
//  Copyright © 2016 KrimsonTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerHpLabel: UILabel!
    @IBOutlet weak var enemyHpLabel: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var chestButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player = Player(name: "Player 1", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHpLabel.text = "\(player.hp) HP"
        enemyHpLabel.text = "\(enemy.hp) HP"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
            
        } else {
            enemy = DevilWizard(startingHp: 60,attackPwr: 15)
        }
        
        enemyImage.hidden = false
        enemyHpLabel.text = "\(enemy.hp) HP"
    }
    
    @IBAction func clickChest(sender: AnyObject) {
        chestButton.hidden = true
        topLabel.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    
    }
    
    @IBAction func clickAttack(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            topLabel.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLabel.text = "\(enemy.hp) HP"
        } else {
            topLabel.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
            
        }
        
        if !enemy.isAlive {
            enemyHpLabel.text = ""
            topLabel.text = "Killed \(enemy.type)"
            enemyImage.hidden = true
        }
    }

}

