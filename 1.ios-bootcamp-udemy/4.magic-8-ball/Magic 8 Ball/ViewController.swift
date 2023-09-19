//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Paula Rolim on 05/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var answerImage: UIImageView!
    
    let images = ["ball1", "ball2", "ball3", "ball4", "ball5"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        let answer = Int.random(in: 0...4)
        
        answerImage.image = UIImage(imageLiteralResourceName: images[answer])
    }
}

