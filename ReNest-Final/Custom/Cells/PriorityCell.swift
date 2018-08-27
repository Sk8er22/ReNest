//
//  PriorityCell.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 27/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//

import UIKit

class PriorityCell: UITableViewCell {

    @IBOutlet weak var spaceBar: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var heightCell: NSLayoutConstraint!
    @IBOutlet weak var priorityStack: UIStackView!
    @IBOutlet weak var HighB: UIButton!
    @IBOutlet weak var NormalB: UIButton!
    @IBOutlet weak var LowB: UIButton!
    @IBOutlet weak var CloseB: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.red
        // Initialization code
    }

    @IBAction func LowButton(_ sender: Any) {
    }
    @IBAction func normalButton(_ sender: Any) {
    }
    @IBAction func highButton(_ sender: Any) {
    }
    @IBAction func closeButton(_ sender: Any) {
    }

}
