//
//  EndGameViewController.swift
//  ridiculusTVApp
//
//  Created by René Melo de Lucena on 28/09/2018.
//  Copyright © 2018 René Melo de Lucena. All rights reserved.
//

import UIKit

class EngdGameViewController : UIViewController {
    
    @IBOutlet var labelWinner : UILabel!
    @IBOutlet var pointsWinner : UILabel!
    @IBOutlet weak var duckWinner: UIImageView!
    
    override func viewDidLoad() {
        //setWinner()
    }
    override func didReceiveMemoryWarning() {
        
    }
    func setWinner() {
        labelWinner.text = String(format: "Team %d".localized(), Data.shared.winner[0])
        pointsWinner.text = String(format: "%d points".localized(), Data.shared.winner[1])
        if Data.shared.winner[0] == "1" {
            duckWinner.image = UIImage(named: "BlueDuck")
        }
    }
}
