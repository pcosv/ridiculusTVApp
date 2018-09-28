//
//  SplitViewController.swift
//  ridiculusTVApp
//
//  Created by René Melo de Lucena on 20/09/2018.
//  Copyright © 2018 René Melo de Lucena. All rights reserved.
//

import UIKit

class SplitViewController : UIViewController {
    @IBOutlet weak var splitLabel: UILabel!
    var teamNumber:Int = 0
    override func viewDidLoad() {
        teamNumber = Data.shared.teams.count
        splitLabel.text = String(format: "divide the players into %d groups, improvise one scene using random words from the screen and the team that makes the other laugh more wins!".localized(), teamNumber)
    }
    override func didReceiveMemoryWarning() {
    }
}
