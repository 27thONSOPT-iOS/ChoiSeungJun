//
//  TabBarViewController.swift
//  Seminar_week3_assignment
//
//  Created by june on 2020/11/09.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        guard let signInVC = self.storyboard?.instantiateViewController(identifier: "SignInViewController") as? SignInViewController,
              let netVC = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController
        else {
            return
        }
        
        signInVC.tabBarItem.title = "로그인"
        signInVC.tabBarItem.image = UIImage(systemName: "house")
        
        netVC.tabBarItem.title = "네트워킹"
        netVC.tabBarItem.image = UIImage(systemName: "person")
        
        setViewControllers([signInVC, netVC], animated: true)
    }

}
