//
//  MenuSuggestions.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class MenuSuggestions: NSObject, NSCoding, Codable {
var createdDate : String
var id : Int?
var name : String
var customerId : Int
var menuGroupId : Int
    
    init (
    createdDate : String,
    id : Int,
    name : String,
    customerId : Int,
    menuGroupId : Int)
    
    {
    self.createdDate = createdDate
    self.customerId = customerId
    self.id = id
    self.menuGroupId = menuGroupId
    self.name = name
    }
    
    override init() {
    self.id = 0
    self.name = ""
    self.createdDate = ""
    self.customerId = 0
    self.menuGroupId = 0
    }
    
    func encode( with coder: NSCoder) {
        coder.encode(createdDate, forKey: "createdDate")
        coder.encode(customerId, forKey: "customerId")
        coder.encode(id!, forKey: "id")
        coder.encode(menuGroupId, forKey: "menuGroupId")
        coder.encode(name, forKey: "name")
    }
    required public init?(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
        self.customerId = decoder.decodeInteger(forKey: "customerId")
        self.menuGroupId = decoder.decodeInteger(forKey: "menuGroupId")
}

}
