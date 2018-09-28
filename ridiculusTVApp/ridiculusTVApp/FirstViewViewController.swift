//
//  FirstViewViewController.swift
//  ridiculusTVApp
//
//  Created by Flávia on 27/09/18.
//  Copyright © 2018 René Melo de Lucena. All rights reserved.
//

import UIKit
import Lottie
import AVFoundation

class FirstViewViewController: UIViewController, AVAudioPlayerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSong()
        
        let slimeAnimationView = LOTAnimationView(name: "gosma")
        slimeAnimationView.frame = CGRect(x: 0, y: 0, width: 1920, height: 980)
        slimeAnimationView.contentMode = .scaleAspectFill
        slimeAnimationView.loopAnimation = true

        slimeAnimationView.isUserInteractionEnabled = false
        
        view.addSubview(slimeAnimationView)
        slimeAnimationView.play()


        // Do any additional setup after loading the view.
    }
    
    func initialSong() {
        let filePath = Bundle.main.path(forResource: "ridiculusmusic", ofType: "wav")
        let audioURL = URL(fileURLWithPath: filePath!)
        do{
            Data.shared.player = try AVAudioPlayer(contentsOf: audioURL as URL)
            Data.shared.player?.prepareToPlay()
            Data.shared.player?.numberOfLoops = -1
            Data.shared.player?.play()
        } catch{
            print("Error: \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
