//
//  Conditions.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class Conditions: NSObject, NSCoding, Codable {
var createdDate : String
var id : Int?
var name : String
var type : String
var conditionDetails : [ConditionDetails]
    init (
        createdDate : String,
        id : Int,
        name : String,
        type : String,
        conditionDetails : [ConditionDetails])
        {
            self.createdDate = createdDate
            self.id = id
            self.name = name
            self.type = type
            self.conditionDetails = conditionDetails
        }
        override init() {
            
            self.id = 0
            self.name = ""
            self.createdDate = ""
            self.type = ""
            self.conditionDetails = []
        }
    
    func encode( with coder: NSCoder) {
        coder.encode(createdDate, forKey: "createdDate")
        coder.encode(id!, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(type, forKey: "type")
        coder.encode(conditionDetails, forKey: "conditionDetails")
    }
    required public init?(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
        self.type = decoder.decodeObject(forKey: "type") as? String ?? ""
        self.conditionDetails = decoder.decodeObject(forKey: "conditionDetails") as? [ConditionDetails] ?? []
    }
    
}
