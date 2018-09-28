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
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var duckLabel: UIImageView!
    
    var countdownArray : [UIImage] = [UIImage(named: "1")!,UIImage(named: "2")!,UIImage(named: "3")!]
    
    @IBOutlet weak var numberImage: UIImageView!
    override func viewDidLoad() {
        duckLabel.isHidden = true //falar com as designers sobre isso
        Data.shared.teamTurn = (Data.shared.teams.last?.id)!
        turnLabel.text = String(format: "It's team %d turn!".localized(), Data.shared.teamTurn)
        Data.shared.collectionWords.removeAll()
        Data.shared.newCollectionWords.removeAll()
        Data.shared.finalCollectionWords.removeAll()
        if Data.shared.teamTurn == 1 {
            duckLabel.image = UIImage(named: "BlueDuck")
        }
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
            timerLabel.isHidden = true
            numberImage.image = countdownArray[totalTime-2]
            totalTime -= 1
        } else if totalTime == 1{
            numberImage.isHidden = true
            timerLabel.text = "START!".localized()
            timerLabel.isHidden = false
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
