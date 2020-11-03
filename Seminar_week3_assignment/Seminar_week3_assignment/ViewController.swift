//
//  ViewController.swift
//  Seminar_week3_assignment
//
//  Created by june on 2020/11/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileWriteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewAttr()
    }

    func setViewAttr() {
        profileWriteButton.layer.cornerRadius = 5
    }
    
}

