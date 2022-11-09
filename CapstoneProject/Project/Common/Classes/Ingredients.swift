//
//  Ingredients.swift
//  ProjectClasses
//
//  Muharrem Kaya
//

import UIKit

class Ingredients: NSObject, NSCoding, Codable {
    
    var id                  : Int?
    var name                : String
    var explanation         : String
    var allergenLevel       : Double
    var calorieUnit         : Int
    var calorieBaseAmount   : Double
    var calorieTotal        : Double
    var active              : Bool
    var createdDate         : String
    
    init(
        id                  : Int?,
        name                : String,
        explanation         : String,
        allergenLevel       : Double,
        calorieUnit         : Int,
        calorieBaseAmount   : Double,
        calorieTotal        : Double,
        active              : Bool,
        createdDate         : String
    )
    {
        self.id                  = id
        self.name                = name
        self.explanation         = explanation
        self.allergenLevel       = allergenLevel
        self.calorieUnit         = calorieUnit
        self.calorieBaseAmount   = calorieBaseAmount
        self.calorieTotal        = calorieTotal
        self.active              = active
        self.createdDate         = createdDate
    }
    
    override init()
    {
        id                  = 0
        name                = ""
        explanation         = ""
        allergenLevel       = 0.0
        calorieUnit         = 0
        calorieBaseAmount   = 0.0
        calorieTotal        = 0.0
        active              = true
        
        let dFormat = DateFormatter()
        dFormat.locale = Locale(identifier: "en_US_POSIX")
        dFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        createdDate   = dFormat.string(from: Date.now)
        super.init()
    }
    // encoding the object to json object
    func encode(with coder: NSCoder) {
        coder.encode(id                    ,forKey: "id")
        coder.encode(name                  ,forKey: "name")
        coder.encode(explanation           ,forKey: "explanation")
        coder.encode(allergenLevel         ,forKey: "allergenLevel")
        coder.encode(calorieUnit           ,forKey: "calorieUnit")
        coder.encode(calorieBaseAmount     ,forKey: "calorieBaseAmount")
        coder.encode(calorieTotal          ,forKey: "calorieTotal")
        coder.encode(active                ,forKey: "active")
        coder.encode(createdDate           ,forKey: "createdDate")
    }
    //deconding back to nsobject from json object
    required init?(coder decoder: NSCoder) {
        self.id                  = decoder.decodeInteger(forKey: "id")
        self.name                = decoder.decodeObject (forKey: "name") as? String ?? ""
        self.explanation         = decoder.decodeObject (forKey: "explanation") as? String ?? ""
        self.allergenLevel       = decoder.decodeDouble (forKey: "allergenLevel")
        self.calorieUnit         = decoder.decodeInteger(forKey: "calorieUnit")
        self.calorieBaseAmount   = decoder.decodeDouble (forKey: "calorieBaseAmount")
        self.calorieTotal        = decoder.decodeDouble (forKey: "calorieTotal")
        self.active              = decoder.decodeBool   (forKey: "active")
        self.createdDate         = decoder.decodeObject (forKey: "createdDate") as? String ?? ""
      
    }
    

    

    

    



}
