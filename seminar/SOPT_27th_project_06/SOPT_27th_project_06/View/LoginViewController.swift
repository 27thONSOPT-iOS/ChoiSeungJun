//
//  LoginViewController.swift
//  SOPT_27th_project_06
//
//  Created by june on 2020/11/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func didClickLoginButton(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {
            return
        }
        
        ApiService.client.postLogin(email: email, password: password) { result in
            switch result {
            case .success(let data):
                print("success")
                if let res = data as? Login {
                    self.showAlert(title: "로그인 성공", message: "\(res.userName)님 ㅎ2")
                    UserDefaults.standard.set(res.userName, forKey: "userName")
                }
            case .requestErr(let err):
                if let err = err as? String {
                    self.showAlert(title: "로그인 실패", message: err)
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
    
    @IBAction func didClickSignUpButton(_ sender: Any) {
        if let vc = UIStoryboard(name: "SignUp", bundle: nil).instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController {
            vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true, completion: nil)
            
        }
    }
}
