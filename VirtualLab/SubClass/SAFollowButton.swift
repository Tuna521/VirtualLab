//
//  SAFollowButton.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 6/6/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import UIKit

class SAFollowButton: UIButton {
    // sasasasa

    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton(){
        setImage(UIImage(named: "sel"), for: .normal)
        addTarget(self, action: #selector(SAFollowButton.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed(){
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool){
        isOn = bool
        let image = bool ? "sel" : "sel-2"
        setImage(UIImage(named: image), for: .normal)
    }
}
