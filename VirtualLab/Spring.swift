//
//  Spring.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 3/14/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import Foundation
import SpriteKit



 class Spring: SKSpriteNode{
    //SKSpriteNode(imageNamed: "spring")
    //spring.anchorPoint = CGPoint(x: 0, y: 1)
    //addChild(spring)
    //var time: Double = 0.0
    
    init(scene: SKScene, SpringPosition: CGPoint) {
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: 44, height: 150))
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 44, height: 150), center: CGPoint(x: 22, y: -75))
        //self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.texture = SKTexture(imageNamed: "spring")
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = SpringPosition
        scene.addChild(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    func move(){
        time = time+0.1
        self.yScale = CGFloat(sin(3 * time) + 1.5)
    }
    */
    
    func attachBody(_ body: SKSpriteNode) {
        // set up connecting joint
        let joint = SKPhysicsJointPin.joint(withBodyA: self.physicsBody!,
                                            bodyB: body.physicsBody!, anchor: CGPoint(x: 0.5, y: 0))
        body.scene?.physicsWorld.add(joint)
    }
}

