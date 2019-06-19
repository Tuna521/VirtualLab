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

class GameViewController: UIViewController, BallPropertiesControllerDelegate, BlockPropertiesControllerDelegate {
    
    func didPropertiesChange(properties: [String]) {
        Ball.radiusInit = Int(properties[0])!
        Ball.colorInit = properties[1]
        Ball.xCoordinateInit = Int(properties[2])!
        Ball.yCoordinateInit = Int(properties[3])!
        //
        //print(properties)
    }
    /*
    func didPropertiesChange(properties: [String]) {
        Block.widthInit = Int(properties[0])!
        Block.heightInit = Int(properties[1])!
        Ball.xCoordinateInit = Int(properties[2])!
        Ball.yCoordinateInit = Int(properties[3])!
        //
        //print(properties)
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ball"){
            if let nav = segue.destination as? UINavigationController, let  classBallProperties = nav.topViewController as? BallPropertiesController {
                classBallProperties.delegate = self
            }
        }
        if (segue.identifier == "block"){
            if let nav = segue.destination as? UINavigationController, let classBlockProperties = nav.topViewController as? BallPropertiesController {
                classBlockProperties.delegate = self
            }
        }
    }
    
    
    var ball: Ball!
    var scene2: SKScene!
    var block: Block!
    
    
    
    
    @IBAction func circleBtn(_ sender: UIButton) {
        print("Circle tipped")
        ball = Ball(radius: Ball.radiusInit, scene: scene2, position: CGPoint(x: Ball.xCoordinateInit, y: Ball.yCoordinateInit))
        ball.setTexture(texture: Ball.colorInit)
        
        
    }
    
    
    @IBAction func blockBtn(_ sender: UIButton) {
        print("This is the block")
        block = Block(width: Block.widthInit, height: Block.heightInit, scene: scene2, position: CGPoint(x: Block.xCoordinateInit, y: Block.yCoordinateInit))
        //ball.physicsBody?.affectedByGravity = true
        block.setTexture(texture: "block")
    }
    
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
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
