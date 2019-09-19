//
//  CustomiseChallengeViewController.swift
//  Muve
//
//  Created by Luan Nguyen on 2019-09-18.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit
import VerticalCardSwiper

class CustomiseChallengeViewController: UIViewController, VerticalCardSwiperDatasource, VerticalCardSwiperDelegate {
    
    
    var cardSwiper: VerticalCardSwiper!
    
    var excersiseList: [Excersises] = []
    
    
    var questionLabel: UILabel!
    
    var arrayOfButtons: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        excersiseList = createData()
        setupCardView()
        setupQuestionLabel()
        setupConstraints()
        cardSwiper.datasource = self
     
    }
    
    func setupCardView() {
        
        cardSwiper = VerticalCardSwiper()
        cardSwiper.translatesAutoresizingMaskIntoConstraints = false
        
        cardSwiper.cardSpacing = 15
        
        view.addSubview(cardSwiper)
        cardSwiper.register(ExampleCardCell.self, forCellWithReuseIdentifier: "cellCard")
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
        
        NSLayoutConstraint.activate([
            cardSwiper!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardSwiper!.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10),
            cardSwiper!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardSwiper!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardSwiper!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return excersiseList.count
        }
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
       
        
        if let cardCell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "cellCard", for: index) as? ExampleCardCell {
            let item = excersiseList[index]
            cardCell.backgroundColor = .blue
            cardCell.getCardInfo(exC: item)
            cardCell.layer.cornerRadius = 10
            cardCell.layer.masksToBounds = true

            return cardCell
            
        }
        return CardCell()
        
    }
    
    func createData () -> [Excersises] {
        let pushUp = Excersises(name: "Push Ups", backgroundColor: .blue)
        let squat = Excersises(name: "Squats", backgroundColor: .magenta)
        let sitUp = Excersises(name: "Sit Ups", backgroundColor: .cyan)
        let burpees = Excersises(name: "Burpees", backgroundColor: .orange)
        
        excersiseList.append(pushUp)
        excersiseList.append(squat)
        excersiseList.append(sitUp)
        excersiseList.append(burpees)
        
        return excersiseList
    }
}

