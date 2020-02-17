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
    static var massInit: CGFloat = 2
    static var colorInit:String = "brownBlock"

    init(scene: SKScene){
        super.init(texture: SKTexture(imageNamed: Block.colorInit), color: UIColor.clear, size: CGSize(width: Block.widthInit, height: Block.heightInit))
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: Block.widthInit, height: Block.heightInit))
        self.physicsBody?.mass = Block.massInit
        self.position = CGPoint(x: Block.xCoordinateInit, y: Block.yCoordinateInit)
        self.texture = SKTexture(imageNamed: Block.colorInit)
        self.name = "draggable"
        scene.addChild(self)
    }
    
    init(width: Int, height: Int, scene: SKScene, mass: CGFloat, position: CGPoint, color: String) {
        
        super.init(texture: SKTexture(imageNamed: "greyBlock"), color: UIColor.clear, size: CGSize(width: width, height: height))
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: height))
        self.physicsBody?.mass = mass
        self.position = position
        self.texture = SKTexture(imageNamed: color)
        self.name = "draggable"
        scene.addChild(self)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTexture (texture: String){
        self.texture = SKTexture(imageNamed: texture)
    }
    
    //SET
    
}
