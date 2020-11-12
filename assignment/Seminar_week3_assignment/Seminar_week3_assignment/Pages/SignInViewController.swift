//
//  SignInViewController.swift
//  Seminar_week3_assignment
//
//  Created by june on 2020/11/09.
//

import UIKit

class SignInViewController: UIViewController {
    
    var part: String?
    var name: String?

    @IBOutlet weak var partLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        partLabel.text = "로그인을 해주세요"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setResult()
    }

    @IBAction func didTapLoginButton(_ sender: Any) {
        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginViewController") else {
            return
        }
        
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
    
    func setResult() {
        if let part = self.part,
           let name = self.name {
            self.partLabel.text = "\(part) 파트의 \(name)님 하2"
        }
    }
    
}
