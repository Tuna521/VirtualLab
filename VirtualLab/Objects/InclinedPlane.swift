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
    var angle: Double
    var length: Int
    var width: Int
    
    
    init (angle: Double, length: Int, width: Int, scene: SKScene, position: CGPoint){
        self.angle = angle
        self.length = length
        self.width = width
        let texture = SKTexture(imageNamed: "Grey")
        super.init(texture: texture, color: UIColor.clear, size: CGSize(width: length, height: width))
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: length, height: width))
        self.position = position
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.zRotation = CGFloat((CGFloat(angle) * CGFloat.pi)/180)
        let pinned = SKSpriteNode(imageNamed: "pin")
        pinned.physicsBody = SKPhysicsBody(texture: pinned.texture!,
                                           size: pinned.size)
        pinned.position = CGPoint(x: 0,y: 0)
        pinned.physicsBody?.pinned = true
 
        self.addChild(pinned)
 
        scene.addChild(self)
        
        //super.init(rectOf: CGSize(width: length, height: width))
        //super.init(rect: CGRect(x: point.x, y: point.y, width: CGFloat(length), height: CGFloat(width))))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
