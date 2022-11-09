//
//  MenuGroups.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class MenuGroups: NSObject, NSCoding, Codable {
var bodyType : String
var cost : Double
var createdDate : String
var dailyKcalMax : Double
var dailyKcalMin : Double
var explanation : String
var goal : String
var id : Int?
var name : String
var salesPrice : Double
var targetWeightMax : Double
var targetWeightMin : Double
var unit : String
var weightMax : Double
var weightMin : Double
var activityLevelMax : Int
var activityLevelMin : Int
var nutritionistId : Int
var imageUrls : [ImageUrl]
var nutriens : [Nutriens]
var ingradients : [Ingredients]
var menus : [Menus]
    
    init (
    bodyType : String,
    cost : Double,
    createdDate : String,
    dailyKcalMax : Double,
    dailyKcalMin : Double,
    explanation : String,
    goal : String,
    id : Int,
    name : String,
    salesPrice : Double,
    targetWeightMax : Double,
    targetWeightMin : Double,
    unit : String,
    weightMax : Double,
    weightMin : Double,
    activityLevelMax : Int,
    activityLevelMin : Int,
    nutritionistId : Int,
    imageUrls : [ImageUrl],
    nutriens : [Nutriens],
    ingradients : [Ingredients],
    menus : [Menus])
 
    {
    self.activityLevelMax = activityLevelMax
    self.activityLevelMin = activityLevelMin
    self.bodyType = bodyType
    self.cost = cost
    self.createdDate = createdDate
    self.dailyKcalMax = dailyKcalMax
    self.dailyKcalMin = dailyKcalMin
    self.explanation = explanation
    self.goal = goal
    self.id = id
    self.name = name
    self.nutritionistId = nutritionistId
    self.salesPrice = salesPrice
    self.targetWeightMax = targetWeightMax
    self.targetWeightMin = targetWeightMin
    self.unit = unit
    self.weightMax = weightMax
    self.weightMin = weightMin
    self.imageUrls = imageUrls
    self.nutriens = nutriens
    self.ingradients = ingradients
    self.menus = menus
    }
    override init() {
    self.id = 0
    self.name = ""
    self.createdDate = ""
    self.explanation = ""
    self.goal = ""
    self.cost = 0
    self.activityLevelMax = 0
    self.activityLevelMin = 0
    self.bodyType = ""
    self.dailyKcalMax = 0
    self.dailyKcalMin = 0
    self.nutritionistId = 0
    self.salesPrice = 0
    self.targetWeightMax = 0
    self.targetWeightMin = 0
    self.unit = ""
    self.weightMax = 0
    self.weightMin = 0
    self.imageUrls = []
    self.nutriens = []
    self.ingradients = []
    self.menus = []
    }
    func encode( with coder: NSCoder) {
    coder.encode(activityLevelMax, forKey: "activityLevelMax")
    coder.encode(activityLevelMin, forKey: "activityLevelMin")
    coder.encode(bodyType, forKey: "bodyType")
    coder.encode(cost, forKey: "cost")
    coder.encode(createdDate, forKey: "createdDate")
    coder.encode(dailyKcalMax, forKey: "dailyKcalMax")
    coder.encode(dailyKcalMin, forKey: "dailyKcalMin")
    coder.encode(explanation, forKey: "explanation")
    coder.encode(goal, forKey: "goal")
    coder.encode(id!, forKey: "id")
    coder.encode(name, forKey: "name")
    coder.encode(nutritionistId, forKey: "nutritionistId")
    coder.encode(salesPrice, forKey: "salesPrice")
    coder.encode(targetWeightMax, forKey: "targetWeightMax")
    coder.encode(targetWeightMin, forKey: "targetWeightMin")
    coder.encode(unit, forKey: "unit")
    coder.encode(weightMax, forKey: "weightMax")
    coder.encode(weightMin, forKey: "weightMin")
    coder.encode(imageUrls, forKey: "imageUrls")
    coder.encode(nutriens, forKey: "nutriens")
    coder.encode(ingradients, forKey: "ingradients")
    coder.encode(menus, forKey: "menus")
    }
    required public init?(coder decoder: NSCoder) {
    self.id = decoder.decodeInteger(forKey: "id")
    self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
    self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
    self.explanation = decoder.decodeObject(forKey: "explanation") as? String ?? ""
    self.goal = decoder.decodeObject(forKey: "goal") as? String ?? ""
    self.cost = decoder.decodeObject(forKey: "cost") as? Double ?? 0
    self.activityLevelMax = decoder.decodeInteger(forKey: "activityLevelMax")
    self.activityLevelMin = decoder.decodeInteger(forKey: "activityLevelMin")
    self.bodyType = decoder.decodeObject(forKey: "bodyType") as? String ?? ""
    self.dailyKcalMax = decoder.decodeObject(forKey: "dailyKcalMax") as? Double ?? 0
    self.dailyKcalMin = decoder.decodeObject(forKey: "dailyKcalMin") as? Double ?? 0
    self.nutritionistId = decoder.decodeInteger(forKey: "nutritionistId")
    self.salesPrice = decoder.decodeObject(forKey: "salesPrice") as? Double ?? 0
    self.targetWeightMax = decoder.decodeObject(forKey: "targetWeightMax") as? Double ?? 0
    self.targetWeightMin = decoder.decodeObject(forKey: "targetWeightMin") as? Double ?? 0
    self.unit = decoder.decodeObject(forKey: "unit") as? String ?? ""
    self.weightMax = decoder.decodeObject(forKey: "weightMax") as? Double ?? 0
    self.weightMin = decoder.decodeObject(forKey: "weightMin") as? Double ?? 0
    self.imageUrls = decoder.decodeObject(forKey: "imageUrls") as? [ImageUrl] ?? []
    self.nutriens = decoder.decodeObject(forKey: "nutriens") as? [Nutriens] ?? []
    self.ingradients = decoder.decodeObject(forKey: "ingradients") as? [Ingredients] ?? []
    self.menus = decoder.decodeObject(forKey: "menus") as? [Menus] ?? []
    }
}
