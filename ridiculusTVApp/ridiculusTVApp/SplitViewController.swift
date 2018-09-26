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
        splitLabel.text = String(format: "Split in %d teams".localized(), teamNumber)
    }
    override func didReceiveMemoryWarning() {
    }
}
