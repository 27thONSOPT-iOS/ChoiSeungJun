//
//  ProfileViewCell.swift
//  Seminar_week3_assignment
//
//  Created by june on 2020/11/04.
//

import UIKit

class ProfileViewCell: UICollectionViewCell {
    static let identifier = "ProfileViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setCell(profile: Profile) {
        profileImageView.image = profile.makeImage()
        profileNameLabel.text = profile.name
        descriptionLabel.text = profile.description
    }
}
