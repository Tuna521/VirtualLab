//
//  RopePropertiesController.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 6/27/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import Foundation
import UIKit

protocol RopePropertiesControllerDelegate: class {
    func didPropertiesChangeRope(properties:[String])
}

class RopePropertiesController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    @IBOutlet weak var lengthRope: UITextField!
    @IBOutlet weak var objectRope: UIPickerView!
    @IBOutlet weak var xCoordinateRope: UITextField!
    @IBOutlet weak var yCoordinateRope: UITextField!
    
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
    weak var delegate:RopePropertiesControllerDelegate?
    
    
    @IBAction func doneButtonRope(_ sender: Any) {
        if (lengthRope.text! == "")||(Int(lengthRope.text!) ?? -2 < 0){properties.append(String(VineNode.lengthInit))}
        else{properties.append(lengthRope.text!)}

        if (xCoordinateRope.text! == "")||(Int(xCoordinateRope.text!) ?? -2 < 0){properties.append(String(VineNode.xCoordinateInit))}
        else{properties.append(xCoordinateRope.text!)}
        
        if (yCoordinateRope.text! == "")||(Int(yCoordinateRope.text!) ?? -2 < 0){properties.append(String(VineNode.yCoordinateInit))}
        else{properties.append(yCoordinateRope.text!)}
        
        properties.append(pickedObject)
        delegate?.didPropertiesChangeRope(properties: properties)
        navigationController?.dismiss(animated: true)
    }
}
