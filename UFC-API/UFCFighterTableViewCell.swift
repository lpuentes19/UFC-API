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
            self.nameLabel.text = self.fighter?.fullName
            self.weightClassLabel.text = self.fighter?.weightClass
            self.recordLabel.text = "Wins: \(String(describing: self.fighter?.wins)) - Losses: \(String(describing: self.fighter?.losses))"
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
