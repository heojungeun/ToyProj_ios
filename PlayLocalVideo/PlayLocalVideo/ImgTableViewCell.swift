//
//  ImgTableViewCell.swift
//  PlayLocalVideo
//
//  Created by jung on 2020/10/18.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class ImgTableViewCell: UITableViewCell {

    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
