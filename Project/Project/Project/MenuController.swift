//
//  MenuController.swift
//  Project
//
//  Created by Andy Vu on 11/28/21.
//

import UIKit

class MenuController: UIViewController {
    @IBOutlet var logoutButton : UIButton!
    @IBOutlet var name: UILabel!
    @IBOutlet var idNum: UILabel!
    
    var data = ProjectRepository.get()
    var userIDNum : Int!
    
    @IBAction func toSummaryClicked(_sender : UIButton!)
    {
        print("Summary View")
    }
    @IBAction func toAddClassesClicked(_sender : UIButton!)
    {
        print("Add Classes")
    }
    @IBAction func toDropClassesClicked(_sender : UIButton!)
    {
        print("Drop Classes")
    }
    
    @IBAction func logoutClicked(_sender : UIButton!)
    {
        print("Logout")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SummaryController
        {
            let SC = segue.destination as? SummaryController
            SC?.userIDNum = userIDNum
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let user = data.findUser(userIDNum: userIDNum)
        name.text = "\(user.lastName!), \(user.firstName!)"
        idNum.text = "ID# : \(user.ID!) "
    }
}
