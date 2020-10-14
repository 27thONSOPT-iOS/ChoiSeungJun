//
//  LoginViewController.swift
//  Seminar_week1_assignment
//
//  Created by june on 2020/10/14.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Login"
    }
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        let presentVC = self.presentingViewController
        
        guard let mainVC = presentVC as? ViewController else {
            return
        }
        
        mainVC.part = self.partTextField.text
        mainVC.name = self.nameTextField.text
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBtnClicked(_ sender: Any) {
        guard let signUpVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") else {
            return
        }
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
