//
//  FourthViewController.swift
//  Muve
//
//  Created by Luan Nguyen on 2019-09-19.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit
import VerticalCardSwiper

class FourthViewController: UIViewController, VerticalCardSwiperDelegate, VerticalCardSwiperDatasource {
    
    
    
    
    var startingPoint: [StartingPoint] = []
    
    let questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        questionLabel.text = "How many will you begin with?"
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        return questionLabel
    }()
    
    let cardSwiper: VerticalCardSwiper = {
        let cs = VerticalCardSwiper()
        cs.translatesAutoresizingMaskIntoConstraints = false
        cs.cardSpacing = 15
        cs.register(StartingPointCell.self, forCellWithReuseIdentifier: "startingPointCell")
        return cs
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        startingPoint = createData()
        
        addViewsToScreen()
        setLayouts()
        
        cardSwiper.delegate = self
        cardSwiper.datasource = self
    }
    
    func addViewsToScreen() {
        view.addSubview(questionLabel)
        view.addSubview(cardSwiper)
    }
    
    func setLayouts() {
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
    
    func createData () -> [StartingPoint] {
        let option1 = StartingPoint(startingPoint: "1", backgroundColor: .green)
        let option2 = StartingPoint(startingPoint: "2", backgroundColor: .black)
        let option3 = StartingPoint(startingPoint: "4", backgroundColor: .cyan)
        let option4 = StartingPoint(startingPoint: "6", backgroundColor: .blue)
        let option5 = StartingPoint(startingPoint: "8", backgroundColor: .orange)
        let option6 = StartingPoint(startingPoint: "10", backgroundColor: .purple)
        let option7 = StartingPoint(startingPoint: "15", backgroundColor: .brown)
        
        startingPoint.append(option1)
        startingPoint.append(option2)
        startingPoint.append(option3)
        startingPoint.append(option4)
        startingPoint.append(option5)
        startingPoint.append(option6)
        startingPoint.append(option7)
        
        return startingPoint
        
    }
    
    
    
    
    
}

extension FourthViewController {
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return startingPoint.count
    }
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        
        if let cell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "startingPointCell", for: index) as? StartingPointCell {
            let item = startingPoint[index]
            cell.getStartingPoint(amount: item)
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            return cell
        }
        return CardCell()
    }
    func willSwipeCardAway(card: CardCell, index: Int, swipeDirection: SwipeDirection) {
        startingPoint.remove(at: index)
        let nextVC = HomeViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
