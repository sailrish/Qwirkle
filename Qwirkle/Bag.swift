//
//  Bag.swift
//  Qwirkle
//
//  Created by Sanya Arora on 1/21/25.
//

struct Bag {
    var tiles: [Tile] = []
    let numberOfTileOfTheSameColorAndShape = 3
    
    init() {
        for shape in Tile.Shape.allCases {
            for color in Tile.Color.allCases {
                for _ in 1...numberOfTileOfTheSameColorAndShape {
                    let newTile = Tile(requestedShape: shape, requestedColor: color)
                    tiles.append(newTile)
                }
            }
        }
    }
    
    mutating func pickRandom() -> Tile {
        let randomInt = Int.random(in: 0...tiles.count - 1)
        return tiles.remove(at: randomInt)
    }
}
