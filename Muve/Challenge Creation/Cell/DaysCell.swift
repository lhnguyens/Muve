//
//  DaysCell.swift
//  Muve
//
//  Created by Luan Nguyen on 2019-09-19.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import Foundation
import VerticalCardSwiper

class DaysCell: CardCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func addLabel() {
        contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            
            textLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
    }
    
    func getDays (days: Days) {
        textLabel.text = days.days
        contentView.backgroundColor = days.backgroundColor
        contentView.layer.opacity = 0.85
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
