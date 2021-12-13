//
//  FirstCustomCell.swift
//  Project
//
//  Created by Andy Vu on 12/8/21.
//  Custom cell class used to create outlets for labels in Summary View

import Foundation
import UIKit

class FirstCustomCell : UITableViewCell{
    
    //@IBOutlet var contentVIew: UIView!
    @IBOutlet var className : UILabel!
    @IBOutlet var units : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
