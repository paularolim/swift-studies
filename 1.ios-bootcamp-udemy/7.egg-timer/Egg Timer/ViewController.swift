//
//  ViewController.swift
//  Egg Timer
//
//  Created by Paula Rolim on 06/07/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggsTimes = ["Soft": 0.1, "Medium": 7, "Hard": 12] // in minutes
    var timer = Timer()
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func hardnessButtonPressed(_ sender: UIButton) {
        let title = sender.currentTitle!
        let totalTime = eggsTimes[title]! * 60
        var counter = totalTime
        
        titleLabel.text = title
        progressBar.progress = 1.0
        
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { Timer in
            if counter > 0 {
                let percentage = Float(counter / totalTime)
                self.progressBar.progress = percentage
                counter -= 1
            } else {
                self.titleLabel.text = "Done!"
                self.progressBar.progress = 0
                self.playSound(soundName: "alarm_sound")
                Timer.invalidate()
            }
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

