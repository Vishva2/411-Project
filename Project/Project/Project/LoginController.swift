//
//  ViewController.swift
//  Project
//
//  Created by Andy Vu on 11/27/21.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    var data = ProjectRepository.get()
    var user : [Users] = []

    @IBAction func logInClicked(_sender : UIButton!)
    {
        let user = "username"
        let pass = "password"
        if user == username.text && pass == password.text
        {
            performSegue(withIdentifier: "toMenu", sender: nil)
            print("Login Successful")
        }
        else
        {
            print("Login Failed")
        }
        username.text = ""
        password.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

