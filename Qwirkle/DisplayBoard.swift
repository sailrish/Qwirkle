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
    
    func determinPositionToSnap(clickLocation: CGPoint) -> CGPoint {
        let column = Int((clickLocation.x - MINX) / TILESIZE)
        let row = Int((clickLocation.y - MINY) / TILESIZE)
        let snapx = MINX + (TILESIZE / 2.0) + (TILESIZE * Double(column))
        let snapy = MINY + (TILESIZE / 2) + (TILESIZE * Double(row))
        let snapLocation = CGPoint(x: snapx, y: snapy)
        
        return snapLocation
    }
    
}
