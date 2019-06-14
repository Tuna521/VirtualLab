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

class GameViewController: UIViewController, BallPropertiesControllerDelegate {
    
    func didPropertiesChange(properties: [String]) {
        Ball.radiusInit = Int(properties[0])!
        Ball.xCoordinateInit = Int(properties[1])!
        Ball.yCoordinateInit = Int(properties[2])!
        //
        //print(properties)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ball"){
            if let nav = segue.destination as? UINavigationController, let  classBallProperties = nav.topViewController as? BallPropertiesController {
                classBallProperties.delegate = self
            }
        }
    }
    
    var ball: Ball!
    var scene2: SKScene!
    var block: Block!
    
    
    
    
    @IBAction func circleBtn(_ sender: UIButton) {
        print("Circle tipped")
        
         let position2 = CGPoint(x: 300, y: 600)
        ball = Ball(radius: Ball.radiusInit, scene: scene2, position: CGPoint(x: Ball.xCoordinateInit, y: Ball.yCoordinateInit))
        ball.setTexture(texture: "red-ball")
        
        // self.view.addSubview(propertiesView)
        
    }
    
    
    @IBAction func blockBtn(_ sender: UIButton) {
        print("This is the block")
        let position3 = CGPoint(x: 100, y: 400)
        block = Block(width: 200, height: 100, scene: scene2, position: position3)
        //ball.physicsBody?.affectedByGravity = true
        block.setTexture(texture: "block")
    }
    
    @IBOutlet weak var propertiesView: UIView!
    
    //ball property view now
    
    @IBAction func radiusBallField(_ sender: Any) {
        
    }
    
    @IBOutlet weak var colorBallField: UIPickerView!
    
    
    @IBAction func xCoordinatesBallField(_ sender: Any) {
    }
    
    @IBAction func yCoordinatesBallField(_ sender: Any) {
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
