//
//  TurnViewController.swift
//  ridiculusTVApp
//
//  Created by René Melo de Lucena on 20/09/2018.
//  Copyright © 2018 René Melo de Lucena. All rights reserved.
//

import UIKit

class TurnViewController : UIViewController {
    @IBOutlet var turnLabel : UILabel!
    var teamTurn = 0
    
    override func viewDidLoad() {
        teamTurn = (Data.shared.teams.last?.id)!
        turnLabel.text = "It's team \(teamTurn) turn!"
        Data.shared.collectionWords.removeAll()
        Data.shared.newCollectionWords.removeAll()
        Data.shared.finalCollectionWords.removeAll()
    }
    
    override func didReceiveMemoryWarning() {
    }
}
