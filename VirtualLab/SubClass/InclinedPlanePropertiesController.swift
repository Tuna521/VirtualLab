//
//  InclinedPlanePropertiesController.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 10/8/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import Foundation
import UIKit

protocol InclinedPlanePropertiesControllerDelegate: class {
    func didPropertiesChangeInclinedPlane(properties:[String])
}

class InclinedPlanePropertiesController: UIViewController{
    
    @IBOutlet weak var angleInclinedPlane: UITextField!
    @IBOutlet weak var lengthInclinedPlane: UITextField!
    @IBOutlet weak var widthInclinedPlane: UITextField!
    @IBOutlet weak var xCoordinateInclinedPlane: UITextField!
    @IBOutlet weak var yCoordinateInclinedPlane: UITextField!
    
    
    
    var properties: [String] = []
    weak var delegate:InclinedPlanePropertiesControllerDelegate?
    
    
    @IBAction func doneButtonInclinedPlane(_ sender: UIBarButtonItem) {
        if angleInclinedPlane.text! == ""{properties.append(String(InclinedPlane.angleInit))}
        else{properties.append(angleInclinedPlane.text!)}
        
        if lengthInclinedPlane.text! == ""{properties.append(String(InclinedPlane.lengthInit))}
        else{properties.append(lengthInclinedPlane.text!)}
        
        if widthInclinedPlane.text! == ""{properties.append(String(InclinedPlane.widthInit))}
        else{properties.append(widthInclinedPlane.text!)}

        if xCoordinateInclinedPlane.text! == ""{properties.append(String(InclinedPlane.xCoordinateInit))}
        else{properties.append(xCoordinateInclinedPlane.text!)}
        
        if yCoordinateInclinedPlane.text! == ""{properties.append(String(InclinedPlane.yCoordinateInit))}
        else{properties.append(yCoordinateInclinedPlane.text!)}
        
        delegate?.didPropertiesChangeInclinedPlane(properties: properties)
        navigationController?.dismiss(animated: true)
    }
    
}

