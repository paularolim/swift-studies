//
//  Question.swift
//  Quizzler
//
//  Created by Paula Rolim on 19/07/23.
//

import Foundation

struct Question {
    var question: String
    var answer: String
    
    init(q: String, a: String) {
        self.question = q
        self.answer = a
    }
}
