//
//  OptionsViewController.swift
//  ridiculusTVApp
//
//  Created by René Melo de Lucena on 24/09/2018.
//  Copyright © 2018 René Melo de Lucena. All rights reserved.
//

import UIKit
class OptionsViewController: UIViewController {
    override func viewDidLoad() {
    }
    override func didReceiveMemoryWarning() {
    }
    @IBOutlet weak var soundOutlet: UILabel!
    
    @IBOutlet weak var languageOutlet: UILabel!
    
    @IBAction func changeSound(_ sender: Any) {
        if soundOutlet.text == "On" || soundOutlet.text == "Ativados" {
            soundOutlet.text = "Off"
        } else {
            soundOutlet.text = "On"
        }
    }
    @IBAction func changeLanguage(_ sender: Any) {
        if languageOutlet.text == "English" || languageOutlet.text == "Inglês" {
            languageOutlet.text = "Português"
        } else {
            languageOutlet.text = "English"
        }
    }
    
    
}
