//  Menus.swift
//  ProjectClasses
//
//Mamona Ghaffar
// this is NSObject class file for Menu object holding all the necessary information for a menu
// inorder to connect with the webservice which accepts data in json format
// we have to decode and encode the object

import UIKit

class Menus: NSObject, NSCoding, Codable {

    var id            : Int?
    var name          : String
    var detail        : String
    var price         : Double
    var taxPerc       : Double
    var taxTotal      : Double
    var totalPrice    : Double
    var active        : Bool
    var calorie       : Double
    var createdDate   : String
    var meals         : [Meals]
    
    init(

        id            : Int,
        name          : String,
        detail        : String,
        price         : Double,
        taxPerc       : Double,
        taxTotal      : Double,
        totalPrice    : Double,
        active        : Bool,
        calorie       : Double,
        createdDate   : String,
        meals         : [Meals]
    )
    {
        self.id          = id
        self.name        = name
        self.detail      = detail
        self.price       = price
        self.taxPerc     = taxPerc
        self.taxTotal    = taxTotal
        self.totalPrice  = totalPrice
        self.active      = active
        self.calorie     = calorie
        self.createdDate = createdDate
        self.meals       = meals
        
        
    }
    override init() {
        
        id          = 0
        name        = ""
        detail      = ""
        price       = 0
        taxPerc     = 0
        taxTotal    = 0
        totalPrice  = 0
        active      = true
        calorie     = 0
        let dFormat = DateFormatter()
        dFormat.dateStyle = .short
        dFormat.timeStyle = .none
       
        createdDate = dFormat.string(from: Date.now)
        meals       = []
        
    }
//menu object to json object
    func encode(with coder: NSCoder){
        coder.encode(id                      , forKey : "id")
        coder.encode(name                    , forKey : "name")
        coder.encode(detail                  , forKey : "detail")
        coder.encode(price                   , forKey : "price")
        coder.encode(taxPerc                 , forKey : "taxPerc")
        coder.encode(taxTotal                , forKey : "taxTotal")
        coder.encode(totalPrice              , forKey : "totalPrice")
        coder.encode(active                  , forKey : "active")
        coder.encode(calorie                 , forKey : "calorie")
        coder.encode(createdDate             , forKey : "createdDate")
        coder.encode(meals                   , forKey : "meals")

        
        
    }
//json object to menu object
    required public init?(coder decoder : NSCoder){
        self.id                                      = decoder.decodeInteger(forKey:"id")
        self.name                                    = decoder.decodeObject (forKey:"name") as? String ?? ""
        self.detail                                  = decoder.decodeObject (forKey:"detail") as? String ?? ""
        self.price                                   = decoder.decodeDouble (forKey:"price")
        self.taxPerc                                 = decoder.decodeDouble (forKey:"taxPerc")
        self.taxTotal                                = decoder.decodeDouble (forKey:"taxTotal")
        self.totalPrice                              = decoder.decodeDouble (forKey:"totalPrice")
        self.active                                  = decoder.decodeBool   (forKey:"active")
        self.calorie                                 = decoder.decodeDouble (forKey:"calorie")
        self.createdDate                             = decoder.decodeObject (forKey:"createdDate") as? String ?? ""
        self.meals                                   = decoder.decodeObject (forKey:"meals") as? [Meals] ?? []
        
    }
}

