//
//  CustomerHealths.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit

class CustomerHealths: NSObject, NSCoding, Codable {
var active : Bool
var activityLevel : Double
var createdDate : String
var currentHeight : Double
var currentWeight : Double
var detail : String
var goal : String
var id : Int?
var measureUnit : String
var name : String
var targerCalorie : Double
var targetBodyFat : String
var targetWeight : Double
    init (
    active : Bool,
    activityLevel : Double,
    createdDate : String,
    currentHeight : Double,
    currentWeight : Double,
    detail : String,
    goal : String,
    id : Int,
    measureUnit : String,
    name : String,
    targerCalorie : Double,
    targetBodyFat : String,
    targetWeight : Double)
        {
            self.active = active
            self.activityLevel = activityLevel
            self.createdDate = createdDate
            self.currentHeight = currentHeight
            self.currentWeight = currentWeight
            self.detail = detail
            self.goal = goal
            self.id = id
            self.measureUnit = measureUnit
            self.name = name
            self.targerCalorie = targerCalorie
            self.targetBodyFat = targetBodyFat
            self.targetWeight = targetWeight
        }
        override init() {
            self.id = 0
            self.name = ""
            self.active = true
            self.createdDate = ""
            self.detail = ""
            self.activityLevel = 3.3
            self.currentHeight = 5.4
            self.currentWeight = 4.2
            self.goal = ""
            self.measureUnit = ""
            self.targerCalorie = 1000
            self.targetBodyFat = ""
            self.targetWeight = 65
        }
    func encode( with coder: NSCoder) {
        coder.encode(active, forKey: "active")
        coder.encode(activityLevel, forKey: "activityLevel")
        coder.encode(createdDate, forKey: "createdDate")
        coder.encode(currentHeight, forKey: "currentHeight")
        coder.encode(currentWeight, forKey: "currentWeight")
        coder.encode(detail, forKey: "detail")
        coder.encode(goal, forKey: "goal")
        coder.encode(id!, forKey: "id")
        coder.encode(measureUnit, forKey: "measureUnit")
        coder.encode(name, forKey: "name")
        coder.encode(targerCalorie, forKey: "targerCalorie")
        coder.encode(targetBodyFat, forKey: "targetBodyFat")
        coder.encode(targetWeight, forKey: "targetWeight")
    }
    required public init?(coder decoder: NSCoder) {
    self.id = decoder.decodeInteger(forKey: "id")
    self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
    self.active = decoder.decodeObject(forKey: "active") as? Bool ?? true
    self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
    self.detail = decoder.decodeObject(forKey: "detail") as? String ?? ""
        self.activityLevel = decoder.decodeObject(forKey: "activityLevel") as? Double ?? 0.0
        self.currentHeight = decoder.decodeObject(forKey: "currentHeight") as? Double ?? 0.0
        self.currentWeight = decoder.decodeObject(forKey: "currentWeight") as? Double ?? 0.0
    self.goal = decoder.decodeObject(forKey: "goal") as? String ?? ""
    self.measureUnit = decoder.decodeObject(forKey: "measureUnit") as? String ?? ""
        self.targerCalorie = decoder.decodeObject(forKey: "targerCalorie") as? Double ?? 0.0
    self.targetBodyFat = decoder.decodeObject(forKey: "targetBodyFat") as? String ?? ""
        self.targetWeight = decoder.decodeObject(forKey: "targetWeight") as? Double ?? 0.0
    }
}
    
