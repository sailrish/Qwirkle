//
//  DisplayTileType.swift
//  Qwirkle
//
//  Created by Rishi Arora on 2/8/25.
//

import SpriteKit

class DisplayTileType : SKShapeNode {
    convenience init(tile: TileType, center: CGPoint) {
        self.init(rectOf: CGSize(width: 69, height: 69))
        position = center
        fillColor = .black
        strokeColor = .white
        lineWidth = 1
        
        let imageName = "\(tile.color.rawValue)\(tile.shape.rawValue)"
        let tileShown = SKSpriteNode(imageNamed: imageName)
        tileShown.size = CGSize(width: tile.width, height: tile.height)
        addChild(tileShown)
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
