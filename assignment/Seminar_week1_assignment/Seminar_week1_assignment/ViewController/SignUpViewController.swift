//
//  SignUpViewController.swift
//  Seminar_week1_assignment
//
//  Created by june on 2020/10/14.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sign Up"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
