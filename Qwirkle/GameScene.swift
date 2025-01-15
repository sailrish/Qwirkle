//
//  GameScene.swift
//  Qwirkle
//
//  Created by Sanya Arora on 1/14/25.
//

import SpriteKit

class GameScene: SKScene {
    
    let colors = [UIColor.red, UIColor.blue, UIColor.purple, UIColor.yellow, UIColor.orange, UIColor.green]
    
    override func didMove(to view: SKView) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        var location = touch.location(in: self)
        
        var gameBag = Bag()
        
        
        for _ in 1...6 {
            let pickedTile = gameBag.pickRandom()
            let imageName = "\(pickedTile.color.rawValue)\(pickedTile.shape.rawValue)"
            let tileShown = SKSpriteNode(imageNamed: imageName)
            tileShown.size = CGSize(width: pickedTile.width, height: pickedTile.height)
            location.x = location.x + CGFloat(70)
            tileShown.position = location
            tileShown.zPosition = 1
            addChild(tileShown)
                        
            // main black tile
            let tile = SKSpriteNode(imageNamed: "mainBlackTile")
            tile.position = location
            tile.size = CGSize(width: 65, height: 65)
            addChild(tile)
        }
    }
}
