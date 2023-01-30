//
//  ViewController.swift
//  Quizzler
//
//  Created by Janibek Voskanyan on 28.01.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    var quizBrain = QuizBrain()
    
    //The code written here works when the application is launched.
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //Choice 1, 2, 3
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            //sets the button background color to green if the ansfer is true
            sender.backgroundColor = UIColor.green
        } else {
            //sets the button background color to red if the answer is false
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        //timer for the color changes for 0.1 seconds before it becomes the standard
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    
    @objc func updateUI() {
        //when starting, it asks questions in turn
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswer()
        
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        
        //progress Bar is equal question number(++1) + 1  / quiz count(12)
        progressBar.progress = quizBrain.getProgress()
        
        //
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        //at the next question and after the timer resets the red or green color to the standard
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
}
