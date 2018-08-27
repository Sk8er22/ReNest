//
//  MenuBar.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 25/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//

import UIKit

class MenuBar : UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let titles = ["Tasks","Completed"]
    var horizontalDistanceBar: NSLayoutConstraint?
    var horizontalWidth: NSLayoutConstraint?
    var homeController : HomeController?
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        setupHorizontalBar()
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        //cv.backgroundColor = UIColor.blue
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    //Horizontal bar is the underline indicator
    func setupHorizontalBar(){
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor().HexColor(hex: "32315C")
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        //for get the bar in start position
        horizontalDistanceBar = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalDistanceBar?.isActive = true
        horizontalDistanceBar?.constant = 71.1968 // idk why if the bar dont get an inicial value, dont start correctly
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalWidth = horizontalBarView.widthAnchor.constraint(equalToConstant: 45.1064453125)
        horizontalWidth?.isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let label = UILabel()
        label.text = (collectionView.cellForItem(at: indexPath) as! MenuCell?)?.textLabel.text
        var rect: CGRect = label.frame //get frame of label
        rect.size = (label.text?.size(withAttributes: [kCTFontAttributeName as NSAttributedStringKey: UIFont(name: label.font.fontName , size: label.font.pointSize)!]))! //Calculate as per label font
        let dx = CGFloat(1) * rect.width
        //horizontalWidth?.constant = CGFloat(indexPath.item) * frame.width
        horizontalWidth?.constant = dx
        let x = (CGFloat(indexPath.item) * frame.width / 2) + (frame.width/2 - dx)/2
        horizontalDistanceBar?.constant = x
        UIView.animate(withDuration: 0.55, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {self.layoutIfNeeded()}, completion: nil)
        homeController?.scrollToMenuIndex(menuIndex: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.textLabel.text = titles[indexPath.row]
        //cell.backgroundColor = UIColor.brown
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/2, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


