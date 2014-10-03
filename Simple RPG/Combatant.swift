//
//  Combatant.swift
//  Simple RPG
//
//  Created by Xavi Matos on 10/2/14.
//  Copyright (c) 2014 Xavi Matos. All rights reserved.
//

import Foundation

class Combatant {
    var name:String
    var maxHP:Float = 10
    var curHP:Float = 10
    
    var pow:Float = 3
    var def:Float = 2
    var spd:Float = 3
    
    init(name:String) {
        self.name = name
    }
    
    func takeDmg(dmg:Float) {
        curHP -= dmg
    }
}
