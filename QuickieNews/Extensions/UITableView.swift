//
//  UITableView.swift
//  QuickieNews
//
//  Created by Nicolas Mulet on 02/06/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import UIKit

extension UITableViewCell: Reusable {
    static func registerWith(_ tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: self.reuseIdentifier())
    }
    
    static func registerNibWith(_ tableView: UITableView) {
        tableView.register(UINib(nibName: self.className(), bundle: nil), forCellReuseIdentifier: self.reuseIdentifier())
    }
}
