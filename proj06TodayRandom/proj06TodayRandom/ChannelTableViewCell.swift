//
//  ChannelTableViewCell.swift
//  proj06TodayRandom
//
//  Created by jung on 2022/10/24.
//  Copyright © 2022 jung. All rights reserved.
//

import UIKit

let ChannelTableViewCell_identifier = "ChannelTableViewCell"

class ChannelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var channelTitle: UILabel!
    @IBOutlet weak var channelContent: UILabel!
    
    var channelType: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(_ data: channel){
        channelTitle.text = data.title
        channelContent.text = data.content
        channelType = data.type
    }

}
