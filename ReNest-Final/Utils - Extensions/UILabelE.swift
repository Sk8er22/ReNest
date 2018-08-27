//
//  UILabelE.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 27/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//
import UIKit
extension UILabel {
    func strikeThrough() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
            attributedText = attributedString
        }
    }
}
