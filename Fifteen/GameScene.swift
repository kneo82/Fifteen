//
//  GameScene.swift
//  Fifteen
//
//  Created by Voronok Vitaliy on 11/13/15.
//  Copyright (c) 2015 IDPGroup. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

//    let background: SKNode
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }

    override init(size: CGSize) {
        super.init(size: size)
        
//        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(color: SKColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0), size: frame.size)
        background.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame))
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = -1
        addChild(background)
        
        let texture = SKTexture(imageNamed: "Background2.jpg")
        let board = SKSpriteNode(texture: texture, size: CGSize(width: size.width, height: size.width))
        board.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame))
        board.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        board.zPosition = 0
        addChild(board)
        
        let blockWidth = size.width / 4.0
        let blockSize = CGSize(width: blockWidth, height: blockWidth)
        
        for index in 0 ..< 16 {
            let spriteTexture = SKTexture(imageNamed: "Texture_\(index != 15 ? index+1 : 0).png")
            let sprite = SKSpriteNode(texture: spriteTexture, size: blockSize)
            
            sprite.anchorPoint = CGPoint(x: 0.0, y: 1.0)
            let position = CGPoint(x: -Int(size.width) / 2 + Int(blockWidth) * (index % 4), y: Int(size.width) / 2 - Int(blockWidth) * (index / 4))
            sprite.position = position
            
            board.addChild(sprite)
        }
        
//        let node = SKLabelNode(text: "Hello World")
//        node.fontColor = SKColor.redColor()
//        node.fontSize = 50.0
//        node.fontName = "AvenirNext-Regular"
//        
//        node.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
//        node.zPosition = 5
//        addChild(node)
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
