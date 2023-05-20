//
//  UIView+Extension.swift
//  AppBackFront
//
//  Created by John Pontes on 20/05/23.
//

import UIKit
import Foundation

extension UIView {
    func roundCorners(cornerRadiuns: Double,typeCorners: CACornerMask){
        self.layer.cornerRadius = CGFloat(cornerRadiuns)
        self.clipsToBounds = true
        self.layer.maskedCorners = typeCorners
    }
}
