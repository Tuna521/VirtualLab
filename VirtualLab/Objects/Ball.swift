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
    static var radiusInit:Int = 50
    static var xCoordinateInit:Int = 200
    static var yCoordinateInit:Int = 200
    static var colorInit:String = "redBall"
    var ballRadius: Int!
    var ballPosition: CGPoint
    var ballTexture: SKTexture
   
    
    init(radius: Int, scene: SKScene, position: CGPoint) {
        
        self.ballRadius = radius
        self.ballPosition = position
        self.ballTexture = SKTexture(imageNamed: "goldBall")
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: radius*2, height: radius*2))
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(radius))
        self.position = position
        self.texture = self.ballTexture
        scene.addChild(self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTexture (texture: String){
        self.ballTexture = SKTexture(imageNamed: texture)
        self.texture = self.ballTexture
    }

    //SET
    
}
