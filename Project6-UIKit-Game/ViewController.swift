//
//  ViewController.swift
//  Project2-UIKit-Game
//
//  Created by Ezequiel Parada Beltran on 09/07/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsNumber = 0
    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "germany", "spain", "us", "france", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "uk"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQUestion()
    }
    
    func askQUestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)

        title = "\(countries[correctAnswer].uppercased()) score: \(score)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            questionsNumber += 1
            message = "Nice one!"
        } else {
            title = "Wrong!"
            message = "That’s the flag of \(countries[sender.tag].uppercased())"
            score -= 1
            questionsNumber += 1
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ac2 = UIAlertController(title: "You have answered 10 times", message: "Final Score: \(score)", preferredStyle: .alert)
        
        if questionsNumber != 10 {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQUestion))
            present(ac, animated: true)
        }
        
        
        
        
        if questionsNumber == 10 {
            score = 0
            questionsNumber = 0
            ac2.addAction(UIAlertAction(title: "Comenzar de nuevo", style: .default, handler: askQUestion))
            present(ac2, animated: true)
        }
        
    }
    
    
}

