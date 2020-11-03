//
//  ViewController.swift
//  CHCR
//
//  Created by STARKS on 11/1/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    func setupViews()
    {
        let nameLabel = makeLabel(withText: "Name")
        let textFeild = maketextFeild(withlaceHolder: "Enter the name")
        
        view.addSubview(nameLabel)
        view.addSubview(textFeild)
        nameLabel.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: 8).isActive = true
        
        textFeild.leadingAnchor.constraint(lessThanOrEqualTo: nameLabel.trailingAnchor, constant:10).isActive = true
        
        textFeild.firstBaselineAnchor.constraint(equalTo: nameLabel.firstBaselineAnchor).isActive = true
        
        textFeild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        nameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        
    }
    
    func makeLabel(withText text : String) -> UILabel {
       
        let label = UILabel()
        label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.text = text
        return label
        
    }
    
    func maketextFeild(withlaceHolder text : String) -> UITextField{
        let textFeild = UITextField()
        textFeild.translatesAutoresizingMaskIntoConstraints = false
        textFeild.placeholder = text
        textFeild.backgroundColor = .lightGray
        return textFeild
    }


}

