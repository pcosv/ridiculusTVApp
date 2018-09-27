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
    @IBOutlet weak var turnButtonLabel: UIButton!
    
    override func viewDidLoad() {
        Data.shared.teamTurn = (Data.shared.teams.last?.id)!
        turnLabel.text = String(format: "It's team %d turn!".localized(), Data.shared.teamTurn)
    }
    
    override func didReceiveMemoryWarning() {
    }
}
