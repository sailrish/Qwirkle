//
//  DisplayTileType.swift
//  Qwirkle
//
//  Created by Sanya Arora on 2/16/25.
//
import SpriteKit

class DisplayTileType: SKShapeNode {
    var tile: TileType? = nil
    
    convenience init(inputTile: TileType, location: CGPoint) {
        self.init(rectOf: CGSize(width: 69, height: 69))
        self.tile = inputTile
        
        self.position = location
        self.fillColor = .black
        self.strokeColor = .white
        self.lineWidth = 1

        let imageName = "\(tile!.color.rawValue)\(tile!.shape.rawValue)"
        let tileShown = SKSpriteNode(imageNamed: imageName)
        tileShown.size = CGSize(width: tile!.width, height: tile!.height)
        self.addChild(tileShown)
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
