//
//  MainMenuViewController.swift
//  Simple RPG
//
//  Created by Xavi Matos on 9/17/14.
//  Copyright (c) 2014 Xavi Matos. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var characterButton: UIButton!
    @IBOutlet weak var fightButton: UIButton!
    @IBOutlet weak var shopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main Menu"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func presentFightPage() {
        self.navigationController!.pushViewController(FightViewController(nibName: "FightView", bundle: nil), animated: true)
    }

    @IBAction func showDebugAlert(button:UIButton) {
        UIAlertView(title: button.currentTitle, message: nil, delegate: nil, cancelButtonTitle: "copy that").show()
    }
}
