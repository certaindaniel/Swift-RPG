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
    
    var player = Combatant(plistName: "Xavi")
    var enemy  = Combatant(plistName: "Rabid Dog")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshViews()
    }
    
    func refreshViews() {
        let format = ".2"
        
        playerNameLabel.text = player.name
        playerHealthBar.progress = player.curHP
        playerHealthLabel.text = "\((player.curHP * 100).format(format))%"
        
        enemyNameLabel.text = enemy.name
        enemyHealthBar.progress = enemy.curHP
        enemyHealthLabel.text = "\((enemy.curHP * 100).format(format))%"
    }
    
    enum Action {
        case Strike
        case Escape
    }
    var playerAction = Action.Strike
    var enemyAction = Action.Strike
    
    @IBAction func strike() {
        playerAction = .Strike
        resolveTurn()
    }
    
    @IBAction func escape() {
        playerAction = .Escape
        resolveTurn()
    }
    
    func chooseEnemyAction() {
        enemyAction = .Strike
    }
    
    func resolveTurn() {
        chooseEnemyAction()
        combatant(player, performAction: playerAction, toCombatant: enemy)
        combatant(enemy, performAction: enemyAction, toCombatant: player)
        refreshViews()
    }
    
    func combatant(actor:Combatant, performAction action:Action, toCombatant target:Combatant) {
        switch action {
        case .Strike:
            combatant(actor, attacks: target)
        case .Escape:
            let alert = UIAlertController(title: "failed", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func combatant(aggressor:Combatant, attacks target:Combatant) {
        let result = aggressor.takeDmg(aggressor.pow - target.def)
        if result == .Died {
            let alert = UIAlertController(title: "\(target.name) is dead", message: nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }
}
