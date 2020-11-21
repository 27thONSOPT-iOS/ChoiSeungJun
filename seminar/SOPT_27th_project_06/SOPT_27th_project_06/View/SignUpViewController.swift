//
//  SignUpViewController.swift
//  SOPT_27th_project_06
//
//  Created by june on 2020/11/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didClickBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didClickSignUpButton(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let name = nameTextField.text else {
            return
        }
        
        ApiService.client.postSignUp(email: email, password: password, userName: name) { result in
            switch result {
            case .success(let data):
                print("success")
                if let res = data as? SignUp {
                    let alert = UIAlertController(title: "성공", message: "\(res.email) 성공", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "확인", style: .default) { (UIAlertAction) in
                        self.dismiss(animated: true, completion: nil)
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                }
            case .requestErr(let err):
                if let err = err as? String {
                    self.showAlert(title: "회원가입 실패", message: err)
                }
                print("requestErr: \(err)")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
