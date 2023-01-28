//
//  Question.swift
//  Quizzler
//
//  Created by Janibek Voskanyan on 28.01.23.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
