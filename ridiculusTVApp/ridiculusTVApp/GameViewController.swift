//
//  ViewController.swift
//  ridiculusTVApp
//
//  Created by René Melo de Lucena on 18/09/2018.
//  Copyright © 2018 René Melo de Lucena. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var firstWord: UILabel!
    @IBOutlet weak var secondWord: UILabel!
    @IBOutlet weak var thirdWord: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeWord(firstWord)
        changeWord(secondWord)
        changeWord(thirdWord)
        startTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeWord(_ label:UILabel) {
        var changed = false
        while changed == false {
            if label == firstWord {
            let newWord = Data.shared.words.randomElement()
                if newWord?.name == firstWord.text{
                    changeWord(label)
                }
                if newWord?.type == "noun" {
                    firstWord.text = newWord?.name
                    changed = true
                }
            }
            if label == secondWord {
                let newWord = Data.shared.words.randomElement()
                if newWord?.name == secondWord.text{
                    changeWord(label)
                }
                if newWord?.type == "place" {
                    secondWord.text = newWord?.name
                    changed = true
                }
            }
            if label == thirdWord {
                let newWord = Data.shared.words.randomElement()
                if newWord?.name == thirdWord.text{
                    changeWord(label)
                }
                if newWord?.type == "verb" {
                    thirdWord.text = newWord?.name
                    changed = true
                }
            }
        }
    }
    
    var SwiftTimer = Timer()
    var totalTime = 90
    
    func startTimer() {
        SwiftTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    @objc func updateTime() {
        timerLabel.text = "\(timeFormatted(totalTime))"
        if totalTime != 0 {
            if totalTime % 30 == 0 && totalTime != 90 {
                changeWord(firstWord)
                changeWord(secondWord)
                changeWord(thirdWord)
            }
            totalTime -= 1
        } else {
            endTimer()
            Data.shared.teamsDone.append((Data.shared.teams.last)!)
            Data.shared.teams.removeLast()
            if Data.shared.teams.count > 0 {
                self.performSegue(withIdentifier: "nextroundsegue", sender: nil)
            } else {
                self.performSegue(withIdentifier: "endgamesegue", sender: nil)
            }
        }
        

    }
    
    func endTimer() {
        SwiftTimer.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
}

