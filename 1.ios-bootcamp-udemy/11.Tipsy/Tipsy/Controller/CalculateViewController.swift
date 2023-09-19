//
//  CalculateViewController.swift
//  Tipsy
//
//  Created by Paula Rolim on 21/07/23.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var bilTextField: UITextField!
    
    var tipValue: Float = 0.0
    var splitValue: Int = 2
    var billTotal: Float = 0
    
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        bilTextField.endEditing(true)
        
        var bill = bilTextField.text!
        bill = bill.replacingOccurrences(of: ",", with: ".")
        
        if bill != "" {
            billTotal = Float(bill)!
            
            calculator.calculate(total: billTotal, tip: tipValue, split: splitValue)
            
            performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultViewController
            destination.settings = calculator.getSettings()
            destination.total = calculator.getTotalPerPerson()
        }
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        bilTextField.endEditing(true)
        
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleAsNumber = String(buttonTitle.dropLast())
        tipValue = Float(buttonTitleAsNumber)! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        bilTextField.endEditing(true)
        
        splitValue = Int(sender.value)
        splitLabel.text = String(splitValue)
    }
}
