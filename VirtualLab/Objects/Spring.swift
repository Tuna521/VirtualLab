//
//  Spring.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 3/14/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import UIKit
import SpriteKit

class Spring: SKSpriteNode{
    static var attachObjectInit:String = "Ball"
    static var xCoordinateInit: Int = 250
    static var yCoordinateTopInit: Int = 500
    static var yCoordinateBottomInit: Int = 200
    static var frequencyInit: CGFloat = 0.8
    static var dampingInit: CGFloat = 0.1
    
    var springPicture: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "spring"), color: UIColor.clear, size: CGSize(width: 44, height: 150))
    
    var staticNode: SKSpriteNode = SKSpriteNode(color: UIColor.clear, size: CGSize(width: 1, height: 1))
    var dynamicNode: SKSpriteNode = SKSpriteNode(color: UIColor.clear, size: CGSize(width: 1, height: 1))
    
    init(object: String, xCoordinate: Int, yCoordinateTop: Int, yCoordinateBottom: Int, frequency: CGFloat, damping: CGFloat, scene: SKScene) {
        super.init(texture:nil, color: UIColor.clear, size: CGSize.zero)

        
        //CREATING THE TOP ANCHOR
        staticNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: 1))
        staticNode.physicsBody?.isDynamic = false
        staticNode.position = CGPoint(x: xCoordinate, y: yCoordinateTop)
        
        //CREATING THE ATTACHING OBJECT
        if (object == "Ball"){
            dynamicNode = Ball(radius: Ball.radiusInit, scene: scene, mass: Ball.massInit, position:  CGPoint(x: xCoordinate, y: yCoordinateBottom))
        }
        if (object == "Block"){
            dynamicNode = Block(width: Block.widthInit, height: Block.heightInit, scene: scene, mass: Block.massInit, position: CGPoint(x: xCoordinate, y: yCoordinateBottom))
        }
        dynamicNode.name = "draggableSpring"
        
        //dynamicNode.anchorPoint = CGPoint(x: 0.5, y: 1)

        scene.addChild(staticNode)
        //scene.addChild(dynamicNode)
        
        let spring = SKPhysicsJointSpring.joint(withBodyA: staticNode.physicsBody!,
        bodyB: dynamicNode.physicsBody!,
        anchorA: staticNode.position,
        anchorB: dynamicNode.position)
        
        spring.frequency = frequency
        spring.damping = damping
        
        scene.physicsWorld.add(spring)
        
        springPicture.position = CGPoint(x: xCoordinate, y: yCoordinateTop)
        springPicture.anchorPoint = CGPoint(x: 0.5, y: 1)
    
        scene.addChild(springPicture)
        //let move = SKAction.moveBy(x:0, y: 200, duration: 1)
        //staticNode.run(move)
    
    }

    func yChange()-> CGPoint{
        return dynamicNode.position;
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

