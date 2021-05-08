//
//  Invest.swift
//  TurkInvests
//
//  Created by Emre on 4.11.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit

class InvestCell: UITableViewCell {
    
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var propertieslbl: UILabel!
    @IBOutlet weak var imgview: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
