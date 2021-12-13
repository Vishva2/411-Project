//
//  DropController.swift
//  Project
//
//  Created by Andy Vu on 12/7/21.
//  This file is used to drop any classes that the students is enrolled in.

import UIKit

class DropController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cla.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom1", for: indexPath) as! secondCustomCell
        cell.className.text = cla[indexPath.row].className
        cell.units.text = String(cla[indexPath.row].units!)
        cell.teacher.text = cla[indexPath.row].teacher
        
        return cell
    }
    
    var data = ProjectRepository.get()
    var userIDNum : Int!
    var sum : Summary!
    var cla : [Classes] = []
    var units = 10
    var location : [Int] = []
    var classNum = 0
    var selected = false
    var selectedClass : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DropView?.delegate = self
        DropView?.dataSource = self
        sum = data.findSummary(userIDNum: userIDNum)
        if sum.classID1 != -1
        {
            cla.append(data.findClass(classIDNum: sum.classID1!))
        }
        if sum.classID2 != -1
        {
            cla.append(data.findClass(classIDNum: sum.classID2!))
        }
        if sum.classID3 != -1
        {
            cla.append(data.findClass(classIDNum: sum.classID3!))
        }
    }
 
    
    @IBOutlet var DropView : UITableView!
    @IBOutlet var backButton : UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MenuController
        {
            let MC = segue.destination as? MenuController
            MC?.userIDNum = userIDNum
            MC?.location = location
        }
    }
        @IBAction func Click(_ sender: UIButton){
           
            let drop = data.dropClass(userIDNum: userIDNum, selectedClass: selectedClass)
            location.append(drop)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       selectedClass = indexPath.row
    }
    
    @IBAction func toMenu(_sender : UIButton!)
    {
        print("Menu")
    }
    
}
