//
//  AddTaskController.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 27/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//

import UIKit

struct cellData{
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}


class AddTaskController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var number = 1
    var tableViewData = [cellData]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableViewData = [cellData(opened: false, title: "Book professional movers", sectionData : ["cell1"]),
                         cellData(opened: false, title: "Prepare the house", sectionData : ["cell1"]),
                         cellData(opened: false, title: "Review moving plans", sectionData : ["cell1"]),
                         cellData(opened: false, title: "Prepare for payment", sectionData : ["cell1"]),
                         cellData(opened: false, title: "Pick an essentials box", sectionData : ["cell1"]),
                         cellData(opened: false, title: "Prepare appliances", sectionData : ["cell1"]),
                         cellData(opened: false, title: "Mesure furniture and doorway", sectionData : ["cell1"]),]
        self.navigationController?.navigationBar.tintColor = UIColor().HexColor(hex: "32315C")
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.title = "Add Task"
    }
    
    // Seeting different cells in tableview Tasks and priority
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.row) {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddTaskHeader", for: indexPath) as! AddTaskHeader
            cell.backgroundColor = UIColor().HexColor(hex: "F4F7FA")
            cell.addText.text = tableViewData[indexPath.section].title
            cell.layer.cornerRadius = 13.0
            cell.layer.borderWidth = 0
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.layer.masksToBounds = true
            debugPrint(indexPath.item, (indexPath.item % 2))
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PriorityCell", for: indexPath) as! PriorityCell
            cell.backgroundColor = UIColor().HexColor(hex: "F4F7FA")
            cell.layer.cornerRadius = 13.0
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.layer.masksToBounds = true
            cell.layer.frame.size = CGSize(width: 0, height: 0)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PriorityCell", for: indexPath) as! PriorityCell
            cell.layer.cornerRadius = 13.0
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.layer.masksToBounds = true
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 55;//Choose your custom row height
    }
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }else {
            tableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
        
    }
}

extension AddTaskHeader : UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
    }
}
