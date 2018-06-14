//
//  ActorTableViewCell.swift
//  Machebara
//
//  Created by Lester  Padul on 13/06/2018.
//  Copyright © 2018 Lester  Padul. All rights reserved.
//

import UIKit

class ActorTableViewCell: UITableViewCell {
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var actorDescription: UILabel!
    @IBOutlet weak var actorChildren: UILabel!
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorBirthdate: UILabel!
    @IBOutlet weak var actorHeight: UILabel!
    @IBOutlet weak var actorCountry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
