//
//  BaseCell.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 25/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//

import UIKit
class BaseCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func  setupViews(){
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
