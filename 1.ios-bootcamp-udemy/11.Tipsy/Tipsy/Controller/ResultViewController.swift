//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Paula Rolim on 21/07/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: String?
    
    var settings: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = total
        settingsLabel.text = settings
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
