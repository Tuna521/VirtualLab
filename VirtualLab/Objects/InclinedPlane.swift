//
//  InclinedPlane.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 3/6/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import Foundation
import SpriteKit

class InclinedPlane: SKSpriteNode{
    static var angleInit:Double = 10.0
    static var lengthInit:Int = 400
    static var widthInit:Int = 30
    static var xCoordinateInit:Int = 300
    static var yCoordinateInit:Int = 300
    static var frictionInit: CGFloat = 0.2 //0.0 to 1.0
    
   
    init (scene: SKScene){
        super.init(texture: SKTexture(imageNamed: "greyBlock"), color: UIColor.clear, size: CGSize(width: InclinedPlane.lengthInit, height: InclinedPlane.widthInit))
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: InclinedPlane.lengthInit, height: InclinedPlane.widthInit))
        self.physicsBody?.friction = InclinedPlane.frictionInit
        self.position =  CGPoint(x: InclinedPlane.xCoordinateInit, y: InclinedPlane.yCoordinateInit)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.zRotation = CGFloat((CGFloat(InclinedPlane.angleInit) * CGFloat.pi)/180)
        scene.addChild(self)
    }
    
    init (angle: Double, length: Int, width: Int, scene: SKScene, friction: CGFloat, position: CGPoint){
        super.init(texture: SKTexture(imageNamed: "greyBlock"), color: UIColor.clear, size: CGSize(width: length, height: width))
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: length, height: width))
        self.physicsBody?.friction = friction
        self.position = position
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.zRotation = CGFloat((CGFloat(angle) * CGFloat.pi)/180)
        
        scene.addChild(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
