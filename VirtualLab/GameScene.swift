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
        floor.position = CGPoint(x: size.width / 2, y: 130)
        floor.fillColor = SKColor.red
        floor.name = "undeletable"
        floor.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: -size.width / 2, y: 0), to: CGPoint(x: size.width, y: 0))
        addChild(floor)
        
        //let inclinedPlane = InclinedPlane(angle: 10, length: 400, width: 30, scene: self, position: CGPoint(x: 300, y: 300))
        
        let block = Block(width: 200, height: 100, scene: self, mass: 0.1, position: CGPoint(x: 500, y: 400))
        block.setTexture(texture: "greyBlock")
        
        let ball2 = Ball(radius: 20, scene: self, mass: 0.01, position: CGPoint(x: 300, y: 600))
        ball2.setTexture(texture: "metalBall")
        

        let vine1 = VineNode(length: 10, anchorPoint: CGPoint(x: 100, y: 400))
        vine1.addToScene(self)
        vine1.attachToBob(ball2)
        
        let ball1 = Ball(radius: 30, scene: self, mass: 0.5, position: CGPoint(x: 700, y: 700))
        //spring = Spring(sizeA: CGSize(width: Spring.initSizeA, height: Spring.initSizeA), sizeB: CGSize(width: Spring.initSizeB, height: Spring.initSizeB), positionA: CGPoint(x: Spring.initCoordinateXA, y: Spring.initCoordinateYA), positionB: CGPoint(x: Spring.initCoordinateXB, y: Spring.initCoordinateYB), frequency: CGFloat(Spring.initFrequency), damping: CGFloat(Spring.initDamping), scene: self)
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
             if (touch.tapCount == 3) && (node.name != "undeletable"){
                 self.removeChildren(in: [node])
                 print("deleted")
             }
             
             if node.name == "draggable" || node.name == "draggableSpring" {
                    self.currentNode?.physicsBody?.isDynamic = false
                    self.currentNode = node
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = currentNode {
         if node.name == "draggableSpring"{
            let touchLocation = touch.location(in: self)
            node.position.y = touchLocation.y
            node.physicsBody?.isDynamic = false
         } else{
             let touchLocation = touch.location(in: self)
             node.position = touchLocation
             node.physicsBody?.isDynamic = false
         }
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
        //spring.yScale = CGFloat(sin(3 * currentTime) + 1.5)
        //mySpring.springPicture.size.height = sqrt(pow(mySpring.staticNode.position.y - mySpring.dynamicNode.position.y,2) + pow(mySpring.staticNode.position.x - mySpring.dynamicNode.position.x,2))
        //let a = atan((mySpring.staticNode.position.y - mySpring.dynamicNode.position.y)/(mySpring.staticNode.position.x - mySpring.dynamicNode.position.x))
        //print (a)
        //if a < 0 {
            //mySpring.springPicture.zRotation = a + CGFloat.pi/2
        //}else {
            //mySpring.springPicture.zRotation = a - CGFloat.pi/2
        //}
        self.enumerateChildNodes(withName: "Spring") {
            (node, stop) in
            let n = node as! Spring
            n.yChange()
        }
    }
}
