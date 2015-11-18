//
//  BlockSprite.swift
//  Fifteen
//
//  Created by Voronok Vitaliy on 11/16/15.
//  Copyright © 2015 IDPGroup. All rights reserved.
//

import SpriteKit

let durationAnimation = 0.25

class BlockSprite: SKSpriteNode {
    
    let textureName: String
    let boardSize: CGSize
    let index: Int
    let model: GameModel
    
    var elementPosition: CGPoint {
        get {
            let x = ((boardSize.width / 2.0) + position.x) / size.width
            let y = ((boardSize.height / 2.0) - position.y - size.height) / size.height
            print("row: \(y) column: \(x)")
            return CGPoint(x: x, y: y)
        }
        
        set {
            setPosition(Int(newValue.y), column: Int(newValue.x), animated: false)
        }
    }

    required init(index: Int, size: CGSize, boardSize: CGSize, gameModel: GameModel) {
        let sizeSprite = CGSize( width: size.width - 2.0, height: size.height - 2.0)
        self.boardSize = boardSize
        self.index = index
        self.model = gameModel
        
        textureName = "Texture_\(index).png"
        
        super.init(texture: nil, color: UIColor.clearColor(), size: size)
        
        self.anchorPoint = CGPoint(x: 0, y: 0)

        let sprite = SKSpriteNode(texture: index == 0 ? nil : SKTexture(imageNamed: textureName), size: sizeSprite)
        
        sprite.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        sprite.position = CGPoint( x: 1, y: 1)
        
        self.addChild(sprite)
        
        self.userInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let curentPosition = self.elementPosition
        
        if model.canMove(Int(curentPosition.y), column: Int(curentPosition.x)) {
            let newPosition = model.emptyBlock
            
            model.moveBlock(Int(curentPosition.y), column: Int(curentPosition.x))
            setPosition(newPosition.row, column: newPosition.column, animated: true)
        }
    }
    
    func setPosition(row: Int, column: Int, animated: Bool) {
        let duration = animated ? durationAnimation : 0.0;
        
        let x = -(boardSize.width / 2.0) + CGFloat(column) * size.width
        let y = +(boardSize.height / 2.0) - CGFloat(row) * size.height - size.height
        
        let action = SKAction.sequence([SKAction.moveTo(CGPoint(x: x, y: y), duration: duration), SKAction.runBlock({ () -> Void in
            self.position = CGPoint(x: x, y: y)
        })])
        
        self.runAction(action)
    }
}
