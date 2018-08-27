//
//  ViewController.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 24/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //Vars
    let pageCell = "pageCell"
    let doneCell = "doneCell"
    lazy var listOfCells = [pageCell, doneCell]
    var currentPage : CGFloat = 0.0
    var oldPage : CGFloat = 0.0
    
    lazy var menuBar : MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        return mb
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupMenuBar()
        setupNavBarButtons()
    }
    
    //Important so the bar start correctly
    override func viewDidAppear(_ animated: Bool) {
        menuBar.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .left)
        menuBar.collectionView.delegate?.collectionView!(menuBar.collectionView, didSelectItemAt: IndexPath(item: 0, section: 0))
    }
    
    
    func setupCollectionView(){
        let collectionViewLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.invalidateLayout()
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
    
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: pageCell)
        collectionView?.register(DoneCell.self, forCellWithReuseIdentifier: doneCell)
        collectionView?.backgroundColor = UIColor().HexColor(hex: "F4F7FA")
        collectionView?.register(TaskCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.contentInset = UIEdgeInsetsMake(150, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(110, 0, 0, 0)
        
        collectionView?.isPagingEnabled = true
    }
    
    private func setupMenuBar() {
        let whiteView = UIView()
        whiteView.backgroundColor = UIColor.white
        view.addSubview(whiteView)
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
        view.addSubview(searchBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: whiteView)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: whiteView)
        navigationController?.hidesBarsOnSwipe = true
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: searchBar)
        
        view.addConstraintsWithFormat(format: "V:|[v0(50)]-[v1(50)]", views: searchBar,menuBar)
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuBar.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
    }
    
    private func setupNavBarButtons(){
        //Basic stuff Nav
        navigationItem.title = "ReNest"
        navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        //Loading & Setting LEFT button
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        menuBtn.setImage(UIImage(named: "Menu"), for: .normal)
        menuBtn.addTarget(self, action: #selector(handleAdd), for: UIControlEvents.touchUpInside)
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        let currW = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 24)
        currW?.isActive = true
        let currH = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 24)
        currH?.isActive = true
        navigationItem.leftBarButtonItem = menuBarItem
        
        //Loading & Setting Right Button
        let rightBtn = UIButton(type: .custom)
        rightBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        rightBtn.setImage(UIImage(named: "realAdd"), for: .normal)
        rightBtn.addTarget(self, action: #selector(handleAdd), for: UIControlEvents.touchUpInside)
        let rightBtnItem = UIBarButtonItem(customView: rightBtn)
        let currWidth = rightBtnItem.customView?.widthAnchor.constraint(equalToConstant: 24)
        currWidth?.isActive = true
        let currHeight = rightBtnItem.customView?.heightAnchor.constraint(equalToConstant: 24)
        currHeight?.isActive = true
        navigationItem.rightBarButtonItem = rightBtnItem
    }
    
    
    
    //Navigation bar items call
    @objc func handleAdd() {
        let viewController = UIStoryboard(
            name: "Main", bundle: nil
            ).instantiateViewController(withIdentifier: "AddTaskController") as! AddTaskController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    //First CV have the main 2 Tabs (To-do, and done)
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    //To implement
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    //Scroll from menu to CV
    func scrollToMenuIndex(menuIndex : Int){
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: [], animated: true)
    }

    
    //Changing between view in each tab
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: doneCell, for: indexPath)
            cell.backgroundColor = indexPath.row == 0 ? UIColor.red : UIColor.white
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pageCell, for: indexPath)
            cell.backgroundColor = indexPath.row == 0 ? UIColor.red : UIColor.white
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: doneCell, for: indexPath)
        cell.backgroundColor = indexPath.row == 0 ? UIColor.red : UIColor.white
        return cell
    }
    
    //have to be 1
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width,height: view.frame.height)
    }
    
    //spacing between cells 0
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    
    //Draggin between tabs
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        print("that's the self.currentPage \(self.currentPage) and that's the current : \(currentPage)")
        guard  self.currentPage != currentPage else { return }
        oldPage = self.currentPage
        self.currentPage = currentPage;
        print("that's the old \(oldPage) and that's the current : \(currentPage)")
        //Do something
        menuBar.collectionView.selectItem(at: IndexPath(item: Int(currentPage), section: 0), animated: true, scrollPosition: [])
        menuBar.collectionView.delegate?.collectionView!(menuBar.collectionView, didSelectItemAt: IndexPath(item: Int(currentPage), section: 0))
    }
}



