//
//  ViewController.swift
//  Quizzler
//
//  Created by Janibek Voskanyan on 28.01.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    //create an array of question and answer
    let quiz = [
        ["4 + 2 = 6", "True"],
        ["5 - 3 > 1", "True"],
        ["3 + 8 < 10", "False"]
    ]
    
    var questionNumber = 0
    
    //The code written here works when the application is launched.
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle //True, False
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer {
            print("Right!")
        } else {
            print("Wrong!")
        }
        
        if questionNumber + 1 < quiz.count { //questionNumber reaches up to 2
            questionNumber += 1
        } else { //when questionNumber is equal to 3, questions are repeated
            questionNumber = 0
        }
        updateUI()
    }
    
    func updateUI() { //when starting, it asks questions in turn
        questionLabel.text = quiz[questionNumber][0]
    }
}

