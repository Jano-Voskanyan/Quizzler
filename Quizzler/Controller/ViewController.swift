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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    //The code written here works when the application is launched.
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True, False
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
        
        //progress Bar is equal question number(++1) + 1  / quiz count(12)
        progressBar.progress = quizBrain.getProgress()
        
        //
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        //at the next question and after the timer resets the red or green color to the standard
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}
