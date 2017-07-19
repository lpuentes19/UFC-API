//
//  UFCFighterTableViewCell.swift
//  UFC-API
//
//  Created by Luis Puentes on 7/18/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class UFCFighterTableViewCell: UITableViewCell {

    var fighter: UFCFighter? {
        didSet {
            
            guard let fullName = fighter?.fullName,
                let weightClass = fighter?.weightClass,
                let wins = fighter?.wins,
                let losses = fighter?.losses else { return }
            
            self.nameLabel.text = fullName
            self.weightClassLabel.text = weightClass
            self.recordLabel.text = "Wins: \(String(describing: wins)) - Losses: \(String(describing: losses))"
            self.setupThumbnailImage()
        }
    }
    
    func setupThumbnailImage() {
        if let thumbnailImageURL = fighter?.imageURL {
            guard let url = URL(string: thumbnailImageURL) else { return }
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                }
                
                DispatchQueue.main.async {
                    self.fighterImage.image = UIImage(data: data!)
                }
            })
            task.resume()
        }
    }

    @IBOutlet weak var fighterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightClassLabel: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
}
