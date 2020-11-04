//
//  TableViewCell.swift
//  SOPT_27th_project_03
//
//  Created by june on 2020/10/31.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"

    @IBOutlet weak var rankImageView: UIImageView!
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(rank: Int, music: Music) {
        rankImageView.image = music.makeImage()
        rankLabel.text = "\(rank + 1)"
        titleLabel.text = music.title
        artistLabel.text = music.singer
    }

}
