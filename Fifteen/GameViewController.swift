//
//  GameViewController.swift
//  Fifteen
//
//  Created by Voronok Vitaliy on 11/13/15.
//  Copyright (c) 2015 IDPGroup. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    var scene: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the view.
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        skView.showsFPS = true
        
        // Create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        // Present the scene.
        skView.presentScene(scene)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
