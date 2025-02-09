//
//  TileGroupType.swift
//  Qwirkle
//
//  Created by Rishi Arora on 2/8/25.
//

import SpriteKit

class TileGroupType : SKNode {
    var numTiles:Int = 0
    
    func addTile(tile: TileType) {
        let newTile = DisplayTileType(tile: tile, center: CGPoint(x: 70*numTiles, y:0))
        addChild(newTile)
        numTiles += 1
    }
}
