//
//  CustomerContact.swift
//  ProjectClasses
//
//  Derya Kaya
// this class holds Customer contact info then it encodes and decodes the object to and from json object
//when connecting with the webservices

import UIKit

class CustomerContact: NSObject, NSCoding, Codable {
    
    var id : Int?
    var name : String
    var streetAddress1 : String
    var streetAddress2 : String
    var city : String
    var postalCode : String
    var province: String
    var detail : String
    var active : Bool
    var createdDate : String
    
    init(id : Int, name : String, streetAddress1 : String, streetAddress2 : String, city : String, postalCode : String, province : String, detail : String, active : Bool, createdDate : String )
    {
        self.id = id
        self.name = name
        self.streetAddress1 = streetAddress1
        self.streetAddress2 = streetAddress2
        self.city = city
        self.postalCode = postalCode
        self.province = province
        self.detail = detail
        self.active = active
        self.createdDate = createdDate
    }
    
    override init() {
        id = nil
        name = "Derya Kaya"
        streetAddress1 = "2080 Marine Drive"
        streetAddress2 = "Unit:17"
        city = "Toronto"
        postalCode = "L8L2B5"
        province = "Ontario"
        detail = "Near the Oakville"
        active = false
        let dFormat = DateFormatter()
        dFormat.dateStyle = .short
        dFormat.timeStyle = .none
        createdDate = dFormat.string(from: Date.now)
        super.init()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(id!                ,forKey:"id")
        coder.encode(name               ,forKey:"name")
        coder.encode(streetAddress1     ,forKey:"streetAddress1")
        coder.encode(streetAddress2     ,forKey:"streetAddress2")
        coder.encode(city               ,forKey:"city")
        coder.encode(postalCode         ,forKey:"postalCode")
        coder.encode(province           ,forKey:"province")
        coder.encode(detail             ,forKey:"detail")
        coder.encode(active             ,forKey:"active")
        coder.encode(createdDate        ,forKey:"createdDate")
                     
    }
    
    required init?(coder decoder: NSCoder) {
        self.id                 = decoder.decodeInteger(forKey: "id")
        self.name               = decoder.decodeObject (forKey: "name") as? String ?? ""
        self.streetAddress1     = decoder.decodeObject (forKey: "streetAddress1") as? String ?? ""
        self.streetAddress2     = decoder.decodeObject (forKey: "streetAddress2") as? String ?? ""
        self.city               = decoder.decodeObject (forKey: "city") as? String ?? ""
        self.postalCode         = decoder.decodeObject (forKey: "postalCode") as? String ?? ""
        self.province           = decoder.decodeObject (forKey: "province") as? String ?? ""
        self.detail             = decoder.decodeObject (forKey: "detail") as? String ?? ""
        self.active             = decoder.decodeObject (forKey: "active") as? Bool ?? true
        self.createdDate        = decoder.decodeObject (forKey: "createdDate") as? String ?? ""
        
    }
    

    

    

}

