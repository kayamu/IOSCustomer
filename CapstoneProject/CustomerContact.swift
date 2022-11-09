//
//  CustomerContact.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class CustomerContact: NSObject, NSCoding, Codable {
var active : Bool
var address1 : String
var address2 : String
var city : String
var createdDate : String
var detail : String
var id : Int?
var name : String
var postalCode : String
var province : String
    init (
    active : Bool,
    address1 : String,
    address2 : String,
    city : String,
    createdDate : String,
    detail : String,
    id : Int,
    name : String,
    postalCode : String,
    province : String)
    
        {
        self.active = active
        self.address1 = address1
        self.address2 = address2
        self.city = city
        self.createdDate = createdDate
        self.detail = detail
        self.id = id
        self.name = name
        self.postalCode = postalCode
        self.province = province
        }
        override init() {
            self.id = 0
            self.name = ""
            self.active = true
            self.createdDate = ""
            self.detail = ""
            self.address1 = ""
            self.address2 = ""
            self.city = ""
            self.postalCode = ""
            self.province = ""
            
        }
    func encode( with coder: NSCoder) {
        coder.encode(active, forKey: "active")
        coder.encode(address1, forKey: "address1")
        coder.encode(address2, forKey: "address2")
        coder.encode(city, forKey: "city")
        coder.encode(createdDate, forKey: "createdDate")
        coder.encode(detail, forKey: "detail")
        coder.encode(id!, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(postalCode, forKey: "postalCode")
        coder.encode(province, forKey: "province")
        
    }
    required public init?(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.active = decoder.decodeObject(forKey: "active") as? Bool ?? true
        self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
        self.detail = decoder.decodeObject(forKey: "detail") as? String ?? ""
        self.address1 = decoder.decodeObject(forKey: "address1") as? String ?? ""
        self.address2 = decoder.decodeObject(forKey: "address2") as? String ?? ""
        self.city = decoder.decodeObject(forKey: "city") as? String ?? ""
        self.postalCode = decoder.decodeObject(forKey: "postalCode") as? String ?? ""
        self.province = decoder.decodeObject(forKey: "province") as? String ?? ""
    }
               
}
