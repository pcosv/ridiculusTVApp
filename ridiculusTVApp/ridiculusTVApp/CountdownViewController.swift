//
//  ViewControllerTeste.swift
//  ridiculusTVApp
//
//  Created by Paula Vaz on 18/09/2018.
//  Copyright © 2018 René Melo de Lucena. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        startTimer()
    }
    override func didReceiveMemoryWarning() {
        
    }
    var SwiftTimer = Timer()
    var totalTime = 4
    
    func startTimer() {
        SwiftTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if totalTime > 1 {
            timerLabel.text = "\(totalTime-1)"
            totalTime -= 1
        } else if totalTime == 1{
            timerLabel.text = "START!"
            totalTime -= 1
        } else {
            
            endTimer()
            self.performSegue(withIdentifier: "segue", sender: nil)
        }
    }
    
    func endTimer() {
        SwiftTimer.invalidate()
    }
}
