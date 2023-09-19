//
//  ViewController.swift
//  Destini
//
//  Created by Paula Rolim on 19/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        let userChoice = sender.currentTitle!
        
        storyBrain.makeChoice(userChoice)
        
        updateUI()
    }
    
    func updateUI() {
        let story = storyBrain.getStory()
        storyLabel.text = story.title
        choiceOne.setTitle(story.choice1, for: .normal)
        choiceTwo.setTitle(story.choice2, for: .normal)
    }
}

