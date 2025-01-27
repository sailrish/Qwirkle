//
//  GameScene.swift
//  Qwirkle
//
//  Created by Sanya Arora on 1/14/25.
//

import SpriteKit

class GameScene: SKScene {
    
    let colors = [UIColor.red, UIColor.blue, UIColor.purple, UIColor.yellow, UIColor.orange, UIColor.green]
    var displayBoard: DisplayBoardType = .init()
    
    override func didMove(to view: SKView) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let clickLocation = touch.location(in: self)
        
        var gameBag = Bag()
        
        let tileLocation = displayBoard.determinPositionToSnap(clickLocation: clickLocation)
        
        
        let pickedTile = gameBag.pickRandom()
        let imageName = "\(pickedTile.color.rawValue)\(pickedTile.shape.rawValue)"
        let tileShown = SKSpriteNode(imageNamed: imageName)
        tileShown.size = CGSize(width: pickedTile.width, height: pickedTile.height)
        tileShown.position = tileLocation
        tileShown.zPosition = 1
        addChild(tileShown)
                    
        let tile = SKShapeNode(rectOf: CGSize(width: 69, height: 69))
        tile.position = tileLocation
        tile.fillColor = .black
        tile.strokeColor = .white
        tile.lineWidth = 1
        addChild(tile)
    }
}
