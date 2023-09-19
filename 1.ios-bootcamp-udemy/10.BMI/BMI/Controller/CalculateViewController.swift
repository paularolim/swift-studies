//
//  CalculateController.swift
//  BMI
//
//  Created by Paula Rolim on 21/07/23.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onHeightSliderChange(_ sender: UISlider) {
        let formatted = String(format: "%.2f", sender.value)
        heightLabel.text = "\(formatted)m"
    }
    
    
    @IBAction func onWeightSliderChange(_ sender: UISlider) {
        let formatted = String(format: "%.0f", sender.value)
        weightLabel.text = "\(formatted)kg"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculator.calculate(height: height, weight: weight)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultViewController
            destination.bmiValue = calculator.getBMIValue()
            destination.bmiAdvice = calculator.getBMIAdvice()
            destination.bmiColor = calculator.getBMIColor()
        }
    }
}
