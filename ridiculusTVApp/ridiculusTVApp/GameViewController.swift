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
        if label == firstWord {
            let aux = Data.shared.noun.count
            let number = Int.random(in: 0 ... aux - 1)
            let newWord = Data.shared.noun[number]
            firstWord.text = newWord.name
            Data.shared.nounUsed.append(newWord)
            Data.shared.noun.remove(at: number)
        }
        if label == secondWord {
            let aux = Data.shared.place.count
            let number = Int.random(in: 0 ... aux - 1)
            let newWord = Data.shared.noun[number]
            secondWord.text = newWord.name
            Data.shared.placeUsed.append(newWord)
            Data.shared.place.remove(at: number)
        }
        if label == thirdWord {
            let aux = Data.shared.place.count
            let number = Int.random(in: 0 ... aux - 1)
            let newWord = Data.shared.noun[number]
            thirdWord.text = newWord.name
            Data.shared.placeUsed.append(newWord)
            Data.shared.place.remove(at: number)
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
//                for
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
        return String(format: "%2d:%02d", minutes, seconds)
    }
    
}

