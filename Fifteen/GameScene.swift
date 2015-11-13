//
//  GameScene.swift
//  Fifteen
//
//  Created by Voronok Vitaliy on 11/13/15.
//  Copyright (c) 2015 IDPGroup. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    // MARK: -
    // MARK: Life Cycle

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        let node = SKLabelNode(text: "Hello World")
        node.fontColor = SKColor.redColor()
        node.fontSize = 50.0
        node.fontName = "AvenirNext-Regular"

        node.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
       
        addChild(node)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
