//
//  Meals.swift
//  ProjectClasses
//
//
//
//Mamona Ghaffar
// this is NSObject class file for Meals object holding all the necessary information for a meal
// inorder to connect with the webservice which accepts datra in json format
// we have to decode and encode the object
import UIKit

class Meals: NSObject, NSCoding, Codable {
    
    var id                                : Int?
    var name                              : String
    var detail                            : String
    var mealUrl                           : String
    var price                             : Double
    var taxPerc                           : Double
    var taxTotal                          : Double
    var totalPrice                        : Double
    var calorie                           : Double
    var createdDate                       : String
    var ingredients                       : [Ingredients]

    
    
    init (
        id                                : Int,
        name                              : String,
        detail                            : String,
        mealUrl                           : String,
        price                             : Double,
        taxPerc                           : Double,
        taxTotal                          : Double,
        totalPrice                        : Double,
        calorie                           : Double,
        createdDate                       : String,
        ingredients                       : [Ingredients]

    )
    {
        self.id              =  id
        self.name            =  name
        self.detail          =  detail
        self.mealUrl         =  mealUrl
        self.price           =  price
        self.taxPerc         =  taxPerc
        self.taxTotal        =  taxTotal
        self.totalPrice      =  totalPrice
        self.calorie         =  calorie
        self.createdDate     =  createdDate
        self.ingredients     =  ingredients
        
        
    }

    override init() {
        
        id              = 0
        name            = ""
        detail          = ""
        mealUrl         = ""
        price           = 0
        taxPerc         = 0
        taxTotal        = 0
        totalPrice      = 0
        calorie         = 0
        let dFormat = DateFormatter()
        dFormat.dateStyle = .short
        dFormat.timeStyle = .none
       
        createdDate = dFormat.string(from: Date.now)
        ingredients     = []

    }
//meal object to json object
    func encode(with coder : NSCoder)
    {
        coder.encode(id                    , forKey: "id")
        coder.encode(name                  , forKey: "name")
        coder.encode(detail                , forKey: "detail")
        coder.encode(mealUrl               , forKey: "mealUrl")
        coder.encode(price                 , forKey: "price")
        coder.encode(taxPerc               , forKey: "taxPerc")
        coder.encode(taxTotal              , forKey: "taxTotal")
        coder.encode(totalPrice            , forKey: "totalPrice")
        coder.encode(calorie               , forKey: "calorie")
        coder.encode(createdDate           , forKey: "createdDate")
        coder.encode(ingredients           , forKey: "ingredients")

        
    }
//json object back to meal object
    required public init?(coder decoder: NSCoder){
        self.id                       = decoder.decodeInteger(forKey:"id")
        self.name                     = decoder.decodeObject (forKey:"name") as? String ?? ""
        self.detail                   = decoder.decodeObject (forKey:"detail") as? String ?? ""
        self.mealUrl                  = decoder.decodeObject (forKey:"mealUrl") as? String ?? ""
        self.price                    = decoder.decodeDouble (forKey:"price")
        self.taxPerc                  = decoder.decodeDouble (forKey:"taxPerc")
        self.taxTotal                 = decoder.decodeDouble (forKey:"taxTotal")
        self.totalPrice               = decoder.decodeDouble (forKey:"totalPrice")
        self.calorie                  = decoder.decodeDouble (forKey:"calorie")
        self.createdDate              = decoder.decodeObject (forKey:"createdDate")  as? String ?? ""
        self.ingredients              = decoder.decodeObject (forKey:"ingredients") as? [Ingredients] ?? []
    }
}

