//
//  SecondQuestionViewController.swift
//  Muve
//
//  Created by Luan Nguyen on 2019-09-19.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit
import VerticalCardSwiper

class SecondQuestionViewController: UIViewController, VerticalCardSwiperDelegate, VerticalCardSwiperDatasource
    
{
    let cardSwiper: VerticalCardSwiper = {
        let cS = VerticalCardSwiper()
        cS.translatesAutoresizingMaskIntoConstraints = false
        cS.cardSpacing = 15
        cS.register(DaysCell.self, forCellWithReuseIdentifier: "daysCell")
        return cS
    }()
   
    let questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        questionLabel.text = "How long will you challenge yourself for?"
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        return questionLabel
    }()

    var daysLists: [Days] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        daysLists = createDays()
        addToSubView()
        setLayoutConstraints()
        
        cardSwiper.datasource = self
        cardSwiper.delegate = self

    
    }
    
    func addToSubView() {
        view.addSubview(questionLabel)
        view.addSubview(cardSwiper)

    }
    func setLayoutConstraints () {
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            questionLabel.widthAnchor.constraint(equalToConstant: 300)
            ])
        
        NSLayoutConstraint.activate([
            cardSwiper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardSwiper.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10),
            cardSwiper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardSwiper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardSwiper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    func createDays() -> [Days] {
        let option1 = Days(days: "100", backgroundColor: .magenta)
        let option2 = Days(days: "90", backgroundColor: .blue)
        let option3 = Days(days: "60", backgroundColor: .cyan)
        let option4 = Days(days: "30", backgroundColor: .lightGray)
        let option5 = Days(days: "10", backgroundColor: .orange)
        let option6 = Days(days: "7", backgroundColor: .purple)
        let option7 = Days(days: "3", backgroundColor: .brown)
        
        daysLists.append(option1)
        daysLists.append(option2)
        daysLists.append(option3)
        daysLists.append(option4)
        daysLists.append(option5)
        daysLists.append(option6)
        daysLists.append(option7)
        
        return daysLists
        
    }
    

    
}

//CARD section
extension SecondQuestionViewController {
    
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return daysLists.count
    }
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        
        if let cell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "daysCell", for: index) as? DaysCell {
            let item = daysLists[index]
            cell.getDays(days: item)
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            return cell
            
        }
        return CardCell()
    }
    
    
}
