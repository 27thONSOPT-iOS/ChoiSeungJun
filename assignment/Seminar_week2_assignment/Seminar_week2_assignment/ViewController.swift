//
//  ViewController.swift
//  Seminar_week2_assignment
//
//  Created by june on 2020/10/19.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var profileWriteButton: UIButton!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setViewAttr()
    }
    
    func setViewAttr() {
        scrollView.delegate = self
        profileWriteButton.layer.cornerRadius = 5
    }

    @IBAction func topButtonClicked(_ sender: UIButton!) {
        scrollView.scrollRectToVisible(CGRect(x:0, y: 0, width: 1, height: 1), animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y <= 0){
            topButton.isHidden = true
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        topButton.isHidden = false
    }
    
}

