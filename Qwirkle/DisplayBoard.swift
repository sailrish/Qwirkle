//
//  DisplayBoard.swift
//  Qwirkle
//
//  Created by Sanya Arora on 1/26/25.
//

import SwiftUI

struct DisplayBoardType {
    let MINX: Double = -375.0
    let MAXX: Double = 375.0
    let MINY: Double = -667.0
    let MAXY: Double = 667.0
    let TILESIZE: Double = 70
    let TOTAL_NUMBER_OF_TILES: Int = 108
    var squares = [[TileType?]]()
    
    init() {
        let rowOfSquares = [TileType?](repeating: nil, count: TOTAL_NUMBER_OF_TILES)
        squares = [[TileType?]](repeating: rowOfSquares, count: TOTAL_NUMBER_OF_TILES)
    }
    
    mutating func placeTile(tile: TileType, row: Int, column: Int) -> Bool {
        if row < TOTAL_NUMBER_OF_TILES && column < TOTAL_NUMBER_OF_TILES && squares[row][column] == nil {
            squares[row][column] = tile
            return true
        } else {
            return false
        }
    }
    
    func determinPositionToSnap(clickLocation: CGPoint) -> CGPoint {
        let column = Int((clickLocation.x - MINX) / TILESIZE)
        let row = Int((clickLocation.y - MINY) / TILESIZE)
        let snapx = MINX + (TILESIZE / 2) + (TILESIZE * Double(column))
        let snapy = MINY + (TILESIZE / 2) + (TILESIZE * Double(row))
        let snapLocation = CGPoint(x: snapx, y: snapy)
        
        return snapLocation
    }
}
