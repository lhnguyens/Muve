//
//  ThirdViewController.swift
//  Muve
//
//  Created by Luan Nguyen on 2019-09-19.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit
import VerticalCardSwiper

class ThirdViewController: UIViewController, VerticalCardSwiperDelegate, VerticalCardSwiperDatasource{
  
    
    var amountIncreasedOptions: [AmountIncreased] = []
    
    let questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        questionLabel.text = "How many more push will you do everyday?"
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        return questionLabel
    }()
    
    let cardSwiper: VerticalCardSwiper = {
        let cs = VerticalCardSwiper()
        cs.translatesAutoresizingMaskIntoConstraints = false
        cs.cardSpacing = 15
        cs.register(AmountIncreaseCell.self, forCellWithReuseIdentifier: "amountIncreased")
        return cs
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        amountIncreasedOptions = createData()
      
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
    
    func createData () -> [AmountIncreased] {
        let option1 = AmountIncreased(amount: "1", backgroundColor: .orange)
        let option2 = AmountIncreased(amount: "2", backgroundColor: .lightGray)
        let option3 = AmountIncreased(amount: "3", backgroundColor: .cyan)
        let option4 = AmountIncreased(amount: "4", backgroundColor: .blue)
        let option5 = AmountIncreased(amount: "5", backgroundColor: .magenta)
        let option6 = AmountIncreased(amount: "10", backgroundColor: .purple)
        let option7 = AmountIncreased(amount: "15", backgroundColor: .brown)
        
        amountIncreasedOptions.append(option1)
        amountIncreasedOptions.append(option2)
        amountIncreasedOptions.append(option3)
        amountIncreasedOptions.append(option4)
        amountIncreasedOptions.append(option5)
        amountIncreasedOptions.append(option6)
        amountIncreasedOptions.append(option7)
        
        return amountIncreasedOptions
        
    }
  

}

extension ThirdViewController {
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return amountIncreasedOptions.count
    }
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        
        if let cell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "amountIncreased", for: index) as? AmountIncreaseCell {
        let item = amountIncreasedOptions[index]
            cell.getAmountIncreased(amount: item)
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            return cell
        }
        return CardCell()
    }
    
    func willSwipeCardAway(card: CardCell, index: Int, swipeDirection: SwipeDirection) {
        amountIncreasedOptions.remove(at: index)
        let vc = FourthViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
