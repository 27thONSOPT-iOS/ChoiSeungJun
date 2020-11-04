//
//  PartBannerCell.swift
//  SOPT_27th_project_03
//
//  Created by june on 2020/10/31.
//

import UIKit

class PartBannerCell: UICollectionViewCell {
    static let identifier = "PartBannerCell"
    @IBOutlet weak var bannerImageView: UIImageView!
    
    func setImage(imageName: String) {
        bannerImageView.image = UIImage(named: imageName)
    }
}
