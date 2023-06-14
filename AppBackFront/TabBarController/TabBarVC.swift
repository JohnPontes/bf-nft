//
//  TabBarVC.swift
//  AppBackFront
//
//  Created by John Pontes on 24/04/23.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let homeVC = HomeVC()
        let walletVC = WalletVC()
        
        let home = UINavigationController(rootViewController: homeVC)
        let wallet = UINavigationController(rootViewController: walletVC)
        setViewControllers([home, wallet], animated: false)
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)

        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(systemName: "trash")
        items[1].image = UIImage(systemName: "wallet.pass")
    }
}
