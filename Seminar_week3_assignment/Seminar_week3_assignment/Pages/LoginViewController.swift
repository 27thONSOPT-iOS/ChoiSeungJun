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
    @IBOutlet var rootView: UIView!
    
    var keyboardShown: Bool = false
    var originY: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShowNotification(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHideNotification(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    @objc func keyboardWillShowNotification(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if keyboardSize.height == 0.0 || keyboardShown == true {
                    return
                }

                UIView.animate(withDuration: 0.33, animations: { () -> Void in
                    if self.originY == nil { self.originY = self.rootView.frame.origin.y }
                    self.rootView.frame.origin.y = self.originY! - keyboardSize.height/3
                }, completion: { _ in
                    self.keyboardShown = true
                })
        }
    }
    
    @objc func keyboardWillHideNotification(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
              if keyboardShown == false {
                  return
              }

              UIView.animate(withDuration: 0.33, animations: { () -> Void in
                guard let originY = self.originY else { return }
                self.rootView.frame.origin.y = self.originY!
              }, completion: { _ in 
                    self.keyboardShown = false
              })
            }
    }
    
}
