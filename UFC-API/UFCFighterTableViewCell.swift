//
//  UFCFighterTableViewCell.swift
//  UFC-API
//
//  Created by Luis Puentes on 7/18/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class UFCFighterTableViewCell: UITableViewCell {

    func updateFighter(with fighter: UFCFighter) {
//        fighterImage.image = nil
        nameLabel.text = fighter.fullName
        weightClassLabel.text = fighter.weightClass
        recordLabel.text = "Wins: \(fighter.wins) - Losses: \(fighter.losses)"
    }

    @IBOutlet weak var fighterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightClassLabel: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
}
