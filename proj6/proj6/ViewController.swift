//
//  ViewController.swift
//  proj6
//
//  Created by STARKS on 10/28/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: ".txt")
        {
            
            if let startWords = try? String(contentsOf: startWordURL)
            {
                allWords = startWords.components(separatedBy: "\n")
            }
            
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        print(allWords.count)
        startGame()
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "word",for:indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
        
    }
    
    
    func startGame()
    {
        print("here")
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    @objc func promptForAnswer()
    {
        let ac = UIAlertController(title: "Enter the answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default){
            [weak self,weak ac] action in
            guard let answer = ac?.textFields?[0].text else {
                return
            }
            self?.submit(answer)
        }
        
        ac.addAction(submitAction)
        present(ac,animated: true)
        
        
    }
    func isPossible(word: String) -> Bool {
       guard var tempWord = title?.lowercased() else { return false }

       for letter in word {
           if let position = tempWord.firstIndex(of: letter) {
               tempWord.remove(at: position)
           } else {
               return false
           }
       }

       return true
    }

    func isOriginal(word: String) -> Bool {
      return !usedWords.contains(word)
    }

    func isReal(word: String) -> Bool {
        
        let checker = UITextChecker()
        let range  = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        
        return misspelledRange.location == NSNotFound
    }
    
    func submit(_ answer : String)
    {
        let loweredAnswer = answer.lowercased()
        let errorTitle: String
        let errorMessage: String
        
        if isPossible(word: loweredAnswer)
        {
            if isOriginal(word: loweredAnswer)
            {
                if isReal(word: loweredAnswer)
                {
                    usedWords.insert(loweredAnswer, at: 0)
                    
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    return
                }
                else {
                    errorTitle = "Word not recognised"
                    errorMessage = "You can't just make them up, you know!"
                }
                
            }else {
                errorTitle = "Word used already"
                errorMessage = "Be more original!"
            }
        }else {
            guard let title = title?.lowercased() else { return }
            errorTitle = "Word not possible"
            errorMessage = "You can't spell that word from \(title)"
        }
        
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac,animated:true)
            
    }


}

