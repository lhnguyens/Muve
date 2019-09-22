//
//  HomeCell.swift
//  Muve
//
//  Created by Luan Nguyen on 2019-09-20.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import Foundation
import UIKit

class HomeCell: UITableViewCell {
    
    var amountOfRepsToDoForTodayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.text = "10"
        
//        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    var excersieLabel = UILabel()
    var timeLeftToFinishChallengeLabel: UILabel = {
        let label = UILabel()
        
        //DATE TEst
        var currentDateTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.text = "\(dateFormatter.string(from: currentDateTime)) left "
        label.textAlignment = .center
               label.numberOfLines = 0
       
        return label
    }()
    var daysLeftLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.text = "DAY 1/60"
        label.textAlignment = .center
               label.numberOfLines = 0
        return label
    }()
    
    var challengeCompletedButton: UIButton = {
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setTitle("I DID IT", for: .normal)
        label.setTitleColor(.white, for: .normal)
        label.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.backgroundColor = .purple
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addTheViews()
        configureExLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTheViews() {
        addSubview(excersieLabel)
        addSubview(amountOfRepsToDoForTodayLabel)
        addSubview(timeLeftToFinishChallengeLabel)
        addSubview(challengeCompletedButton)
        addSubview(daysLeftLabel)
        setConstraints()
    }
    
    func configureExLabel () {
        excersieLabel.translatesAutoresizingMaskIntoConstraints = false
        excersieLabel.numberOfLines = 0
        excersieLabel.adjustsFontSizeToFitWidth = true
        excersieLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        excersieLabel.text = "SQUATS"
        
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            amountOfRepsToDoForTodayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            amountOfRepsToDoForTodayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            amountOfRepsToDoForTodayLabel.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        NSLayoutConstraint.activate([
            excersieLabel.topAnchor.constraint(equalTo: amountOfRepsToDoForTodayLabel.bottomAnchor, constant: 7.5),
            excersieLabel.heightAnchor.constraint(equalToConstant: 20),
            excersieLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25)
           ])
        NSLayoutConstraint.activate([
            timeLeftToFinishChallengeLabel.topAnchor.constraint(equalTo: excersieLabel.bottomAnchor, constant: 7.5),
            timeLeftToFinishChallengeLabel.heightAnchor.constraint(equalToConstant: 20),
            timeLeftToFinishChallengeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25)
        ])
        NSLayoutConstraint.activate([
            daysLeftLabel.topAnchor.constraint(equalTo: timeLeftToFinishChallengeLabel.bottomAnchor, constant: 7.5),
            daysLeftLabel.heightAnchor.constraint(equalToConstant: 20),
        daysLeftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
        daysLeftLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)])
        

        NSLayoutConstraint.activate([
            
            challengeCompletedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            challengeCompletedButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            challengeCompletedButton.heightAnchor.constraint(equalToConstant: 30),
            challengeCompletedButton.widthAnchor.constraint(equalToConstant: 70)
        ])
        
    }
}
