//
//  MealIngredients.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class MealIngredients: NSObject, NSCoding, Codable {
var amount : String
var createdDate : String
var id : Int?
var name : String
var unit : String
var nutriens : [Nutriens]
var ingredients : [Ingredients]
    init (
    amount : String,
    createdDate : String,
    id : Int,
    name : String,
    unit : String,
    nutriens : [Nutriens],
    ingredients : [Ingredients])
        {
            self.amount = amount
            self.createdDate = createdDate
            self.id = id
            self.name = name
            self.unit = unit
            self.nutriens = nutriens
            self.ingredients = ingredients
        }
        override init() {
            self.id = 0
            self.name = ""
            self.createdDate = ""
            self.amount = ""
            self.unit = ""
            self.nutriens = []
            self.ingredients = [Ingredients]
        }
    func encode( with coder: NSCoder) {
        coder.encode(amount, forKey: "amount")
        coder.encode(createdDate, forKey: "createdDate")
        coder.encode(id!, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(unit, forKey: "unit")
        coder.encode(nutriens, forKey: "nutriens")
        coder.encode(ingredients, forKey: "ingredients")
    }
    required public init?(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
        self.amount = decoder.decodeObject(forKey: "amount") as? String ?? ""
        self.unit = decoder.decodeObject(forKey: "unit") as? String ?? ""
        self.nutriens = decoder.decodeObject(forKey: "nutriens") as? [Nutriens] ?? []
        self.ingredients = decoder.decodeObject(forKey: "ingredients") as? [Ingredients] ?? []
    }
}
