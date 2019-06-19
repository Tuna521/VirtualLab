//
//  Block.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 3/7/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import Foundation
import SpriteKit

class Block: SKSpriteNode {
    static var widthInit:Int = 200
    static var heightInit:Int = 100
    static var xCoordinateInit:Int = 400
    static var yCoordinateInit:Int = 400
    static var colorInit:String = "brownBlock"
    var width: Int!
    var height: Int
    var blockPosition: CGPoint
    var blockTexture: SKTexture
    
    
    init(width: Int, height: Int, scene: SKScene, position: CGPoint) {
        
        self.width = width
        self.height = height
        self.blockPosition = position
        self.blockTexture = SKTexture(imageNamed: "greyBlock")
        super.init(texture: blockTexture, color: UIColor.clear, size: CGSize(width: width, height: height))
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: height))
        self.position = position
        self.texture = self.blockTexture
        scene.addChild(self)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTexture (texture: String){
        self.blockTexture = SKTexture(imageNamed: texture)
        self.texture = self.blockTexture
    }
    
    //SET
    
}
