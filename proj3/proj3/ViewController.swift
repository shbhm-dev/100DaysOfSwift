//
//  ViewController.swift
//  proj3
//
//  Created by STARKS on 10/25/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    func askQuestion(action : UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        btn1.setImage(UIImage(named: countries[0]), for: .normal)
        btn2.setImage(UIImage(named: countries[1]), for: .normal)
        btn3.setImage(UIImage(named: countries[2]), for: .normal)
        title = countries[correctAnswer].uppercased()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1.layer.borderWidth = 1
        btn2.layer.borderWidth = 1
        btn3.layer.borderWidth = 1
        
        btn1.layer.borderColor = UIColor.lightGray.cgColor
        
        btn2.layer.borderColor = UIColor.lightGray.cgColor
               
        btn3.layer.borderColor = UIColor.lightGray.cgColor
               
        
          countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        
        var title : String
        if sender.tag == correctAnswer
        {
            title = "Correct"
            score += 1
        }else
        {
            title = "Wrong"
            score -= 1
            
            
        }
        
        let ac = UIAlertController(title: title, message: "Your Score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac,animated : true)
        
    }
    


}

