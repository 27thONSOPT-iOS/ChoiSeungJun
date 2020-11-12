//
//  ViewController.swift
//  Seminar_week1_assignment
//
//  Created by june on 2020/10/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var partTextLabel: UILabel!
    @IBOutlet weak var helloNameTextLabel: UILabel!
    
    var part: String?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setLabel()
    }


    @IBAction func loginBtnClicked(_ sender: Any) {
        guard let navVC = self.storyboard?.instantiateViewController(identifier: "NavigationController") else {
            return
        }
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
    func setLabel() {
        if let part = self.part,
           let name = self.name {
            self.partTextLabel.text = "파트    :    \(part)"
            self.helloNameTextLabel.text = "안녕하세요 ^^ \(name)님!"
        }
    }
    
}

