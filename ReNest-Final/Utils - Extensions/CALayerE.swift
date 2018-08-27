//
//  CALayerE.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 26/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//
import UIKit

extension CALayer {
    public func configureGradientBackground(_ colors:CGColor...){
        
        let gradient = CAGradientLayer()
        
        let maxWidth = max(self.bounds.size.height,self.bounds.size.width)
        let squareFrame = CGRect(origin: self.bounds.origin, size: CGSize(width: maxWidth, height: maxWidth))
        gradient.frame = squareFrame
        
        gradient.colors = colors
        
        self.insertSublayer(gradient, at: 0)
    }
}
