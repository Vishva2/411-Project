//
//  Users.swift
//  Project
//
//  Created by Andy Vu on 11/28/21.
//  This file contains the users class which initializes all of their information such as name, ID, username and password.

import Foundation

class Users{
    var username: String!
    var password: String!
    var ID: Int!
    var firstName: String!
    var lastName: String!
    
    init(username: String, password: String, ID: Int, firstName: String, lastName: String)
    {
        self.username = username
        self.password = password
        self.ID = ID
        self.firstName = firstName
        self.lastName = lastName
        
    }
}
class Classes{
    var className: String!
    var units: Int!
    var description: String!
    var teacher: String!
    var ID: Int!
    init(className: String, units: Int, teacher: String, ID: Int,description: String)
    {
        self.className = className
        self.units = units
        self.description = description
        self.teacher = teacher
        self.ID = ID
        
    }
    
}
class Summary{
    var classID1: Int!
    var classID2: Int!
    var classID3: Int!
    var userID: Int!
    var maxUnits: Int!
    init(classID1: Int, classID2: Int, classID3: Int, userID: Int, maxUnits: Int)
    {
        self.classID1 = classID1
        self.classID2 = classID2
        self.classID3 = classID3
        self.userID = userID
        self.maxUnits = maxUnits
    }
    
}
