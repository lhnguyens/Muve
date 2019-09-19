//
//  ThirdViewController.swift
//  Muve
//
//  Created by Luan Nguyen on 2019-09-19.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit
import VerticalCardSwiper

class ThirdViewController: UIViewController {
    
    //var selectedExcersies: String = "Squats"
    
    let questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        questionLabel.text = "How many more push will you do everyday?"
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        return questionLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
      

        
    }
    

  

}
