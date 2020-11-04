//
//  Profile.swift
//  Seminar_week3_assignment
//
//  Created by june on 2020/11/04.
//

import UIKit

struct Profile {
    var name: String
    var description: String
    var imageName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
