//
//  ViewController.swift
//  Seminar_week2_assignment
//
//  Created by june on 2020/10/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileWriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setViewAttr()
    }
    
    func setViewAttr() {
        profileWriteButton.layer.cornerRadius = 5
    }


}

