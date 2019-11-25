//
//  SpringPropertiesController.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 11/25/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import Foundation
import UIKit

protocol SpringPropertiesControllerDelegate: class {
    func didPropertiesChangeSpring(properties:[String])
}

class SpringPropertiesController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var objectSpring: UIPickerView!
    @IBOutlet weak var xCoordinateSpring: UITextField!
    @IBOutlet weak var yCoordinateTopSpring: UITextField!
    @IBOutlet weak var yCoordinateBottomSpring: UITextField!
    @IBOutlet weak var dampingSpring: UITextField!
    @IBOutlet weak var frequencySpring: UITextField!
    
    var pickedObject: String = "Ball"
    let object = ["Ball", "Block"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return object [row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return object.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedObject = object[row]
    }

    var properties: [String] = []
    weak var delegate:SpringPropertiesControllerDelegate?
    
    
    @IBAction func doneButtonSpring(_ sender: Any) {
        //[object, xCoordinate, yCoordinateTop, yCoordinateBottom, damping, frequency]
        
        properties.append(pickedObject)
        
        if (xCoordinateSpring.text! == "")||(Int(xCoordinateSpring.text!) ?? -2 < 0){properties.append(String(Spring.xCoordinateInit))}
        else{properties.append(xCoordinateSpring.text!)}
        
        if (yCoordinateTopSpring.text! == "")||(Int(yCoordinateTopSpring.text!) ?? -2 < 0){properties.append(String(Spring.yCoordinateTopInit))}
        else{properties.append(yCoordinateTopSpring.text!)}
        
        if (yCoordinateBottomSpring.text! == "")||(Int(yCoordinateBottomSpring.text!) ?? -2 < 0){properties.append(String(Spring.yCoordinateBottomInit))}
        else{properties.append(yCoordinateBottomSpring.text!)}
        
        if (dampingSpring.text! == "")||(Int(dampingSpring.text!) ?? -2 < 0){
            properties.append(String(describing: Spring.dampingInit))}
        else{properties.append(dampingSpring.text!)}
        
        if (frequencySpring.text! == "")||(Int(frequencySpring.text!) ?? -2 < 0){
            properties.append(String(describing: Spring.frequencyInit))}
        else{properties.append(frequencySpring.text!)}
        
        delegate?.didPropertiesChangeSpring(properties: properties)
        navigationController?.dismiss(animated: true)
    }
}
