//
//  SummaryController.swift
//  Project
//
//  Created by Andy Vu on 12/7/21.
//

import UIKit
class SummaryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var backButton : UIButton!
    @IBOutlet var summaryView : UITableView!
    
    var data = ProjectRepository.get()
    var userIDNum : Int!
    var sum : Summary!
    var cla : [Classes] = []

    @IBAction func toMenu(_sender : UIButton!)
    {
        print("Menu")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cla.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCustomCell", for: indexPath) as! FirstCustomCell
        cell.className.text = cla[indexPath.row].className
        cell.units.text = String(cla[indexPath.row].units!)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is MenuController
        {
            let MC = segue.destination as? MenuController
            MC?.userIDNum = userIDNum
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        summaryView.dataSource = self
        summaryView.delegate = self
        
        
        sum = data.findSummary(userIDNum: userIDNum)
        if sum.classID1 != nil
        {
            cla.append(data.findClass(classIDNum: sum.classID1!))
        }
        if sum.classID2 != nil
        {
            cla.append(data.findClass(classIDNum: sum.classID2!))
        }
        if sum.classID3 != nil
        {
            cla.append(data.findClass(classIDNum: sum.classID3!))
        }
        
        
       
    }
}
