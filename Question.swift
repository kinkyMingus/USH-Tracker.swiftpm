//
//  File.swift
//  USH Tracker
//
//  Created by DAVID SHOW on 11/6/25.
//

import Foundation

class Question {
    
    var question : String
    var answers = [String](repeating: "John Doe", count: 4)
    var image: String
    
    init(question: String, answers: [String], image: String) {
        self.question = question
        self.answers = answers
        self.image = image
    }
    
}
