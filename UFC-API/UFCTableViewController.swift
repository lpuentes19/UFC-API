//
//  UFCTableViewController.swift
//  UFC-API
//
//  Created by Luis Puentes on 7/18/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class UFCTableViewController: UITableViewController {

    var fightersArray: [UFCFighter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFighter { (_) in
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fightersArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "fighterCell", for: indexPath) as? UFCFighterTableViewCell else { return UITableViewCell() }
        
        cell.fighter = fightersArray[indexPath.row]
        
        return cell
    }
    
//    func sortFighters() {
//        fetchFighter { (fighters) in
//            let sortedFighters = fighters?.sorted {
//                guard let wins0 = $0.0.wins,
//                    let wins1 = $0.1.wins,
//                    let losses0 = $0.0.losses,
//                    let losses1 = $0.1.losses else {return false}
//                return wins0 / losses0 + 1 > wins1 / losses1 + 1
//            }
//            self.fightersArray = sortedFighters!
//        }
//    }
    
    func fetchFighter(completion: @escaping ([UFCFighter]?) -> Void) {
        guard let url = URL(string: "http://ufc-data-api.ufc.com/api/v1/us/fighters") else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) -> Void in
            
            if error != nil {
                print(error!.localizedDescription)
                completion(nil)
            } else {
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                    
                    for dictionary in json as! [[String: Any]] {
                        
                        var fighters = UFCFighter()
                        fighters.firstName = dictionary["first_name"] as? String
                        fighters.lastName = dictionary["last_name"] as? String
                        fighters.weightClass = dictionary["weight_class"] as? String
                        fighters.wins = dictionary["wins"] as? Int
                        fighters.losses = dictionary["losses"] as? Int
                        fighters.imageURL = dictionary["thumbnail"] as? String
                        self.fightersArray.append(fighters)
                        completion(self.fightersArray)
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                }
            }
        })
        task.resume()
    }
}
