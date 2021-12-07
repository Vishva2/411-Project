//
//  MenuController.swift
//  Project
//
//  Created by Andy Vu on 11/28/21.
//

import UIKit

class MenuController: UIViewController {
    @IBOutlet var logoutButton : UIButton!

    @IBAction func logoutClicked(_sender : UIButton!)
    {
        //performSegue(withIdentifier: "logout", sender: nil)
        print("Logout")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.dismiss(animated: false, completion: nil)
        
    }
}
