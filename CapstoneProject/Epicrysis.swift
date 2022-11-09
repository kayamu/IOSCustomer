//
//  Epicrysis.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class Epicrysis: NSObject, NSCoding, Codable {
var createdDate : String
var id : Int?
var name : String
var notes : String
var customerId : Int
var nutritionist : [Nutritionist]
    
    init (
    createdDate : String,
    id : Int,
    name : String,
    notes : String,
    customerId : Int,
    nutritionist : [Nutritionist])
        {
            self.createdDate = createdDate
            self.customerId = customerId
            self.id = id
            self.name = name
            self.notes = notes
            self.nutritionist = nutritionist
        }
        override init() {
            self.id = 0
            self.name = ""
            self.createdDate = ""
            self.customerId = 0
            self.notes = ""
            self.nutritionist = []
        }
    func encode( with coder: NSCoder) {
        coder.encode(createdDate, forKey: "createdDate")
        coder.encode(customerId, forKey: "customerId")
        coder.encode(id!, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(notes, forKey: "notes")
        coder.encode(nutritionist, forKey: "nutritionist")
    }
    required public init?(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
        self.customerId = decoder.decodeInteger(forKey: "customerId")
        self.notes = decoder.decodeObject(forKey: "notes") as? String ?? ""
        self.nutritionist = decoder.decodeObject(forKey: "nutritionist") as? [Nutritionist] ?? []
    }
}
