//
//  ViewController.swift
//  ridiculusTVApp
//
//  Created by René Melo de Lucena on 18/09/2018.
//  Copyright © 2018 René Melo de Lucena. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView1 {
            return Data.shared.collectionWords.count
        }
        if collectionView == collectionView2 {
            return Data.shared.newCollectionWords.count
        }
        else {
            return Data.shared.finalCollectionWords.count
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView1 {
            let cella = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
            cella.collectionViewLabel.text = Data.shared.collectionWords[indexPath.row].name.localized()
            return cella
        }
        if collectionView == collectionView2 {
            let cellb = collectionView.dequeueReusableCell(withReuseIdentifier: "cella", for: indexPath) as! CustomCollectionViewCell
            cellb.collectionViewLabel.text = Data.shared.newCollectionWords[indexPath.row].name.localized()
            return cellb
        } else {
            let cellc = collectionView.dequeueReusableCell(withReuseIdentifier: "cellb", for: indexPath) as! CustomCollectionViewCell
            cellc.collectionViewLabel.text = Data.shared.finalCollectionWords[indexPath.row].name.localized()
            return cellc
        }
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var firstWord: UILabel!
    @IBOutlet weak var secondWord: UILabel!
    @IBOutlet weak var thirdWord: UILabel!
    
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView3: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeWord(firstWord)
        changeWord(secondWord)
        changeWord(thirdWord)
        startTimer()
        self.collectionView1.delegate = self
        self.collectionView1.dataSource = self
        self.collectionView2.delegate = self
        self.collectionView2.dataSource = self
        self.collectionView3.delegate = self
        self.collectionView3.dataSource = self
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
            Data.shared.collectionWords.append(newWord)
            Data.shared.noun.remove(at: number)
        }
        if label == secondWord {
            let aux = Data.shared.place.count
            let number = Int.random(in: 0 ... aux - 1)
            let newWord = Data.shared.place[number]
            secondWord.text = newWord.name
            Data.shared.placeUsed.append(newWord)
            Data.shared.collectionWords.append(newWord)
            Data.shared.place.remove(at: number)
        }
        if label == thirdWord {
            let aux = Data.shared.verb.count
            let number = Int.random(in: 0 ... aux - 1)
            let newWord = Data.shared.verb[number]
            thirdWord.text = newWord.name
            Data.shared.verbUsed.append(newWord)
            Data.shared.collectionWords.append(newWord)
            Data.shared.verb.remove(at: number)
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
                Data.shared.finalCollectionWords = Data.shared.newCollectionWords
                Data.shared.newCollectionWords.removeAll()
                Data.shared.newCollectionWords = Data.shared.collectionWords
                Data.shared.collectionWords.removeAll()
                changeWord(firstWord)
                changeWord(secondWord)
                changeWord(thirdWord)
                self.collectionView1.reloadData()
                self.collectionView2.reloadData()
                self.collectionView3.reloadData()
            }
            totalTime -= 1
        } else {
            endTimer()
            Data.shared.teamsDone.append((Data.shared.teams.last)!)
            Data.shared.teams.removeLast()
            if Data.shared.teams.count > 0 {
                self.performSegue(withIdentifier: "nextroundsegue", sender: nil)
            } else {
                Data.shared.noun.append(contentsOf: Data.shared.nounUsed)
                Data.shared.place.append(contentsOf: Data.shared.placeUsed)
                Data.shared.verb.append(contentsOf: Data.shared.verbUsed)
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
        return String(format: "%2d:%02d", minutes, seconds)
    }
    
}

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "\(self)", comment: "")
    }
}
