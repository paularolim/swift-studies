//
//  RecalculateController.swift
//  BMI
//
//  Created by Paula Rolim on 21/07/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var bmiValueLabel: UILabel!
    @IBOutlet weak var bmiAdviceLabel: UILabel!
    
    var bmiValue: String?
    var bmiAdvice: String?
    var bmiColor: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiValueLabel.text = bmiValue
        bmiAdviceLabel.text = bmiAdvice
        view.backgroundColor = bmiColor
    }
    
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
