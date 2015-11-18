//
//  GameScene.swift
//  Fifteen
//
//  Created by Voronok Vitaliy on 11/13/15.
//  Copyright (c) 2015 IDPGroup. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    let model: GameModel
    var board: SKSpriteNode
//    let background: SKNode
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }

    override init(size: CGSize) {
        model = GameModel(rows: 10, columns: 10)
        
        let texture = SKTexture(imageNamed: "Background2.jpg")
        let board = SKSpriteNode(texture: texture, size: CGSize(width: size.width, height: size.width))
        board.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
        board.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        board.zPosition = 0
        
        self.board = board
        
        super.init(size: size)
        
        let background = SKSpriteNode(color: SKColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0), size: frame.size)
        background.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame))
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = -1
        addChild(background)
        
        addChild(board)

        fillBoard()
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if model.isWin {
            print("WINNNN !!!!!")
            
            model.shuflle()
            
            fillBoard()
        }
    }
    
    func fillBoard() {
        board.removeAllChildren()
        
        let blockWidth = size.width / CGFloat(model.columns)
        let blockSize = CGSize(width: blockWidth, height: blockWidth)
        
        for row in 0..<model.rows {
            for column in 0..<model.columns {
                let index = model.boardModel[row, column]
                if index == 0 {
                    continue
                }
                
                let blockSprite = BlockSprite(index: index, size: blockSize, boardSize: board.size, gameModel: model)
                blockSprite.elementPosition = CGPoint(x: column, y: row)
                
                board.addChild(blockSprite)
            }
        }
    }
}
