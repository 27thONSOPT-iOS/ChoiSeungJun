//
//  MusicInfoViewController.swift
//  SOPT_27th_project_03
//
//  Created by june on 2020/10/31.
//

import UIKit

class MusicInfoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    
    var music: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    func setLayout() {
        if let music = self.music {
            titleLabel.text = music.title
            artistLabel.text = music.singer
            albumImageView.image = music.makeImage()
        }
    }

}
