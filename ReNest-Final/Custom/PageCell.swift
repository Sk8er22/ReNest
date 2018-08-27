//
//  PageCell.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 26/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//

import Foundation
import UIKit
class PageCell : BaseCell {
    var headerCell = "HeaderCell"
    var taskCell = "TaskCell"
    //BUILDER
    lazy  var tasksCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.968627451, blue: 0.9803921569, alpha: 1)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    //SETTER
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.brown
        tasksCollectionView.register(TaskCell.self, forCellWithReuseIdentifier: taskCell)
        tasksCollectionView.register(TasksHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader , withReuseIdentifier: headerCell)
        addSubview(tasksCollectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: tasksCollectionView)
        addConstraintsWithFormat(format: "V:|-22-[v0]|", views: tasksCollectionView)
        let collectionViewLayout = tasksCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.sectionInset = UIEdgeInsetsMake(0, 60, 20, 60)
    }
}
extension PageCell : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: taskCell, for: indexPath) as! TaskCell
        cell.backgroundColor = indexPath.row == 0 ? UIColor.red : UIColor.white
                cell.thumbnailImageView.isHidden = true
                cell.backgroundColor = UIColor().HexColor(hex: "FFFFFF")
        //if you wanna a rounded cell
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = 1.0
                cell.layer.borderColor = UIColor.clear.cgColor
                cell.layer.masksToBounds = true
                cell.separatorView.isHidden = true
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (frame.width - 16 - 16) * 9 / 16
        return CGSize(width: frame.width - 40, height: 69 )
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableView : UICollectionReusableView? = nil
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCell, for: indexPath as IndexPath) as! TasksHeaderCell
        view.titleLabel.text = "HIGH PRIORITY"
        view.titleLabel.font = UIFont(name: "Avenir", size: 13)
        view.gradientBackground(colorArray: [UIColor().HexColor(hex: "32315C").withAlphaComponent(0.06), UIColor().HexColor(hex: "F4F7FA").withAlphaComponent(0.06)], direction: .topToBottom)
        view.titleLabel.textColor = UIColor().HexColor(hex: "FF2765")
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = CGSize(width: 60, height: 50)
        return size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

