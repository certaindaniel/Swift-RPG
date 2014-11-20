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
    var curHP:Float = 1.0
    
    var pow:Float
    var def:Float
    
    class func plistFolderURL() -> NSURL {
        let folders = ["Resources", "Combatants"]
        var path = NSBundle.mainBundle().resourcePath!
        for folder in folders {
            path.stringByAppendingPathComponent(folder)
        }
        return NSURL(fileURLWithPath: path, isDirectory: true)!
    }
    
    init(var plistName:String) {
        if !plistName.hasSuffix(".plist") {
            plistName = plistName + ".plist"
        }
        let plistURL = NSURL(string: plistName, relativeToURL: Combatant.plistFolderURL())!
        let plist = NSDictionary(contentsOfURL: plistURL)! as Dictionary<String, AnyObject>
        
        self.name = plist["name"]            as String
        self.pow  = plist["pow"]!.floatValue as Float
        self.def  = plist["def"]!.floatValue as Float
    }
    
    enum DamageResult {
        case Hit
        case Dodged
        case Died
    }
    
    func takeDmg(dmg:Float) -> DamageResult {
        curHP -= dmg
        if curHP < 0 {
            curHP = 0
        }
        
        // TODO: implement dodging behavior
        switch curHP {
        case 0:
            return .Died
        case 0...Float.infinity:
            return .Hit
        default:
            raise(1) // should never happen ... i think
            return .Hit
        }
    }
}
