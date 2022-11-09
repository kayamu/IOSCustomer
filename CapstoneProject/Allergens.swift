//
//  Allergens.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit

class Allergens: NSObject, NSCoding, Codable {
var active : Bool
var createdDate : String
var detail : String
var id : Int?
var name : String
var ingradientId : Int
    
        init (
        active : Bool,
        createdDate : String,
        detail : String,
        id : Int?,
        name : String,
        ingradientId : Int)
                {
                    self.active = active
                    self.createdDate = createdDate
                    self.detail = detail
                    self.id = id
                    self.ingradientId = ingradientId
                    self.name = name
                    
                }
                override init() {
                    
                    self.id = 0
                    self.name = ""
                    self.active = true
                    self.createdDate = ""
                    self.detail = ""
                    self.ingradientId = 0
                    
                }
    func encode( with coder: NSCoder) {
        coder.encode(active, forKey: "active")
        coder.encode(createdDate, forKey: "createdDate")
        coder.encode(detail, forKey: "detail")
        coder.encode(id!, forKey: "id")
        coder.encode(ingradientId, forKey: "ingradientId")
        coder.encode(name, forKey: "name")
        
    }
    required public init?(coder decoder: NSCoder) {
    self.id = decoder.decodeInteger(forKey: "id")
    self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
    self.active = decoder.decodeObject(forKey: "active") as? Bool ?? true
    self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
    self.detail = decoder.decodeObject(forKey: "detail") as? String ?? ""
    self.ingradientId = decoder.decodeInteger(forKey: "ingradientId")
    
    }
    
    
}
