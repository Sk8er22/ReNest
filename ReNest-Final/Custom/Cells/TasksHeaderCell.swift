//
//  TasksHeaderCell.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 25/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//
import UIKit

class TasksHeaderCell: UICollectionReusableView  {
    
    var headerTitles = ["High", "Normal", "Low"]
    
    
    override init(frame: CGRect)    {
        super.init(frame: frame)
        setupHeaderViews()
    }
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Alta"
        title.textColor = .gray
        title.font = UIFont(name: "Avenir", size: 8)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    func setupHeaderViews()   {
        
        addSubview(titleLabel)
        addConstraintsWithFormat(format: "H:|-40-[v0]|", views: titleLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: titleLabel)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
