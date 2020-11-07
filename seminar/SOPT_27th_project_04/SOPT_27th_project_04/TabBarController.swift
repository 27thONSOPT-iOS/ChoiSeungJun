//
//  TabBarController.swift
//  SOPT_27th_project_04
//
//  Created by june on 2020/11/07.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabs()
    }
    
    func setTabs() {
        guard let indigoVC = self.storyboard?.instantiateViewController(identifier: "IndigoViewController") as? IndigoViewController,
              let orangeVC = self.storyboard?.instantiateViewController(identifier: "OrangeViewController") as? OrangeViewController
        else {
            return
        }
        
        indigoVC.tabBarItem.title = "Indigo"
        indigoVC.tabBarItem.image = UIImage(systemName: "house")
        indigoVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        orangeVC.tabBarItem.title = "Profile"
        orangeVC.tabBarItem.image = UIImage(systemName: "person")
        orangeVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        setViewControllers([indigoVC, orangeVC], animated: true)
        
    }


}
