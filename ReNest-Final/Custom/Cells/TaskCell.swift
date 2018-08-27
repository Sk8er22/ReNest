//
//  TasksCell.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 25/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//
import UIKit
import Foundation

//To-do Tasks cell
class TaskCell : BaseCell{
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    
    //BUILDERS
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Tasks Tasks Tasks"
        label.textColor = UIColor().HexColor(hex: "#32315C")
        //label.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkImageView: UIImageView = {
        let imageView = UIImageView()
        var image = UIImage(named: "Group")?.withRenderingMode(.alwaysOriginal)
        
        imageView.image = image
        imageView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor().HexColor(hex: "32315C").cgColor
        imageView.layer.borderWidth = 1
        imageView.image = imageView.image?.alpha(0.0)
        return imageView
    }()
    
    
    //SETTING IN CELL
    override func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(checkImageView)
        addSubview(titleLabel)
        thumbnailImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 0)
        
        //VERTICAL
        addConstraintsWithFormat(format: "V:|-16-[v0(30)]-16-[v1(1)]|", views: checkImageView,separatorView)
        //HORIZONTAL
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        addConstraintsWithFormat(format: "H:|-16-[v0(30)]|", views: checkImageView)
        //TOP
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //LEFT constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: checkImageView, attribute: .right, multiplier: 1, constant: 8))
        //RIGHT constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //HEIGHT constraint
        titleLabelHeightConstraint = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
        addConstraint(titleLabelHeightConstraint!)
    }
    
    
    
}
