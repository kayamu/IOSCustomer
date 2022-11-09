//
//  Customer.swift
//  ProjectClasses
//
//  Derya Kaya
//this class holds Customer general info then it encodes and decodes the object to and from json object
//when connecting with the webservices
//

import UIKit

class Customer:  NSObject, NSCoding, Codable {
    
    var id                  : Int?
    var userID              : String
    var fullName            : String
    var email               : String
    var phone               : String
    var detail              : String
    var gender              : Bool
    var birthday            : String
    var createdDate         : String
    var customerContacts    : [CustomerContact]
    var customerHealths     : [CustomerHealths]
    
    
    init(id                 : Int,
         userID             : String,
         fullName           : String,
         email              : String,
         phone              : String,
         detail             : String,
         gender             : Bool,
         birthday           : String,
         createdDate        : String,
         customerContacts   : [CustomerContact],
         customerHealths    : [CustomerHealths]
    )
    {
        self.id                 = id
        self.userID             = userID
        self.fullName           = fullName
        self.email              = email
        self.phone              = phone
        self.detail             = detail
        self.gender             = gender
        self.birthday           = birthday
        self.createdDate        = createdDate
        self.customerContacts   = customerContacts
        self.customerHealths    = customerHealths
        
    }
    
    override init() {
        self.id         = 0
        self.userID     = ""
        self.fullName   = ""
        self.email      = ""
        self.phone      = ""
        self.detail     = ""
        self.gender     = true

        let dFormat = DateFormatter()
        dFormat.locale = Locale(identifier: "en_US_POSIX")
        dFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
                
        self.birthday = dFormat.string(from: Date.now)
        self.createdDate = dFormat.string(from: Date.now)
        self.customerContacts = []
        self.customerHealths = []
        super.init()
    }


    func encode(with coder: NSCoder) {
        coder.encode(id!                ,forKey: "id")
        coder.encode(userID             ,forKey: "userID")
        coder.encode(fullName           ,forKey: "fullName")
        coder.encode(email              ,forKey: "email")
        coder.encode(phone              ,forKey: "phone")
        coder.encode(detail             ,forKey: "detail")
        coder.encode(gender             ,forKey: "gender")
        coder.encode(birthday           ,forKey: "birthday")
        coder.encode(createdDate        ,forKey: "createdDate")
        coder.encode(customerContacts   ,forKey: "customerContacts")
        coder.encode(customerHealths    ,forKey: "customerHealths")
    }
         
    required public init?(coder decoder: NSCoder) {
        self.id                  = decoder.decodeInteger(forKey: "id")
        self.userID              = decoder.decodeObject (forKey: "userID") as? String ?? ""
        self.fullName            = decoder.decodeObject (forKey: "fullName") as? String ?? ""
        self.email               = decoder.decodeObject (forKey: "email") as? String ?? ""
        self.phone               = decoder.decodeObject (forKey: "phone") as? String ?? ""
        self.detail              = decoder.decodeObject (forKey: "detail") as? String ?? ""
        self.gender              = decoder.decodeBool   (forKey: "gender")
        self.birthday            = decoder.decodeObject (forKey: "birthday") as? String ?? ""
        self.createdDate         = decoder.decodeObject (forKey: "createdDate") as? String ?? ""
        self.customerContacts    = decoder.decodeObject (forKey: "customerContacts") as? [CustomerContact] ?? []
        self.customerHealths     = decoder.decodeObject (forKey: "customerHealths") as? [CustomerHealths] ?? []
    }
    
}

