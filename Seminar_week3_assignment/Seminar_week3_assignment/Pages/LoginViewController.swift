//
//  LoginViewController.swift
//  Seminar_week3_assignment
//
//  Created by june on 2020/11/09.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        let presentVC = self.presentingViewController as? UITabBarController
        presentVC?.selectedIndex = 0
        
        guard let signInVC = presentVC?.selectedViewController as? SignInViewController else {
            return
        }
        signInVC.part = self.partTextField.text
        signInVC.name = self.nameTextField.text

        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
