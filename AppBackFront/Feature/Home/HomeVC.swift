//
//  HomeVC.swift
//  AppBackFront
//
//  Created by John Pontes on 24/04/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    var homeViewModel: HomeViewModel?
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel = HomeViewModel()
        homeViewModel?.delegate(delegate: self)
        homeViewModel?.fetchRequest(.request)
    }
}

extension HomeVC: HomeViewModelProtocol {
    func success() {
        print(#function)
    }
    
    func error() {
        print(#function)
    }
}
