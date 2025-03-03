//
//  GameScene.swift
//  Qwirkle
//
//  Created by Sanya Arora on 1/14/25.
//

import SpriteKit

class GameScene: SKScene {
    
    var cameraNode: SKCameraNode!
    
    let colors = [UIColor.red, UIColor.blue, UIColor.purple, UIColor.yellow, UIColor.orange, UIColor.green]
    var displayBoard: DisplayBoardType = .init()
    
    var gameBag: Bag = .init()
    var computerRack: TileRackType = .init()
    var playerRack: TileRackType = .init()
    var selectedPlayerTile: DisplayTileType? = nil
    
    let playerRackBox = SKShapeNode(rectOf: CGSize(width: 750, height: 135))
    
    override func didMove(to view: SKView) {
        cameraNode = SKCameraNode()
        self.addChild(cameraNode)
        self.camera = cameraNode
        
        self.computerRack = TileRackType(bag: self.gameBag)
        self.playerRack = TileRackType(bag: self.gameBag)
        
        playerRackBox.position = CGPoint(x: 0, y: -480)
        playerRackBox.fillColor = .lightGray
        addChild(playerRackBox)
        
        displayPlayerRack()
    }
    
    func displayTile(tile: TileType, center: CGPoint, parent: SKNode) {
        let newTile = DisplayTileType(inputTile: tile, location: center)
        parent.addChild(newTile)
    }
    
    func displayPlayerRack() {
        for i in 0...playerRack.MAX_NUMBER_OF_TILES - 1 {
            let tile = playerRack.tiles[i]
            
            if tile != nil {
                let x = displayBoard.MINX + 100 + displayBoard.TILESIZE * Double(i)
                displayTile(tile: tile!, center: CGPoint(x: CGFloat(x), y: 20), parent: playerRackBox)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let clickLocation = touch.location(in: self)
        
        
        
        let nodes = self.nodes(at: clickLocation)
        if nodes.count == 0 {
            // do this when player clicks on game board
            let tileLocation = displayBoard.determinPositionToSnap(clickLocation: clickLocation)
            let (row, column) = displayBoard.determineRowAndColumn(clickLocation: clickLocation)
            if selectedPlayerTile != nil {
                let pickedTile = selectedPlayerTile!.tile
                let wasTilePlaced = displayBoard.placeTile(tile: pickedTile!, row: row, column: column)
                if wasTilePlaced {
                    displayTile(tile: pickedTile!, center: tileLocation, parent: self)
                    playerRackBox.removeChildren(in: [selectedPlayerTile!])
                    selectedPlayerTile = nil
                }
            }
        }
            
        else {
            // do this when player clicks on tile rack
            for node in nodes {
                let displayTile = node as? DisplayTileType
                if displayTile != nil {
                    selectedPlayerTile = displayTile
                }
            }
        }
    }
}
