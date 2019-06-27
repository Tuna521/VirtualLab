//
//  BallPropertiesController.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 6/14/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//
import Foundation
import UIKit

protocol BallPropertiesControllerDelegate: class {
    func didPropertiesChangeBall(properties:[String])
}

class BallPropertiesController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    var pickedColor: String = "red"
    let color = ["red", "gold", "metal","blue"]
    var properties: [String] = []
    weak var delegate:BallPropertiesControllerDelegate?
    
    
    @IBOutlet weak var radiusBall: UITextField!
    
    @IBOutlet weak var colorBall: UIPickerView!
    
    @IBOutlet weak var xCoordinateBall: UITextField!
    @IBOutlet weak var yCoordinateBall: UITextField!
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return color [row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return color.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedColor = color[row]
        
    }
    
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        if radiusBall.text! == ""{properties.append(String(Ball.radiusInit))}
        else{properties.append(radiusBall.text!)}
        
        pickedColor = pickedColor+"Ball"
        properties.append(pickedColor)
        
        if xCoordinateBall.text! == ""{properties.append(String(Ball.xCoordinateInit))}
        else{properties.append(xCoordinateBall.text!)}
        
        if yCoordinateBall.text! == ""{properties.append(String(Ball.yCoordinateInit))}
        else{properties.append(yCoordinateBall.text!)}
        
        delegate?.didPropertiesChangeBall(properties: properties)
        navigationController?.dismiss(animated: true)
    }
}
