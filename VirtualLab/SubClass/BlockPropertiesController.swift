//
//  BlockPropertiesController.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 6/17/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import Foundation
import UIKit

protocol BlockPropertiesControllerDelegate: class {
    func didPropertiesChangeBlock(properties:[String])
}


class BlockPropertiesController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    @IBOutlet weak var widthBlock: UITextField!
    
    @IBOutlet weak var heightBlock: UITextField!
    
    @IBOutlet weak var colorBlock: UIPickerView!
    
    @IBOutlet weak var xCoordinateBlock: UITextField!
    @IBOutlet weak var yCoordinateBlock: UITextField!
    
    var pickedColor: String = "brown"
    let color = ["brown", "grey", "wood"]
    
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
        pickedColor = color[row]
    }
    
    var properties: [String] = []
    weak var delegate:BlockPropertiesControllerDelegate?
    
    
    
    @IBAction func doneButtonBlock(_ sender: Any) {
        
        properties.append(widthBlock.text!)
        properties.append(heightBlock.text!)
        properties.append(xCoordinateBlock.text!)
        properties.append(yCoordinateBlock.text!)
        pickedColor = pickedColor + "Block"
        properties.append(pickedColor)
        delegate?.didPropertiesChangeBlock(properties: properties)
        navigationController?.dismiss(animated: true)
    }
    
}
