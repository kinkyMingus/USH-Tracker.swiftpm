//
//  File.swift
//  USH Tracker 2
//
//  Created by DAVID SHOW on 11/10/25.
//
import Foundation
import SwiftData
@Model
class Stats {
    var pCorrect: Int = 0
    var pIncorrect: Int = 0
    var pAvg: Double = 0
    init(pCorrect: Int, pIncorrect: Int) {
        self.pCorrect = pCorrect
        self.pIncorrect = pIncorrect
        self.pAvg = Double(pCorrect) / Double(pCorrect + pIncorrect) * 100
    }
}

@Model
class Stats2 {
    var pCorrect: Int = 0
    var pIncorrect: Int = 0
    var pAvg: Double = 0
    init(pCorrect: Int, pIncorrect: Int) {
        self.pCorrect = pCorrect
        self.pIncorrect = pIncorrect
        self.pAvg = Double(pCorrect) / Double(pCorrect + pIncorrect) * 100
    }
}

