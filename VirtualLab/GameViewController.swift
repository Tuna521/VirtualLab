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

class GameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var ball: Ball!
    var scene2: SKScene!
    var block: Block!
    
    
    @IBOutlet weak var radiusNum: UITextField!
    
    @IBOutlet weak var selectButton: SAFollowButton!
    
    
    @IBAction func selectButton(_ sender: SAFollowButton) {
        Ball.radiusInit = Int(radiusNum.text!)!
        
        
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    let color = ["red", "gold", "blue"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return color [row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return color.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       // label.text = color[row]
    }
    
    
    @IBAction func circleBtn(_ sender: UIButton) {
        print("Circle tipped")
        let position2 = CGPoint(x: 300, y: 600)
        ball = Ball(radius: Ball.radiusInit, scene: scene2, position: position2)
        ball.setTexture(texture: "red-ball")
        propertiesView.isHidden = false
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
        radiusNum.text = String(50)
        
        
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
