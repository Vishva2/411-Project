//
//  MenuController.swift
//  Project
//
//  Created by Andy Vu on 11/28/21.
//  This file is used to display the menu for the user.

import UIKit

class MenuController: UIViewController {
    @IBOutlet var logoutButton : UIButton!
    @IBOutlet var name: UILabel!
    @IBOutlet var idNum: UILabel!
    var location : [Int] = []
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
            SC?.location = location
            for i in location{
                print(i)
            }
        }
        if segue.destination is AddController
        {
            let AC = segue.destination as? AddController
            AC?.userIDNum = userIDNum
            AC?.location = location
            for i in location{
                print(i)
            }
        }
        if segue.destination is DropController
        {
            let DC = segue.destination as? DropController
            DC?.userIDNum = userIDNum
            DC?.location = location
            for i in location{
                print(i)
            }
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
