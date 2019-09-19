//
//  ViewController.swift
//  Muve
//
//  Created by Luan Nguyen on 2019-09-17.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var backgroundImageView: UIImageView!
    var textLabelWithOnboardingMessage: UILabel!
    var challengeAcceptedButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }

    
   @objc func startChallenge () {
    
    let challengeController = CustomiseChallengeViewController()
    navigationController?.pushViewController(challengeController, animated: true)
    
    }
    
    func setupViews() {
        //Background Image for onboarding
        backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = #imageLiteral(resourceName: "onboarding_image")
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        
        //Button
        challengeAcceptedButton = UIButton()
        challengeAcceptedButton.translatesAutoresizingMaskIntoConstraints = false
        challengeAcceptedButton.setTitleColor(.white, for: .normal)
        challengeAcceptedButton.setTitle("Yes!", for: .normal)
                challengeAcceptedButton.backgroundColor = .blue
        challengeAcceptedButton.clipsToBounds = true
        challengeAcceptedButton.layer.cornerRadius = 12
        view.addSubview(challengeAcceptedButton)
        challengeAcceptedButton.addTarget(self, action: #selector(startChallenge), for: .touchUpInside)
        
        //Text label
        textLabelWithOnboardingMessage = UILabel()
        textLabelWithOnboardingMessage.translatesAutoresizingMaskIntoConstraints = false
        textLabelWithOnboardingMessage.text = "Are you ready to challenge yourself?\n Go ahead!"
        textLabelWithOnboardingMessage.numberOfLines = 0
        textLabelWithOnboardingMessage.textAlignment = .center
        textLabelWithOnboardingMessage.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        view.addSubview(textLabelWithOnboardingMessage)
        
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            challengeAcceptedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            challengeAcceptedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            challengeAcceptedButton.widthAnchor.constraint(equalToConstant: 150)
            ])
        
        NSLayoutConstraint.activate([
            textLabelWithOnboardingMessage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabelWithOnboardingMessage.bottomAnchor.constraint(equalTo: challengeAcceptedButton.topAnchor
                , constant: -20),
            textLabelWithOnboardingMessage.widthAnchor.constraint(equalToConstant: 200)
            
            ])
    }

}

extension UIViewController {
    func hideNavigationBar () {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        }
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
}


