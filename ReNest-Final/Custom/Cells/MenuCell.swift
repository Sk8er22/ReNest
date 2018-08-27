//
//  MenuCell.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 25/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//
import UIKit

//MenuBar Cell -- TAB VIEW CELL
class MenuCell : BaseCell {
    
    //UILabel Builder
    let textLabel : UILabel = {
        let text = UILabel()
        text.textColor = UIColor.gray
        return text
    }()
    
    //UILabel Setting
    override func setupViews() {
        super.setupViews()
        addSubview(textLabel)
        addConstraintsWithFormat(format: "V:[v0(28)]", views: textLabel)
        textLabel.sizeToFit()
        textLabel.adjustsFontSizeToFitWidth = true
        addConstraint(NSLayoutConstraint(item: textLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: textLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        backgroundColor = UIColor.white
    }
    
    //selected behavior of cell
    override var isHighlighted: Bool {
        didSet{
            textLabel.textColor = isHighlighted ? UIColor().HexColor(hex: "1D1D26") : UIColor.gray
        }
    }
    override var isSelected : Bool {
        didSet{
            textLabel.textColor = isSelected ? UIColor().HexColor(hex: "1D1D26") : UIColor.gray
        }
    }
    
}
