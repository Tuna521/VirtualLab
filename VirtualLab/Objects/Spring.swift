//
//  Spring.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 3/14/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import Foundation
import SpriteKit



 import UIKit
 import SpriteKit
 class MySpring: SKSpriteNode {
     var sizeSpring:CGSize
     var node: SKSpriteNode
     override init(texture: SKTexture?, color: UIColor, size: CGSize) {
         self.sizeSpring = size
         self.node = SKSpriteNode()
         super.init(texture: texture, color: color, size: size)
        
     }
     func create()->SKSpriteNode {
         var rect = SKShapeNode(rect: CGRect(x: 0, y: 0, width: sizeSpring.width, height: sizeSpring.height))
         rect.fillColor = UIColor.green
         node.addChild(rect)
         return node
     }
     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
 }


 class Spring: SKSpriteNode{
     static var initSizeA: Int = 50
     static var initSizeB: Int = 30
     static var initCoordinateXA = 250
     static var initCoordinateYA = 500
     static var initCoordinateXB = 250
     static var initCoordinateYB = 300
     static var initFrequency = 0.8
     static var initDamping = 0.1
     var staticNode: SKSpriteNode = SKSpriteNode(color: .red, size: CGSize(width: Spring.initSizeA, height: Spring.initSizeA))
     var dynamicNode: SKSpriteNode = SKSpriteNode(color: .blue, size: CGSize(width: Spring.initSizeB, height: Spring.initSizeB))
     
    init(sizeA: CGSize, sizeB: CGSize, positionA: CGPoint, positionB: CGPoint, frequency: CGFloat, damping: CGFloat, scene: SKScene) {
     //init(texture: SKTexture?, color: UIColor, size: CGSize)
     super.init(texture:nil, color: UIColor.clear, size: CGSize.zero)
         
         staticNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: Spring.initSizeA, height: Spring.initSizeA))
         staticNode.physicsBody?.isDynamic = false
         staticNode.position = positionA
         
         dynamicNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: Spring.initSizeB, height: Spring.initSizeB))
         dynamicNode.position = positionB
         dynamicNode.name = "draggableSpring"
         
         scene.addChild(staticNode)
         scene.addChild(dynamicNode)
         
         let spring = SKPhysicsJointSpring.joint(withBodyA: staticNode.physicsBody!,
         bodyB: dynamicNode.physicsBody!,
         anchorA: staticNode.position,
         anchorB: dynamicNode.position)
         
         spring.frequency = frequency
         spring.damping = damping
         
         scene.physicsWorld.add(spring)
         let move = SKAction.moveBy(x:0, y: 200, duration: 1)
         staticNode.run(move)
     
     }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
 }

