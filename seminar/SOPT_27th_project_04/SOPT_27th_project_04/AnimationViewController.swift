//
//  AnimationViewController.swift
//  SOPT_27th_project_04
//
//  Created by june on 2020/11/07.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet weak var uniview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initPosition() {
        uniview.frame = CGRect(x: 87, y: 111, width: 240, height: 128)
    }
    
    @IBAction func didTapStart(_ sender: Any) {
        UIView.animate(withDuration: 2.0, animations: {
            self.uniview.alpha = 0
            self.uniview.frame = CGRect(x: 0, y: 0, width: 240, height: 128)
        }, completion: { finished in
            UIView.animate(withDuration: 1.0, animations: {
                self.uniview.alpha = 1
                self.initPosition()
            })
            
        })
    }
}
