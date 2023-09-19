//
//  Calculator.swift
//  BMI
//
//  Created by Paula Rolim on 21/07/23.
//

import UIKit

struct Calculator {
    var bmi: BMI?
    
    mutating func calculate(height: Float, weight: Float) {
        let result = weight / pow(height, 2)
        
        if result < 18.5 {
            bmi = BMI(value: result, advice: "Eat more pies!", color: UIColor.blue)
        } else if result < 24.9 {
            bmi = BMI(value: result, advice: "Fit as a fiddle!", color: UIColor.green)
        } else {
            bmi = BMI(value: result, advice: "Eat less pies!", color: UIColor.red)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getBMIAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getBMIColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
