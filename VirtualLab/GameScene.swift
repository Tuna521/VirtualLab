//
//  GameScene.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 2/21/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var ball: Ball!
    var floor:SKShapeNode!
    var spring: Spring!
    var factor: Double!

    
    override func didMove(to view: SKView) {
        //physicsWorld.contactDelegate = self
        //physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
        //physicsWorld.speed = 1.0
        
        let position = CGPoint(x: 100, y: 500)
        ball = Ball(radius: 50, scene: self, position: position)
        //ball.physicsBody?.affectedByGravity = true
        
        let position2 = CGPoint(x: 300, y: 600)
        let ball2 = Ball(radius: 50, scene: self, position: position2)
        ball2.setTexture(texture: "red-ball")
        //ball2.physic
        
        floor = SKShapeNode(rectOf: CGSize(width: size.width, height: 5))
        floor.position = CGPoint(x: size.width / 2, y: 50)
        floor.fillColor = SKColor.red
        floor.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: -size.width / 2, y: 0), to: CGPoint(x: size.width, y: 0))
        addChild(floor)
        
        let inclinedPlane = InclinedPlane(angle: 10, length: 400, width: 30, scene: self, position: CGPoint(x: 300, y: 300))
        
        let position3 = CGPoint(x: 150, y: 400)
        let block = Block(width: 200, height: 100, scene: self, position: position3)
        //ball.physicsBody?.affectedByGravity = true
        block.setTexture(texture: "block")
        
        let positionVine = CGPoint(x: 100, y: 400)
        let vine1 = VineNode(length: 10, anchorPoint: positionVine)
        vine1.addToScene(self)
        let bob = SKSpriteNode(imageNamed: "pin")
        bob.physicsBody = SKPhysicsBody(circleOfRadius: 2)
        addChild(bob)
        vine1.attachToBob(bob)
        
        spring = Spring(scene: self, SpringPosition: CGPoint(x: 400, y: 300))
        let bob2 = SKSpriteNode(imageNamed: "pin")
        bob2.physicsBody = SKPhysicsBody(circleOfRadius: 2)
        addChild(bob2)
        spring.attachBody(bob2)
        //let positionSpring = CGPoint(x: 500, y: 600)
        //spring.position = positionSpring
        //spring.anchorPoint = CGPoint(x: 0, y: 1)
        //addChild(spring)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
   
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        //factor = 20 * sin(currentTime)
        spring.yScale = CGFloat(sin(3 * currentTime) + 1.5)
        
    }
}
