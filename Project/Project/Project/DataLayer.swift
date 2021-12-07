//
//  DataLayer.swift
//  Project
//
//  Created by Andy Vu on 11/18/21.
//

import Foundation
import SQLite

class Database{
    var conn : Connection!
    
    init(){
        let rootPath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let dbPath = rootPath.appendingPathComponent("project.sqlite").path
        print("\(dbPath)")
        conn = try! Connection(dbPath)
    }
    
}
class ProjectRepository{
    
    var db = Database()
    
    static private var repository : ProjectRepository!
    
    static func get() -> ProjectRepository{
        if repository == nil{
            repository = ProjectRepository()
        }
        return repository
    }
    
    //func readUsers() -> [Users]
    //{
       // let qryString = "SELECT * FROM users"
        
       // var statement: OpaquePointer?
        
    //}
    
}
