//
//  Music.swift
//  SOPT_27th_project_03
//
//  Created by june on 2020/10/31.
//

import UIKit

struct Music {
    var title: String
    var singer: String
    var albumImageName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: albumImageName)
    }
}
