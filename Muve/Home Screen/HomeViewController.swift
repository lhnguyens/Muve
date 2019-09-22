//
//  HomeViewController.swift
//  Muve
//
//  Created by Luan Nguyen on 2019-09-20.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
    
    var tableView: UITableView = {
        let tbView = UITableView()
        tbView.register(HomeCell.self, forCellReuseIdentifier: "homeCell")
        return tbView
    }()
 

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       setupNavigationStyle()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
             tableView.pin(to: view)
        
             tableView.delegate = self
             tableView.dataSource = self
    }
    
    func setupNavigationStyle () {
        self.navigationItem.hidesBackButton = true
        navigationController?.showNavigationBar()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationItem.leftBarButtonItem  = UIBarButtonItem(title: "Manage", style: .plain, target: self, action: nil)
        title = "Today"
    }
    

  
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as?  HomeCell
        
        cell?.selectionStyle = .none
        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    
    
}
