//
//  HomeVC.swift
//  AppBackFront
//
//  Created by John Pontes on 24/04/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
