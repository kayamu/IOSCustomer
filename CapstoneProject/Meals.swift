//
//  Meals.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class Meals: NSObject, NSCoding, Codable {
var createdDate : String
var id : Int?
var name : String
var imageUrls : [ImageUrl]
var nutriens : [Nutriens]
var mealIngredients : [MealIngredients]
var recipies : [Recipies]
    init (
    createdDate : String,
    id : Int,
    name : String,
    imageUrls : [ImageUrl],
    nutriens : [Nutriens],
    mealIngredients : [MealIngredients],
    recipies : [Recipies])
    
    {
    self.createdDate = createdDate
    self.id = id
    self.name = name
    self.imageUrls = imageUrls
    self.nutriens = nutriens
    self.mealIngredients = mealIngredients
    self.recipies = recipies
    }
    override init() {
    self.id = 0
    self.name = ""
    self.createdDate = ""
    self.imageUrls = []
    self.nutriens = []
    self.mealIngredients = []
    self.recipies = []
    }
    func encode( with coder: NSCoder) {
    coder.encode(createdDate, forKey: "createdDate")
    coder.encode(id!, forKey: "id")
    coder.encode(name, forKey: "name")
    coder.encode(imageUrls, forKey: "imageUrls")
    coder.encode(nutriens, forKey: "nutriens")
    coder.encode(mealIngredients, forKey: "mealIngredients")
    coder.encode(recipies, forKey: "recipies")
    }
    
    required public init?(coder decoder: NSCoder) {
    self.id = decoder.decodeInteger(forKey: "id")
    self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
    self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
    self.imageUrls = decoder.decodeObject(forKey: "imageUrls") as? [ImageUrl] ?? []
    self.nutriens = decoder.decodeObject(forKey: "nutriens") as? [Nutriens] ?? []
    self.mealIngredients = decoder.decodeObject(forKey: "mealIngredients") as? [MealIngredients] ?? []
    self.recipies = decoder.decodeObject(forKey: "recipies") as? [Recipies] ?? []
    }
    
}
