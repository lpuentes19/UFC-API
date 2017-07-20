//
//  UFCLaunchScreenViewController.swift
//  UFC-API
//
//  Created by Luis Puentes on 7/20/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class UFCLaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ufcImage.fadeOut()
        ufcImage.fadeIn()
        setupImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(transitionFromLaunchScreenToMainScreen), userInfo: nil, repeats: false)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func setupImage() {
        ufcImage.layer.cornerRadius = 5
        ufcImage.layer.masksToBounds = true
    }
    
    func transitionFromLaunchScreenToMainScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "launchMainScreen")
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var ufcImage: UIImageView!
}
