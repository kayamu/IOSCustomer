//
//  Menus.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class Menus: NSObject, NSCoding, Codable {
var cost : Double
var createdDate : String
var explanation : String
var id : Int?
var menuDay : String
var menuTime : String
var name : String
var salesPrice : Double
var nutritionistId : Int
var imageUrls : [ImageUrl]
var nutriens : [Nutriens]
var meals : [Meals]
    
    init (
    cost : Double,
    createdDate : String,
    explanation : String,
    id : Int,
    menuDay : String,
    menuTime : String,
    name : String,
    salesPrice : Double,
    nutritionistId : Int,
    imageUrls : [ImageUrl],
    nutriens : [Nutriens],
    meals : [Meals])
    
    {
        self.cost = cost
        self.createdDate = createdDate
        self.explanation = explanation
        self.id = id
        self.menuDay = menuDay
        self.menuTime = menuTime
        self.name = name
        self.nutritionistId = nutritionistId
        self.salesPrice = salesPrice
        self.imageUrls = imageUrls
        self.nutriens = nutriens
        self.meals = meals
    }
    
    override init() {
        self.id = 0
        self.name = ""
        self.createdDate = ""
        self.explanation = ""
        self.cost = 0
        self.nutritionistId = 0
        self.salesPrice = 0
        self.menuDay = ""
        self.menuTime = ""
        self.imageUrls = []
        self.nutriens = []
        self.meals = []
        
    }

    func encode( with coder: NSCoder) {
        coder.encode(cost, forKey: "cost")
        coder.encode(createdDate, forKey: "createdDate")
        coder.encode(explanation, forKey: "explanation")
        coder.encode(id!, forKey: "id")
        coder.encode(menuDay, forKey: "menuDay")
        coder.encode(menuTime, forKey: "menuTime")
        coder.encode(name, forKey: "name")
        coder.encode(nutritionistId, forKey: "nutritionistId")
        coder.encode(salesPrice, forKey: "salesPrice")
        coder.encode(imageUrls, forKey: "imageUrls")
        coder.encode(nutriens, forKey: "nutriens")
        coder.encode(meals, forKey: "meals")
    }
    required public init?(coder decoder: NSCoder) {
            self.id = decoder.decodeInteger(forKey: "id")
            self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
            self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
            self.explanation = decoder.decodeObject(forKey: "explanation") as? String ?? ""
            self.cost = decoder.decodeObject(forKey: "cost") as? Double ?? 0
            self.nutritionistId = decoder.decodeInteger(forKey: "nutritionistId")
            self.salesPrice = decoder.decodeObject(forKey: "salesPrice") as? Double ?? 0
            self.menuDay = decoder.decodeObject(forKey: "menuDay") as? String ?? ""
            self.menuTime = decoder.decodeObject(forKey: "menuTime") as? String ?? ""
            self.imageUrls = decoder.decodeObject(forKey: "imageUrls") as? [ImageUrl] ?? []
            self.nutriens = decoder.decodeObject(forKey: "nutriens") as? [Nutriens] ?? []
            self.meals = decoder.decodeObject(forKey: "meals") as? [Meals] ?? []
    }
}
