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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.borderWidth = 3
        button2.layer.borderWidth = 3
        button3.layer.borderWidth = 3
        
        button1.layer.borderColor = UIColor.systemBlue.cgColor
        button2.layer.borderColor = UIColor.systemBlue.cgColor
        button3.layer.borderColor = UIColor.systemBlue.cgColor
        
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        //This needs to return an Alert to the user, so it needs an UIAlertAction input.
        countries.shuffle()
        //.normal is a struct / UIControlState
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "Find \(countries[correctAnswer].uppercased()). Current Score: \(score)"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        //@IBAction is similar to @IBOutlet, but goes the other way: @IBOutlet is a way of connecting code to storyboard layouts, and @IBAction is a way of making storyboard layouts trigger code.
        //This method takes one parameter, called sender. It's of type UIButton because we know that's what will be calling the method. And this is important: all three buttons are calling the same method, so it's important we know which button was tapped so we can judge whether the answer was correct.
        var title : String
        var pointValue : Int
        var pointMessage : String
        
        if sender.tag == correctAnswer{
            title = "You found the flag for \(countries[correctAnswer].uppercased())!"
            pointValue = 1
            pointMessage = "You earned \(String(pointValue)) point."
            score += pointValue
        }else{
            title = "Try again!"
            pointValue = 0
            pointMessage = "You did not earn any points."
            score -= pointValue
        }

        
        let ac = UIAlertController(title: title, message: pointMessage, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

