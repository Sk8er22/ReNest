//
//  DoneCell.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 27/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//

//
//  PageCell.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 26/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//

import Foundation
import UIKit
class DoneCell : BaseCell {
    var taskCell = "TaskCell"
    //BUILDER
    lazy  var tasksCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.968627451, blue: 0.9803921569, alpha: 1)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor().HexColor(hex: "FFFFFF")
        return view
    }()
    
    //SETTER
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.brown
        tasksCollectionView.register(TaskCell.self, forCellWithReuseIdentifier: taskCell)
        
        addSubview(tasksCollectionView)
        addSubview(separatorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: tasksCollectionView)
        addConstraintsWithFormat(format: "V:|-22-[v0]-5-[v1(10)]|", views: tasksCollectionView, separatorView)
        let collectionViewLayout = tasksCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        
        collectionViewLayout?.sectionInset = UIEdgeInsetsMake(10, 60, 120, 60)
    }
}

extension DoneCell : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: taskCell, for: indexPath) as! TaskCell
        cell.thumbnailImageView.isHidden = true
        cell.checkImageView.isHidden = false
        var doneImage = UIImage(named: "Group")?.withRenderingMode(.alwaysOriginal)
        cell.titleLabel.strikeThrough()
        cell.titleLabel.textColor = UIColor.lightGray
        cell.titleLabel.alpha = 0.5
        cell.checkImageView.image = doneImage
        cell.checkImageView.layer.borderWidth = 0
        cell.backgroundColor = UIColor().HexColor(hex: "F4F7FA")
        
        //if you wanna a rounded cell
        cell.layer.cornerRadius = 10.0
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.masksToBounds = true
        cell.separatorView.isHidden = false
        cell.separatorView.backgroundColor = UIColor().HexColor(hex: "979797").withAlphaComponent(0.3)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (frame.width - 16 - 16) * 9 / 16
        return CGSize(width: frame.width - 40, height: 69 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

