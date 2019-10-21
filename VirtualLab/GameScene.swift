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
    private var currentNode: SKNode?
    
    override func didMove(to view: SKView) {
        //physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
        //physicsWorld.speed = 1.0
        
        floor = SKShapeNode(rectOf: CGSize(width: size.width, height: 5))
        floor.position = CGPoint(x: size.width / 2, y: 50)
        floor.fillColor = SKColor.red
        floor.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: -size.width / 2, y: 0), to: CGPoint(x: size.width, y: 0))
        addChild(floor)
        
        let inclinedPlane = InclinedPlane(angle: 10, length: 400, width: 30, scene: self, position: CGPoint(x: 300, y: 300))
        
        //ball.physicsBody?.affectedByGravity = true
        
        let position3 = CGPoint(x: 500, y: 400)
        let block = Block(width: 200, height: 100, scene: self, position: position3)
        //ball.physicsBody?.affectedByGravity = true
        block.setTexture(texture: "greyBlock")
        
        let position2 = CGPoint(x: 300, y: 600)
        let ball2 = Ball(radius: 20, scene: self, position: position2)
        ball2.setTexture(texture: "metalBall")
        //ball2.physic
        
        let positionVine = CGPoint(x: 100, y: 400)
        let vine1 = VineNode(length: 10, anchorPoint: positionVine)
        vine1.addToScene(self)
        vine1.attachToBob(ball2)
        
        let ball1 = Ball(radius: 30, scene: self, position: CGPoint(x: 700, y: 700))
        spring = Spring(scene: self, SpringPosition: CGPoint(x: 700, y: 700))
        spring.attachBody(ball1)
        //let positionSpring = CGPoint(x: 500, y: 600)
        //spring.position = positionSpring
        //spring.anchorPoint = CGPoint(x: 0, y: 1)
        //addChild(spring)
        
        //spring.removeFromParent()
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if node.name == "draggable" {
                    self.currentNode?.physicsBody?.isDynamic = false
                    self.currentNode = node
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = currentNode {
            let touchLocation = touch.location(in: self)
            node.position = touchLocation
            node.physicsBody?.isDynamic = false
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode?.physicsBody?.isDynamic = true
        self.currentNode = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        //factor = 20 * sin(currentTime)
        spring.yScale = CGFloat(sin(3 * currentTime) + 1.5)
        
    }
}
