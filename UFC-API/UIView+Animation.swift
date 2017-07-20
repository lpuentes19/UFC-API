//
//  UIView+Animation.swift
//  UFC-API
//
//  Created by Luis Puentes on 7/20/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    
    func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 1.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)  }
    
    func fadeOut(duration: TimeInterval = 1.0, delay: TimeInterval = 3.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
}
