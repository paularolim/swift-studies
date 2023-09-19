//
//  Calculator.swift
//  Tipsy
//
//  Created by Paula Rolim on 21/07/23.
//

import Foundation

struct Calculator {
    var bill: Bill?
    
    mutating func calculate(total: Float, tip: Float, split: Int) {
        let result = total * (1 + tip) / Float(split)
        bill = Bill(total: total, totalPerPerson: result, numberOfPeople: split, tip: tip)
    }
    
    func getTotal() -> String {
        return "$ \(bill?.total ?? 0.00)"
    }
    
    func getTotalPerPerson() -> String {
        return "$ \(String(format: "%.2f", bill?.totalPerPerson ?? 0.00))"
    }
    
    func getNumberOfPeople() -> String {
        return String(bill?.numberOfPeople ?? 0)
    }
    
    func getTip() -> String {
        if bill?.tip != nil {
            return "\(String(format: "%.0f", bill!.tip * 100.0))%"
        } else {
            return "0%"
        }
    }
    
    func getSettings() -> String {
        return "Split between \(getNumberOfPeople()) people, with \(getTip()) tip."
    }
}
