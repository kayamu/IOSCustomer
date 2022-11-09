//
//  CustomerHealths.swift
//  ProjectClasses
//
//  Derya Kaya
// this class holds Customer health info then it encodes and decodes the object to and from json object
//when connecting with the webservices

import UIKit

class CustomerHealths: NSObject, NSCoding, Codable {
    
       var id              : Int?
       var name            : String
       var currentWeight   : Double?
       var currentHeigth   : Double?
       var mesuareUnit     : Int?
       var activityLevel   : Double?
       var targetWeight    : Double?
       var targetCalorie   : Double?
       var targetBodyFat   : String
       var goal            : String
       var active          : Bool
       var detail          : String
       var createdDate     : String

    
    init(
       id              : Int,
       name            : String,
       currentWeight   : Double,
       currentHeigth   : Double,
       mesuareUnit     : Int,
       activityLevel   : Double,
       targetWeight    : Double,
       targetCalorie   : Double,
       targetBodyFat   : String,
       goal            : String,
       active          : Bool,
       detail          : String,
       createdDate     : String

   )
   {
       self.id            =  id
       self.name          =  name
       self.currentWeight =  currentWeight
       self.currentHeigth =  currentHeigth
       self.mesuareUnit   =  mesuareUnit
       self.activityLevel =  activityLevel
       self.targetWeight  =  targetWeight
       self.targetCalorie =  targetCalorie
       self.targetBodyFat =  targetBodyFat
       self.goal          =  goal
       self.active        =  active
       self.detail        =  detail
       self.createdDate   =  createdDate

   }
    
    override init() {
        
        id              = 0
        name            = ""
        currentWeight   = 0.00
        currentHeigth   = 0.00
        mesuareUnit     = 0
        activityLevel   = 0.00
        targetWeight    = 0.00
        targetCalorie   = 0.00
        targetBodyFat   = "Low"
        goal            = "LoseFat"
        active          = true
        detail          = ""
        
        let dFormat = DateFormatter()
        dFormat.locale = Locale(identifier: "en_US_POSIX")
        dFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        createdDate     = dFormat.string(from: Date.now)

        
        super.init()

    }

    func encode(with coder: NSCoder) {
        coder.encode(id!            ,forKey: "id")
        coder.encode(name           ,forKey: "name")
        coder.encode(currentWeight  ,forKey: "currentWeight")
        coder.encode(currentHeigth  ,forKey: "currentHeigth")
        coder.encode(mesuareUnit    ,forKey: "mesuareUnit  ")
        coder.encode(activityLevel  ,forKey: "activityLevel")
        coder.encode(targetWeight   ,forKey: "targetWeight ")
        coder.encode(targetCalorie  ,forKey: "targetCalorie")
        coder.encode(targetBodyFat  ,forKey: "targetBodyFat")
        coder.encode(goal           ,forKey: "goal")
        coder.encode(active         ,forKey: "active")
        coder.encode(detail         ,forKey: "detail")
        coder.encode(createdDate    ,forKey: "createdDate")
        
    }
    
    required init?(coder decoder: NSCoder) {
       
        self.id              = decoder.decodeInteger(forKey: "id")
        self.name            = decoder.decodeObject (forKey: "name") as? String ?? ""
        self.currentWeight   = decoder.decodeDouble (forKey: "currentWeight")
        self.currentHeigth   = decoder.decodeDouble (forKey: "currentHeigth")
        self.mesuareUnit     = decoder.decodeInteger(forKey: "mesuareUnit")
        self.activityLevel   = decoder.decodeDouble (forKey: "activityLevel")
        self.targetWeight    = decoder.decodeDouble (forKey: "targetWeight")
        self.targetCalorie   = decoder.decodeDouble (forKey: "targetCalorie")
        self.targetBodyFat   = decoder.decodeObject (forKey: "targetBodyFat") as? String ?? "Low"
        self.goal            = decoder.decodeObject (forKey: "goal") as? String ?? "LoseFat"
        self.active          = decoder.decodeBool   (forKey: "active")
        self.detail          = decoder.decodeObject (forKey: "detail") as? String ?? ""
        self.createdDate     = decoder.decodeObject (forKey: "createdDate") as? String ?? ""
        
        
    }
    
   


}

