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
        let newTile = DisplayTileType(tile: tile, center: center)
        parent.addChild(newTile)
    }
    
    func displayPlayerRack() {
        let tileGroup: TileGroupType = .init()
        for i in 0...playerRack.MAX_NUMBER_OF_TILES - 1 {
            let tile = playerRack.tiles[i]
            if tile != nil {
                tileGroup.addTile(tile: tile!)
            }
        }
        tileGroup.position = CGPoint(x: -175, y: 30)
        playerRackBox.addChild(tileGroup)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let clickLocation = touch.location(in: self)
        
        let tileLocation = displayBoard.determinPositionToSnap(clickLocation: clickLocation)
        let (row, column) = displayBoard.determineRowAndColumn(clickLocation: clickLocation)
        
        let pickedTile = gameBag.pickRandom()
        let wasTilePlaced = displayBoard.placeTile(tile: pickedTile, row: row, column: column)
        if wasTilePlaced {
            let newTile = DisplayTileType(tile: pickedTile, center: tileLocation)
            addChild(newTile)
        }
        
        
    }
}
