//
//  SecondCustomCell.swift
//  Project
//
//  Created by Vishva Patel on 12/10/21.
//  Custom cell class used to create labels in Add Classes view

import Foundation
import UIKit

class secondCustomCell : UITableViewCell{
    
    //@IBOutlet var contentView: UIView!
    @IBOutlet  var className : UILabel!
    @IBOutlet  var units : UILabel!
    @IBOutlet  var teacher: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
