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
    
    //create an array of question and answer with structures
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionNumber = 0
    
    //The code written here works when the application is launched.
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle //True, False
        let actualQuestion = quiz[questionNumber]
        let actualAnswer = actualQuestion.answer
        
        if userAnswer == actualAnswer {
            //sets the button background color to green if the ansfer is true
            sender.backgroundColor = UIColor.green
        } else {
            //sets the button background color to red if the answer is false
            sender.backgroundColor = UIColor.red
        }
        
        if questionNumber + 1 < quiz.count {
            //questionNumber reaches up to 2
            questionNumber += 1
        } else { //when questionNumber is equal to 3, questions are repeated
            questionNumber = 0
        }
        
        //timer for the color changes for 0.1 seconds before it becomes the standard
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    
    @objc func updateUI() { //when starting, it asks questions in turn
        questionLabel.text = quiz[questionNumber].text
        //at the next question and after the timer resets the red or green color to the standard
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        //progress Bar is equal question number(++1) + 1  / quiz count(12)
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
}
