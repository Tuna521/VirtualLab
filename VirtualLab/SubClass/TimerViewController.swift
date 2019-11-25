//
//  TimerViewController.swift
//  VirtualLab
//
//  Created by Wang Zong-Ting on 11/22/19.
//  Copyright © 2019 Wang Zong-Ting. All rights reserved.
//

import UIKit


class TimerViewController: UIViewController {
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
        var timerOn = false
        var counter = 0.0
        
        override func viewDidLoad() {
            super.viewDidLoad();
            
            resetButton.isEnabled = false
            startButton.isEnabled = true
            stopButton.isEnabled = false

        }
        
        @IBAction func resetButtonAction(_ sender: Any) {
            timerOn = false
            
            resetButton.isEnabled = false
            startButton.isEnabled = true
            stopButton.isEnabled = false
            
            counter = 0.0
            timerLabel.text = "00:00:00.0"
            timer.invalidate()
        }
        
        @IBAction func stopButtonAction(_ sender: Any) {
            timerOn = false
            
            resetButton.isEnabled = true
            startButton.isEnabled = true
            stopButton.isEnabled = false
            
            timer.invalidate()
        }
        
        
        @IBAction func startButtonAction(_ sender: Any) {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            timerOn = true
            resetButton.isEnabled = true
            startButton.isEnabled = false
            stopButton.isEnabled = true
        }
        
        
        
        @objc func runTimer(){
            counter += 0.1
            
            //hours + : + minutes + : + seconds + . + deciseconds
            let helperCounter = Int (floor(counter))
            let h = helperCounter / 3600
            var hs = "\(h)"
            if h < 10 {hs = "0\(h)"}
            
            let m = (helperCounter % 3600) / 60
            var ms = "\(m)"
            if m < 10 {ms = "0\(m)"}
            
            let s = (helperCounter % 3600) % 60
            var ss = "\(s)"
            if s < 10{ss = "0\(s)"}
            
            
            let d = Int((counter - Double(helperCounter)) * 10)
            
            timerLabel.text = "\(hs):\(ms):\(ss).\(d)"
            
        }
    }
