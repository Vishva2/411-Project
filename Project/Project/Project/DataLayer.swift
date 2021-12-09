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
    
    /* Class Table */
    var classTable : Table!
    var className: Expression<String>!
    var units: Expression<Int>!
    var description: Expression<String>!
    var teacher: Expression<String>!
    var classID: Expression<Int>!

    /* Summary Table */
    var summaryTable: Table!
    var classID1: Expression<Int>!
    var classID2: Expression<Int>!
    var classID3: Expression<Int>!
    var userID: Expression<Int>!
    var maxUnits: Expression<Int>!
    
    /* User Table */
    var userTable : Table!
    var username: Expression<String>!
    var password: Expression<String>!
    var ID: Expression<Int>!
    var firstName: Expression<String>!
    var lastName: Expression<String>!
    
    init(){
        let rootPath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let dbPath = rootPath.appendingPathComponent("project.sqlite").path
        print("\(dbPath)")
        conn = try! Connection(dbPath)
        initialize()
    }
    private func initialize()
    {
        initClass()
        initSummary()
        initUsers()
    }
    private func initClass()
    {
        classTable = Table("class")
        className = Expression<String>("ClassName")
        units = Expression<Int>("Units")
        teacher = Expression<String>("Teacher")
        classID = Expression<Int>("classID")
        description = Expression<String>("Description")
        let crTbl = classTable.create(ifNotExists: true){ t in
            t.column(className)
            t.column(units)
            t.column(teacher)
            t.column(classID)
            t.column(description)
        }
        try! conn.run(crTbl)
    }
    private func initSummary()
    {
        summaryTable = Table("summary")
        classID1 = Expression<Int>("classID1")
        classID2 = Expression<Int>("classID2")
        classID3 = Expression<Int>("classID3")
        userID = Expression<Int>("studentID")
        maxUnits = Expression<Int>("MaxUnits")
        let crTbl = summaryTable.create(ifNotExists: true){ t in
            t.column(classID1)
            t.column(classID2)
            t.column(classID3)
            t.column(userID)
            t.column(maxUnits)
        }
        try! conn.run(crTbl)
        
    }
    private func initUsers()
    {
        userTable = Table("users")
        username = Expression<String>("username")
        password = Expression<String>("password")
        ID = Expression<Int>("userID")
        firstName = Expression<String>("Fname")
        lastName = Expression<String>("Lname")
        let crTbl = userTable.create(ifNotExists: true){ t in
            t.column(username)
            t.column(password)
            t.column(ID)
            t.column(firstName)
            t.column(lastName)
        }
        try! conn.run(crTbl)    }
    
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
    func getUsers() -> [Users]{
        var list = [Users]()
        let tbl = db.userTable!
        let rs = try! db.conn.prepare(tbl)
        for r in rs{
            try! list.append(Users(username: r.get(db.username),password: r.get(db.password), ID: r.get(db.ID), firstName: r.get(db.firstName), lastName: r.get(db.lastName)))
        }
        return list
    }
    func getSummary() -> [Summary]{
        var list = [Summary]()
        let tbl = db.summaryTable!
        let rs = try! db.conn.prepare(tbl)
        for r in rs{
            try! list.append(Summary(classID1: r.get(db.classID1), classID2: r.get(db.classID2), classID3: r.get(db.classID3), userID: r.get(db.userID), maxUnits: r.get(db.maxUnits)))
        }
        return list
    }
    func getClasses() -> [Classes]{
        var list = [Classes]()
        let tbl = db.classTable!
        let rs = try! db.conn.prepare(tbl)
        for r in rs{
            try! list.append(Classes(className: r.get(db.className), units: r.get(db.units), teacher: r.get(db.teacher), ID: r.get(db.classID), description: r.get(db.description)))
        }
        return list
    }
    func findUser(userIDNum : Int!) -> Users
    {
        var u : [Users]
        var target : Users!
        u = getUsers()
        var i = 0
        while (i < u.count)
        {
            if userIDNum == u[i].ID
            {
                target = u[i]
            }
            i = i + 1
        }
        return target
    }
    func findClass(classIDNum : Int!) -> Classes
    {
        var c : [Classes]
        var target : Classes!
        c = getClasses()
        var i = 0
        while (i < c.count)
        {
            if classIDNum == c[i].ID
            {
                target = c[i]
            }
            i = i + 1
        }
        return target
    }
    func findSummary(userIDNum : Int!) -> Summary
    {
        var s : [Summary]
        var target : Summary!
        s = getSummary()
        var i = 0
        while (i < s.count)
        {
            if userIDNum == s[i].userID
            {
                target = s[i]
            }
            i = i + 1
        }
        return target
    }
}
