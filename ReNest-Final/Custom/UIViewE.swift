//
//  UIViewE.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 25/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//

import UIKit

enum GradientDirection {
    case leftToRight
    case rightToLeft
    case topToBottom
    case bottomToTop
}

extension UIView {
    func gradientBackground(colorArray: [UIColor], direction: GradientDirection) {
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colorArray.map({ $0.cgColor })
        
        switch direction {
        case .leftToRight:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .rightToLeft:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .bottomToTop:
            gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        default:
            break
        }
        
        self.layer.insertSublayer(gradient, at: 0)
    }
}
