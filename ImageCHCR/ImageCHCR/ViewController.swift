//
//  ViewController.swift
//  ImageCHCR
//
//  Created by STARKS on 11/3/20.
//  Copyright © 2020 STARKS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
    
    func setupViews()
    {
            let image = makeImageView(named: "rush")
            let label = makeLabel(withText: "Title")
        let button = makeButton(withText: "Get Started")
        
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(button)
    

           // imageViews with content have intrinsic size
           image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
           image.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
           image.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

           label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8).isActive = true
           label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
           label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true

           button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 300).isActive = true
           button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
           button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    public func makeImageView(named: String) -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: named)
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 249),for: .vertical)
        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
  

        return view
    }

    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32)
        label.backgroundColor = .yellow

        return label
    }

    func makeButton(withText text: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.backgroundColor = .blue
        button.contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

        return button
    }


}

