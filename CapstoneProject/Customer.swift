//
//  Customer.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit

class Customer: NSObject, NSCoding, Codable {
var birthday : String
var createdDate : String
var detail : String
var email : String
var gender : Bool
var id : Int?
var name : String
var phone : String
var userID : String
var customerHealths : [CustomerHealths]
var allergens : [Allergens]
var customerContact : [CustomerContact]
    init (
    birthday : String,
    createdDate : String,
    detail : String,
    email : String,
    gender : Bool,
    id : Int,
    name : String,
    phone : String,
    userID : String,
    customerHealths : [CustomerHealths],
    allergens : [Allergens],
    customerContact : [CustomerContact])

        {
            self.birthday = birthday
            self.createdDate = createdDate
            self.detail = detail
            self.email = email
            self.gender = gender
            self.id = id
            self.name = name
            self.phone = phone
            self.userID = userID
            self.customerHealths = customerHealths
            self.allergens = allergens
            self.customerContact = customerContact
        }
        override init() {
            self.id = 0
            self.name = ""
            self.createdDate = ""
            self.detail = ""
            self.birthday = ""
            self.email = ""
            self.gender = true
            self.phone = ""
            self.userID = ""
            self.customerHealths = []
            self.allergens = []
            self.customerContact = []
        }
    
    func encode( with coder: NSCoder) {
        coder.encode(birthday, forKey: "birthday")
        coder.encode(createdDate, forKey: "createdDate")
        coder.encode(detail, forKey: "detail")
        coder.encode(email, forKey: "email")
        coder.encode(gender, forKey: "gender")
        coder.encode(id!, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(phone, forKey: "phone")
        coder.encode(userID, forKey: "userID")
        coder.encode(customerHealths, forKey: "customerHealths")
        coder.encode(allergens, forKey: "allergens")
        coder.encode(customerContact, forKey: "customerContact")
    }
    required public init?(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
        self.detail = decoder.decodeObject(forKey: "detail") as? String ?? ""
        self.birthday = decoder.decodeObject(forKey: "birthday") as? String ?? ""
        self.email = decoder.decodeObject(forKey: "email") as? String ?? ""
        self.gender = decoder.decodeObject(forKey: "gender") as? Bool ?? true
        self.phone = decoder.decodeObject(forKey: "phone") as? String ?? ""
        self.userID = decoder.decodeObject(forKey: "userID") as? String ?? ""
        self.customerHealths = decoder.decodeObject(forKey: "customerHealths") as? [CustomerHealths] ?? []
        self.allergens = decoder.decodeObject(forKey: "allergens") as? [Allergens] ?? []
        self.customerContact = decoder.decodeObject(forKey: "customerContact") as? [CustomerContact] ?? []
    }
    
}
