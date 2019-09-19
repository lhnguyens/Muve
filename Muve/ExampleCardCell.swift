//
//  ExampleCardCell.swift
//  Muve
//
//  Created by Luan Nguyen on 2019-09-18.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import Foundation
import UIKit
import VerticalCardSwiper

class ExampleCardCell: CardCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func addLabel() {
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            
            textLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
           
            textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getCardInfo (exC: Excersises) {
        textLabel.text = exC.name
        contentView.backgroundColor = exC.backgroundColor
    }
    
}
