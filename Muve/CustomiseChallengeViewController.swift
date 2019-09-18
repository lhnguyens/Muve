//
//  CustomiseChallengeViewController.swift
//  Muve
//
//  Created by Luan Nguyen on 2019-09-18.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit

class CustomiseChallengeViewController: UIViewController {
    
    var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.title = "Step 1"
        
        setupQuestionLabel()
        setupConstraints()
    
        
    }
    
    func setupQuestionLabel() {
        
        questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        questionLabel.text = "What kind of excersise will you do?"
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        view.addSubview(questionLabel)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            questionLabel.widthAnchor.constraint(equalToConstant: 300)
            
            ])
    }
    
    
}
