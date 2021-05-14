//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var timeLeftInSeconds: Int = 60
    var initialTime: Int = 30
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
  
    @IBOutlet weak var eggProgress: UIProgressView!
    @IBOutlet weak var eggReadiness: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        eggProgress.progress = 0
        timeLeftInSeconds = eggTimes[hardness]!
        initialTime = eggTimes[hardness]!
        
        eggReadiness.text = "Your \(hardness) egg is in progress..."
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if timeLeftInSeconds > 0 {
            print("\(timeLeftInSeconds) seconds.")
            timeLeftInSeconds -= 1
            let progressPercentage = Float(timeLeftInSeconds) / Float(initialTime)
            eggProgress.progress = 1 - progressPercentage
            print(eggProgress.progress)
        } else {
            eggReadiness.text = "Done!"
            eggProgress.progress = 1
            timer.invalidate()
        }
    }

}
