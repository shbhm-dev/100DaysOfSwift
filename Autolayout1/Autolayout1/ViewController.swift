//
//  ViewController.swift
//  Autolayout1
//
//  Created by STARKS on 10/31/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView()
    {
        let label1 = makeLabel(withText: "Hey")
        let label2 = makeLabel(withText: "How")
        let label3 = makeLabel(withText: "Are")
        let label4 = makeLabel(withText: "You")
        let view1 = makeView()
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(view1)
        
        label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true

        label2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
         label2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true

        label3.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true

        label3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true

        label4.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true

        label4.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        

        
        view1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40).isActive = true
        view1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -40).isActive = true
        
        view1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive = true
           view1.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40).isActive = true
        
        
        
        
    }
    
    func makeLabel(withText text : String) -> UILabel
    {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        return label
    }
    
    func makeView() ->UIView   {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }

}

