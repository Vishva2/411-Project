//
//  ViewController.swift
//  Project
//
//  Created by Andy Vu on 11/27/21.
//  This file is responsible for logging the user into the school system

import UIKit

class LoginController: UIViewController {
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    var data = ProjectRepository.get()
    var u : [Users] = []
    var userIDNum : Int!

    @IBAction func logInClicked(_sender : UIButton!)
    {
        var check = false
        var i = 0
        while(i < u.count)
        {
            let user = u[i].username
            let pass = u[i].password
            if user == username.text && pass == password.text
            {
                userIDNum = u[i].ID
                check = true
                break
            }
            i = i + 1
        }
        if check
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MenuController
        {
            let MC = segue.destination as? MenuController
            MC?.userIDNum = userIDNum
            MC?.location = data.populateLocation(userID: userIDNum)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        u = data.getUsers()
    }


}

