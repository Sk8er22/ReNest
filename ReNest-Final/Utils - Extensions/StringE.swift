//
//  StringE.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 27/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//
import UIKit
extension String{
    func strikeThrough()->NSAttributedString{
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}


