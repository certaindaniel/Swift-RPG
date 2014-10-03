//
//  FightViewController.swift
//  Simple RPG
//
//  Created by Xavi Matos on 9/17/14.
//  Copyright (c) 2014 Xavi Matos. All rights reserved.
//

import UIKit

class FightViewController: UIViewController {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerHealthBar: UIProgressView!
    @IBOutlet weak var playerHealthLabel: UILabel!
    
    @IBOutlet weak var enemyNameLabel: UILabel!
    @IBOutlet weak var enemyHealthBar: UIProgressView!
    @IBOutlet weak var enemyHealthLabel: UILabel!
    
    @IBOutlet weak var strikeButton: UIButton!
    @IBOutlet weak var strikeOutcomeLabel: UILabel!
    @IBOutlet weak var strikeOutcomeExplainButton: UIButton!
    
    @IBOutlet weak var escapeButton: UIButton!
    @IBOutlet weak var escapeOutcomeLabel: UILabel!
    @IBOutlet weak var escapeOutcomeExplainButton: UIButton!
    
    var player = Combatant(name: "Xavi")
    var enemy = Combatant(name: "Devil")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshViews()
    }
    
    func refreshViews() {
        playerNameLabel.text = player.name
        playerHealthBar.progress = player.curHP / player.maxHP
        playerHealthLabel.text = "\(player.curHP) / \(player.maxHP)"
        
        enemyNameLabel.text = enemy.name
        enemyHealthBar.progress = enemy.curHP / enemy.maxHP
        enemyHealthLabel.text = "\(enemy.curHP) / \(enemy.maxHP)"
    }
    
    enum Action {
        case Strike
        case Escape
    }
    var playerAction = Action.Strike
    var enemyAction = Action.Strike
    
    @IBAction func strike() {
        self.playerAction = .Strike
        self.resolveTurn()
    }
    
    @IBAction func escape() {
        self.playerAction = .Escape
        self.resolveTurn()
    }
    
    func chooseEnemyAction() {
        self.enemyAction = .Strike
    }
    
    func resolveTurn() {
        self.chooseEnemyAction()
        self.combatant(player, performAction: playerAction, toCombatant: enemy)
        self.combatant(enemy, performAction: enemyAction, toCombatant: player)
        self.refreshViews()
    }
    
    func combatant(activeCombatant:Combatant, performAction action:Action, toCombatant targetCombatant:Combatant) {
        switch action {
        case .Strike:
            targetCombatant.takeDmg(activeCombatant.pow - targetCombatant.def)
        case .Escape:
            UIAlertView(title: "failed", message: nil, delegate: nil, cancelButtonTitle: nil)
        }
    }
}
