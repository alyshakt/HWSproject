//
//  ViewController.swift
//  HWSproject
//
//  Created by Alysha Kester-Terry on 12/27/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var totalGuesses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.borderWidth = 3
        button2.layer.borderWidth = 3
        button3.layer.borderWidth = 3
        
        button1.layer.borderColor = UIColor.systemTeal.cgColor
        button2.layer.borderColor = UIColor.systemTeal.cgColor
        button3.layer.borderColor = UIColor.systemTeal.cgColor
        
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        checkMaxGuesses()
        //This needs to return an Alert to the user, so it needs an UIAlertAction input.
        countries.shuffle()
        //.normal is a struct / UIControlState
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "Find \(countries[correctAnswer]). Current Score: \(score)"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        //@IBAction is similar to @IBOutlet, but goes the other way: @IBOutlet is a way of connecting code to storyboard layouts, and @IBAction is a way of making storyboard layouts trigger code.
        //This method takes one parameter, called sender. It's of type UIButton because we know that's what will be calling the method. And this is important: all three buttons are calling the same method, so it's important we know which button was tapped so we can judge whether the answer was correct.
        var title : String
        var pointValue : Int
        var pointMessage : String
        
        if sender.tag == correctAnswer{
            title = "You found the flag for \(countries[correctAnswer])!"
            pointValue = 1
            pointMessage = "You earned \(String(pointValue)) point."
            score += pointValue
            totalGuesses += 1
        }else{
            title = "Try again!"
            pointValue = 0
            pointMessage = "You did not earn any points."
            score -= pointValue
            totalGuesses += 1
        }
        
        let ac = UIAlertController(title: title, message: pointMessage, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
    }
    
    func checkMaxGuesses(){
        var titleToShow : String
        let maxScore = 5
        if totalGuesses == maxScore{
            if score == maxScore{
                titleToShow = "WOW! You nailed it!"
            }else{
                titleToShow = "Game Over! Try Again?"
            }
        let acDone = UIAlertController(title: titleToShow, message: "You earned a total of \(String(score)) points.", preferredStyle: .alert)
            acDone.addAction(UIAlertAction(title: "Restart", style: .destructive, handler: askQuestion))
        present(acDone, animated: true)
        totalGuesses = 0
        score = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

