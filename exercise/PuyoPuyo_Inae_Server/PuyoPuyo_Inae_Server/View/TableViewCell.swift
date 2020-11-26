//
//  TableViewCell.swift
//  PuyoPuyo_Inae_Server
//
//  Created by june on 2020/11/26.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(inae: Inae) {
        idLabel.text = "\(inae.id)"
        nameLabel.text = inae.nickname
        
        thumbnailView.kf.setImage(with: URL(string: inae.url))
        thumbnailView.contentMode = .scaleAspectFill
    }

}
