//
//  Items.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class Items: NSObject, NSCoding, Codable {
var cost : Double
var createdDate : String
var explain : String
var id : Int?
var isActive : Bool
var itemCode : String
var itemId : Int
var name : String
var price : Double
var type : String
var templates : [Templates]
    
    init (
    cost : Double,
    createdDate : String,
    explain : String,
    id : Int,
    isActive : Bool,
    itemCode : String,
    itemId : Int,
    name : String,
    price : Double,
    type : String,
    templates : [Templates])
    
        {
            self.cost = cost
            self.createdDate = createdDate
            self.explain = explain
            self.id = id
            self.isActive = isActive
            self.itemCode = itemCode
            self.itemId = itemId
            self.name = name
            self.price = price
            self.type = type
            self.templates = templates
        }
    override init() {
    self.id = 0
    self.name = ""
    self.createdDate = ""
    self.itemCode = ""
    self.itemId = 0
    self.cost = 0
    self.explain = ""
    self.isActive = true
    self.price = 0
    self.type = ""
    self.templates = []
    }
    func encode( with coder: NSCoder) {
    coder.encode(cost, forKey: "cost")
    coder.encode(createdDate, forKey: "createdDate")
    coder.encode(explain, forKey: "explain")
    coder.encode(id!, forKey: "id")
    coder.encode(isActive, forKey: "isActive")
    coder.encode(itemCode, forKey: "itemCode")
    coder.encode(itemId, forKey: "itemId")
    coder.encode(name, forKey: "name")
    coder.encode(price, forKey: "price")
    coder.encode(type, forKey: "type")
    coder.encode(templates, forKey: "templates")
    }
    
    required public init?(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
        self.itemCode = decoder.decodeObject(forKey: "itemCode") as? String ?? ""
        self.itemId = decoder.decodeObject(forKey: "itemId") as? Int ?? 0
        self.cost = decoder.decodeObject(forKey: "cost") as? Double ?? 0
        self.explain = decoder.decodeObject(forKey: "explain") as? String ?? ""
        self.isActive = decoder.decodeObject(forKey: "isActive") as? Bool ?? true
        self.price = decoder.decodeObject(forKey: "price") as? Double ?? 0
        self.type = decoder.decodeObject(forKey: "type") as? String ?? ""
        self.templates = decoder.decodeObject(forKey: "templates") as? [Templates] ?? []
    }
}
