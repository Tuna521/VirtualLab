//
//  Ball.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 2/27/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import Foundation
import SpriteKit

class Ball: SKSpriteNode {
    static var radiusInit:Int = 25
    static var xCoordinateInit:Int = 200
    static var yCoordinateInit:Int = 200
    static var massInit: CGFloat = 0.5
    static var colorInit:String = "redBall"

   
    init(scene:SKScene){
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: Ball.radiusInit*2, height: Ball.radiusInit*2))
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(Ball.radiusInit))
        self.physicsBody?.mass = Ball.massInit
        self.position = CGPoint(x: Ball.xCoordinateInit, y: Ball.yCoordinateInit)
        self.texture = SKTexture(imageNamed: Ball.colorInit)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.name = "draggable"
        scene.addChild(self)
    }
    
    init(radius: Int, scene: SKScene, mass: CGFloat, position: CGPoint, color: String) {
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: radius*2, height: radius*2))
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(radius))
        self.physicsBody?.mass = mass
        self.position = position
        self.texture = SKTexture(imageNamed: color)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
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
