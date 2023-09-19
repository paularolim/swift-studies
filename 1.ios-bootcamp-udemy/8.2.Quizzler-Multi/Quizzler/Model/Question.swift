//
//  Question.swift
//  Quizzler
//
//  Created by Paula Rolim on 19/07/23.
//

import Foundation

struct Question {
    var question: String
    var answer: [String]
    var correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.question = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
