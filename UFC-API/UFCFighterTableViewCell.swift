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
    
    let cacheImage = NSCache<AnyObject, AnyObject>()
    
    func setupThumbnailImage() {
        if let thumbnailImageURL = fighter?.imageURL {
            guard let url = URL(string: thumbnailImageURL) else { return }
            
            if let imageFromCache = cacheImage.object(forKey: thumbnailImageURL as AnyObject) as? UIImage {
                self.fighterImage.image = imageFromCache
                return
            }
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                }
                guard let data = data else { return }
                DispatchQueue.main.async {
                    guard let imageToCache = UIImage(data: data) else { return }
                    
                    self.cacheImage.setObject(imageToCache, forKey: thumbnailImageURL as AnyObject)
                    
                    self.fighterImage.image = imageToCache
                    
//                    self.fighterImage.image = UIImage(data: data)
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
