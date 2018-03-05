//
//  TakeSnapshot.swift
//  Project1-Checkpoint3
//
//  Created by Claire Koval and Danny Kim
//  Copyright © 2018 Claire Koval and Danny Kim. All rights reserved.
//

import Foundation
import UIKit

//Used for taking screenshot of image
extension UIView {
    func takeSnapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
