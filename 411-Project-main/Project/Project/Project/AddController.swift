//
//  AddController.swift
//  Project
//
//  Created by Andy Vu on 12/7/21.
//  This class is responsible for adding classes to the student's total classes

import UIKit

class AddController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data = ProjectRepository.get()
    var userIDNum : Int!
    var sum : Summary!
    var cla : [Classes] = []
    var units = 10
    var location :[Int] = []
    var classNum = 0
    var selected = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AddView?.delegate = self
        AddView?.dataSource = self
        for i in data.getClasses(){
            cla.append(i)
        }
    }
    
    @IBAction func Click(_ sender: UIButton){
        
        location = data.AddClass(userIDNum: userIDNum, classIDNum: classNum, location: location)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cla.count
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCustomCell", for: indexPath) as! secondCustomCell
        cell.className.text = cla[indexPath.row].className
        cell.units.text = String(cla[indexPath.row].units!)
        cell.teacher.text = cla[indexPath.row].teacher
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       classNum = cla[indexPath.row].ID
        
    }
    
    @IBOutlet var backButton : UIButton!
    var userIDNum1 : Int!
    var data2 = ProjectRepository.get()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MenuController
        {
            let MC = segue.destination as? MenuController
            MC?.userIDNum = userIDNum
            MC?.location = location
        }
    }
   
    @IBOutlet var AddView : UITableView!
    

    @IBAction func toMenu(_sender : UIButton!)
    {
        print("Menu")
    }
     
    
}
