//
//  ViewController.swift
//  Dicee
//
//  Created by Paula Rolim on 05/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftDiceImage: UIImageView!
    @IBOutlet weak var rightDiceImage: UIImageView!
    
    let diceOptions = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rollTheDiceButton(_ sender: Any) {
        let leftIndex = Int.random(in: 0...5)
        let rightIndex = Int.random(in: 0...5)
        
        leftDiceImage.image = UIImage(imageLiteralResourceName: diceOptions[leftIndex])
        rightDiceImage.image = UIImage(imageLiteralResourceName: diceOptions[rightIndex])
    }
}

