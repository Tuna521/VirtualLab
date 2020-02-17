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
    
    //Instance variables
    //The initial value of the object
    static var attachObjectInit:String = "Ball"
    static var xCoordinateInit: Int = 250
    static var yCoordinateTopInit: Int = 700
    static var yCoordinateBottomInit: Int = 600
    static var frequencyInit: CGFloat = 0.8
    static var dampingInit: CGFloat = 0.1
    
    //staticNode is the top achorpoint of the spring (where it would be static)
    //dynamicNode is the attached object at the bottom of the spring. This is the default value, will be changed to the type of the object attached
    var staticNode: SKSpriteNode = SKSpriteNode(color: UIColor.clear, size: CGSize(width: 1, height: 1))
    var dynamicNode: SKSpriteNode = SKSpriteNode(color: UIColor.clear, size: CGSize(width: 1, height: 1))
    
    //Constuctors
    //Constructor that uses only scene to not rewrite static variables
    init (scene: SKScene){
        //spring itself is the picture of a spring
        //assinging the name Spring, so the scene can use update to change the size of the picture according to position
        super.init(texture: SKTexture(imageNamed: "spring"), color: UIColor.clear, size: CGSize(width: 44, height: 150))
        self.name = "Spring"
            
        //Creating the physicsBody for the staticNode so it can interact with the object
        //staticNode should be as the name suggested static, so not dynamic
        staticNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: 1))
        staticNode.physicsBody?.isDynamic = false
        staticNode.position = CGPoint(x: Spring.xCoordinateInit, y: Spring.yCoordinateTopInit)
            
        //Creating the dynamicNode by considering the type of attached object
        //We are not using the Class(scene: scene) because we need to modify the position
        if (Spring.attachObjectInit == "Ball"){
            dynamicNode = Ball(radius: Ball.radiusInit, scene: scene, mass: Ball.massInit, position:  CGPoint(x: Spring.xCoordinateInit, y: Spring.yCoordinateBottomInit), color: Ball.colorInit)
        }
        if (Spring.attachObjectInit == "Block"){
            dynamicNode = Block(width: Block.widthInit, height: Block.heightInit, scene: scene, mass: Block.massInit, position: CGPoint(x: Spring.xCoordinateInit, y: Spring.yCoordinateBottomInit), color: Block.colorInit)
        }
        
        //Assigning it a name so touch can only drag it up and down
        //Adding to the scene only staticNode, since the dynamicNode has already been added in their class initialization
        dynamicNode.name = "draggableSpring"
        scene.addChild(staticNode)

        //Creating the joining force between the two object to create spring like motion
        let spring = SKPhysicsJointSpring.joint(withBodyA: staticNode.physicsBody!,
        bodyB: dynamicNode.physicsBody!,
        anchorA: staticNode.position,
        anchorB: dynamicNode.position)
        
        //giving the motion frequency and damping
        spring.frequency = Spring.frequencyInit
        spring.damping = Spring.dampingInit
        
        //add this motion and connect everything
        scene.physicsWorld.add(spring)
        
        //adding position to the picture itself
        //achorPoint should be changed so that it can be mimic the motion
        self.position = CGPoint(x: Spring.xCoordinateInit, y: Spring.yCoordinateTopInit)
        self.anchorPoint = CGPoint(x: 0.5, y: 1)
        scene.addChild(self)
    }
    
    //constructor if the parameter is different
    init(object: String, xCoordinate: Int, yCoordinateTop: Int, yCoordinateBottom: Int, frequency: CGFloat, damping: CGFloat, scene: SKScene) {
        super.init(texture: SKTexture(imageNamed: "spring"), color: UIColor.clear, size: CGSize(width: 44, height: 150))
        self.name = "Spring"
        
        staticNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: 1))
        staticNode.physicsBody?.isDynamic = false
        staticNode.position = CGPoint(x: xCoordinate, y: yCoordinateTop)
        
        if (object == "Ball"){
            dynamicNode = Ball(radius: Ball.radiusInit, scene: scene, mass: Ball.massInit, position:  CGPoint(x: xCoordinate, y: yCoordinateBottom), color: Ball.colorInit)
        }
        if (object == "Block"){
            dynamicNode = Block(width: Block.widthInit, height: Block.heightInit, scene: scene, mass: Block.massInit, position: CGPoint(x: xCoordinate, y: yCoordinateBottom), color: Block.colorInit)
        }
        
        dynamicNode.name = "draggableSpring"
        scene.addChild(staticNode)

        let spring = SKPhysicsJointSpring.joint(withBodyA: staticNode.physicsBody!,
        bodyB: dynamicNode.physicsBody!,
        anchorA: staticNode.position,
        anchorB: dynamicNode.position)
        
        spring.frequency = frequency
        spring.damping = damping
        
        scene.physicsWorld.add(spring)
        
        self.position = CGPoint(x: xCoordinate, y: yCoordinateTop)
        self.anchorPoint = CGPoint(x: 0.5, y: 1)
    
        scene.addChild(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Method
    //This method is used that the picture can match the motion of the spring
    //It uses Pythogorean rule to calculate the distance sqrt((y1-y2)^2 + (x1-x2)^2)
    //It finds the angle using right triangle tangent rule tan a = opposite/ adjesent
    func yChange(){
        self.size.height = sqrt(pow(self.staticNode.position.y - self.dynamicNode.position.y,2) + pow(self.staticNode.position.x - self.dynamicNode.position.x,2))
        let a = atan((self.staticNode.position.y - self.dynamicNode.position.y)/(self.staticNode.position.x - self.dynamicNode.position.x))
        if a < 0 {
            self.zRotation = a + CGFloat.pi/2
        }else {
            self.zRotation = a - CGFloat.pi/2
        }
    }
    
}

