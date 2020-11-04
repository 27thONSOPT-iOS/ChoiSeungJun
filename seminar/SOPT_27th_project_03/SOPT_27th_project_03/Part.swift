//
//  Part.swift
//  SOPT_27th_project_03
//
//  Created by june on 2020/10/31.
//

import UIKit

struct Part {
    var imageName: String
    var partName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
