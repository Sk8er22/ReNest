//
//  Tasks.swift
//  ReNest-Final
//
//  Created by PEDRO ARMANDO MANFREDI on 27/8/18.
//  Copyright © 2018 Pedro Manfredi. All rights reserved.
//

import Foundation
class Section {
    var title : String?
    var list : [String]?
    var isColleps : Bool?
    init() {
    }
    
    init(title : String? , list : [String]?, isColleps : Bool?) {
        self.title = title
        self.list = list
        self.isColleps = isColleps
    }
}
