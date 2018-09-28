//
//  PlayersViewController.swift
//  ridiculusTVApp
//
//  Created by René Melo de Lucena on 20/09/2018.
//  Copyright © 2018 René Melo de Lucena. All rights reserved.
//

import UIKit
class PlayersViewController : UIViewController {
    override func viewDidLoad() {
        Data.shared.teams.removeAll()
    }
    override func didReceiveMemoryWarning() {
    }
    var players:Int = 0
    var teamNumber = 0
    @IBOutlet var playersField : UITextField!
    @IBOutlet weak var playersLabel: UILabel!
    
    @IBAction func continueButton(_ sender: Any) {
        if playersField.text != "" {
            players = Int(playersField.text!)!
            if players < 3 {
                playersLabel.text = "Chame mais amigos para jogar!"
            } else if players <= 7 {
                //dois times
                teamNumber = 2
                Data.shared.numberOfTeams = teamNumber
                while teamNumber > 0 {
                  Data.shared.teams.append(Team(score: 0, id: teamNumber))
                    teamNumber -= 1
                }
                self.performSegue(withIdentifier: "playersSegue", sender: nil)

            } else {
                teamNumber = players/3
                if players%3 >= 2 {
                    teamNumber+=1
                }
                Data.shared.numberOfTeams = teamNumber

                while teamNumber > 0 {
                    Data.shared.teams.append(Team(score: 0, id: teamNumber))
                    teamNumber -= 1
                }
                self.performSegue(withIdentifier: "playersSegue", sender: nil)
            }
        }
    }
}
