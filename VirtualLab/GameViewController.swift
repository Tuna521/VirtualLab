//
//  GameViewController.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 2/21/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, BallPropertiesControllerDelegate, BlockPropertiesControllerDelegate, RopePropertiesControllerDelegate, InclinedPlanePropertiesControllerDelegate, SpringPropertiesControllerDelegate {
    
    func didPropertiesChangeBall(properties: [String]) {
        Ball.radiusInit = Int(properties[0])!
        Ball.colorInit = properties[1]
        Ball.xCoordinateInit = Int(properties[2])!
        Ball.yCoordinateInit = Int(properties[3])! + 130
        Ball.massInit = CGFloat((properties[4] as NSString).doubleValue)
    }
    
    func didPropertiesChangeBlock(properties: [String]) {
        Block.widthInit = Int(properties[0])!
        Block.heightInit = Int(properties[1])!
        Block.xCoordinateInit = Int(properties[2])!
        Block.yCoordinateInit = Int(properties[3])! + 130
        Block.colorInit = properties[4]
        Ball.massInit = CGFloat((properties[5] as NSString).doubleValue)
        //
        //print(properties)
    }
    
    func didPropertiesChangeRope(properties: [String]) {
        VineNode.lengthInit = Int(properties[0])!
        VineNode.xCoordinateInit = Int(properties[1])!
        VineNode.yCoordinateInit = Int(properties[2])! + 130
        VineNode.attachObjectInit = properties[3]
        //
        print(properties)
    }
    
    func didPropertiesChangeInclinedPlane(properties: [String]) {
        InclinedPlane.angleInit = Double(properties[0])!
        InclinedPlane.lengthInit = Int(properties[1])!
        InclinedPlane.widthInit = Int(properties[2])!
        InclinedPlane.xCoordinateInit = Int(properties[3])!
        InclinedPlane.yCoordinateInit = Int(properties[4])! + 130
        InclinedPlane.frictionInit = CGFloat((properties[5] as NSString).doubleValue)
        //
        print(properties)
    }
    
    func didPropertiesChangeSpring(properties: [String]) {
        Spring.attachObjectInit = properties[0]
        Spring.xCoordinateInit = Int(properties[1])!
        Spring.yCoordinateTopInit = Int(properties[2])!
        Spring.yCoordinateBottomInit = Int(properties[3])!
        Spring.dampingInit = CGFloat((properties[4] as NSString).doubleValue)
        Spring.frequencyInit = CGFloat((properties[5] as NSString).doubleValue)
        print(properties)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ball"){
            if let nav = segue.destination as? UINavigationController, let  classBallProperties = nav.topViewController as? BallPropertiesController {
                classBallProperties.delegate = self
            }
        }
        
        if (segue.identifier == "block"){
            if let nav = segue.destination as? UINavigationController, let classBlockProperties = nav.topViewController as? BlockPropertiesController {
                classBlockProperties.delegate = self
            }
        }
        
        if (segue.identifier == "rope"){
            if let nav = segue.destination as? UINavigationController, let classRopeProperties = nav.topViewController as? RopePropertiesController {
                classRopeProperties.delegate = self
            }
        }
        
        if (segue.identifier == "inclinedPlane"){
            if let nav = segue.destination as? UINavigationController, let classInclinedPlaneProperties = nav.topViewController as? InclinedPlanePropertiesController {
                classInclinedPlaneProperties.delegate = self
            }
        }
        
        if (segue.identifier == "spring"){
            if let nav = segue.destination as? UINavigationController, let classSpringProperties = nav.topViewController as? SpringPropertiesController {
                classSpringProperties.delegate = self
            }
        }
    }
    
    
    var ball: Ball!
    var scene2: SKScene!
    var block: Block!
    
    
    @IBAction func gravityAffectSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            scene2.physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
        }else {
            scene2.physicsWorld.gravity = CGVector(dx: 0.0, dy: 0)
        }
        
    }
   
    var bar1: SKShapeNode!
    var bar2: SKShapeNode!
    @IBAction func barrierOnOffSwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            bar1 = SKShapeNode(rectOf: CGSize(width: 5, height: scene2.size.height))
            bar1.position = CGPoint(x: 0, y: scene2.size.height/2)
            bar1.fillColor = SKColor.red
            bar1.name = "undeletable"
            bar1.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: -scene2.size.height / 2), to: CGPoint(x: 0, y: scene2.size.height))
            scene2.addChild(bar1)
            
            bar2 = SKShapeNode(rectOf: CGSize(width: 5, height: scene2.size.height))
            bar2.position = CGPoint(x: scene2.size.width-240, y: scene2.size.height/2)
            bar2.fillColor = SKColor.red
            bar2.name = "undeletable"
            bar2.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: -scene2.size.height / 2), to: CGPoint(x: 0, y: scene2.size.height))
            scene2.addChild(bar2)
        }else{
            scene2.removeChildren(in: [bar1, bar2])
        }
    }
    
    
    
    @IBAction func clearAllBtn(_ sender: UIButton) {
        scene2.removeAllChildren()
        let floor = SKShapeNode(rectOf: CGSize(width: scene2.size.width, height: 5))
        floor.position = CGPoint(x: scene2.size.width / 2, y: 130)
        floor.name = "undeletable"
        floor.fillColor = SKColor.red
        floor.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: -scene2.size.width / 2, y: 0), to: CGPoint(x: scene2.size.width, y: 0))
        scene2.addChild(floor)
    }
    
    
    @IBAction func circleBtn(_ sender: UIButton) {
        print("Circle tipped")
        //ball = Ball(radius: Ball.radiusInit, scene: scene2, position: CGPoint(x: Ball.xCoordinateInit, y: Ball.yCoordinateInit))
        //ball.setTexture(texture: Ball.colorInit)
        ball = Ball(scene: scene2)
    }
    
    
    @IBAction func blockBtn(_ sender: UIButton) {
        print("This is the block")
        //block = Block(width: Block.widthInit, height: Block.heightInit, scene: scene2, position: CGPoint(x: Block.xCoordinateInit, y: Block.yCoordinateInit))
        //block.setTexture(texture: Block.colorInit)
        block = Block(scene: scene2)
    }
    
    
    @IBAction func ropeBtn(_ sender: UIButton) {
        print("Hey yoooo Rope here")
        let vine = VineNode(length:VineNode.lengthInit, anchorPoint: CGPoint(x: VineNode.xCoordinateInit, y: VineNode.yCoordinateInit))
        vine.addToScene(scene2)
        if (VineNode.attachObjectInit == "Ball"){
            ball = Ball(scene: scene2)
            ball.setTexture(texture: Ball.colorInit)
            vine.attachToBob(ball)
        }
        if (VineNode.attachObjectInit == "Block"){
            block = Block(scene: scene2)
            //ball.physicsBody?.affectedByGravity = true
            block.setTexture(texture: Block.colorInit)
            vine.attachToBob(block)
        }
    }
    
    
    @IBAction func inclinedPlaneBtn(_ sender: UIButton) {
        print("go to corner, it is the warmest 90 degrees")
        let inclPlane = InclinedPlane(scene: scene2)
        //let inclPlane = InclinedPlane(angle: InclinedPlane.angleInit, length: InclinedPlane.lengthInit, width: InclinedPlane.widthInit, scene: scene2, position: CGPoint(x: InclinedPlane.xCoordinateInit, y: InclinedPlane.yCoordinateInit))
    }
    
    @IBAction func springBtn(_ sender: UIButton) {
        print("Boing, boing")
        let spring = Spring(object: Spring.attachObjectInit, xCoordinate: Spring.xCoordinateInit, yCoordinateTop: Spring.yCoordinateTopInit, yCoordinateBottom: Spring.yCoordinateBottomInit, frequency: Spring.frequencyInit, damping: Spring.dampingInit, scene: scene2)
    }
    
    
    //@IBOutlet weak var collectionView: UICollectionView!
    
    let dataArray = ["Ball","Spring","String","Plane","Block"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //set Delegates
        //self.collectionView.delegate = self
        
        //Register Cell
        
        scene2 = GameScene(size: view.frame.size)
        if let view = self.view as! SKView? {
            view.presentScene(scene2)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsPhysics = true
            view.showsNodeCount = true
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
/*
extension GameViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.setData(text: self.dataArray[indexPath.row])
        
        return cell
    }
}
*/
