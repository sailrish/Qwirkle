//
//  Tile.swift
//  Qwirkle
//
//  Created by Sanya Arora on 1/21/25.
//

struct Tile {
    enum Shape: String, CaseIterable {
        case square = "Square",
             circle = "Circle",
             diamond = "Diamond",
             star4 = "4Star",
             star8 = "8Star",
             clover = "Clover"
    }
    enum Color: String, CaseIterable {
        case red = "red",
             blue = "blue",
             yellow = "yellow",
             green = "green",
             purple = "purple",
             orange = "orange"
    }
    
    let shapeSizes = [
                    Shape.star4: (95, 95),
                    Shape.square: (35, 35),
                    Shape.diamond: (55, 55),
                    Shape.circle: (40, 40),
                    Shape.star8: (45, 45),
                    Shape.clover: (50, 50)
                ]
    
    var shape: Shape
    var color: Color
    var width: Int = 50
    var height: Int = 50
    
    init(requestedShape: Shape, requestedColor: Color) {
        shape = requestedShape
        color = requestedColor
        (width, height) = (shapeSizes[requestedShape])!
    }
}
