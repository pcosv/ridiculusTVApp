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
    
    var appDelegate: AppDelegate?
    var isGameRunning = false

    override func viewDidLoad() {
        Data.shared.player?.stop()
        Data.shared.teamTurn = (Data.shared.teams.last?.id)!
        turnLabel.text = String(format: "It's team %d turn!".localized(), Data.shared.teamTurn)
        
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate

    }
    
    @IBAction func startGame(_ sender: UIButton) {
        print("entrou no start game")
        let messageNewGame = "New Game"
        let myNSDataNewGame = messageNewGame.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        
        let messageNumberTeams = String(Data.shared.numberOfTeams)
        print(messageNumberTeams)
        let myNSDataNumberTeams = messageNumberTeams.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        
        do {
            print(self.appDelegate?.mpcHandler?.session.connectedPeers)
            
            // manda mensagem com quantidade de times numa string
            try self.appDelegate?.mpcHandler?.session.send(myNSDataNumberTeams, toPeers: (self.appDelegate?.mpcHandler?.session.connectedPeers)!, with: MCSessionSendDataMode.reliable)
            // manda mensagem "New Game" numa string
            try self.appDelegate?.mpcHandler?.session.send(myNSDataNewGame, toPeers: (self.appDelegate?.mpcHandler?.session.connectedPeers)!, with: MCSessionSendDataMode.reliable)
        }
        catch let error {
            NSLog("%@", "Error for sending: \(error)")
        }
        
        self.isGameRunning = true;
        
    }
    
    override func didReceiveMemoryWarning() {
    }
}
