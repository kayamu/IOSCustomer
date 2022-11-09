//
//  ConditionDetails.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit

class ConditionDetails : NSObject, NSCoding, Codable {
var compareField : String
var compareValue : String
var createdDate : String
var explanation : String
var groupLogicType : String
var id : Int?
var lineLogicType : String
var name : String
var operatorN : String
var groupIndex : Int
var conditionDetails : [ConditionDetails]
    init (
    compareField : String,
    compareValue : String,
    createdDate : String,
    explanation : String,
    groupLogicType : String,
    id : Int,
    lineLogicType : String,
    name : String,
    operatorN : String,
    groupIndex : Int,
    conditionDetails : [ConditionDetails])
        {
            self.compareField = compareField
            self.compareValue = compareValue
            self.createdDate = createdDate
            self.explanation = explanation
            self.groupIndex = groupIndex
            self.groupLogicType = groupLogicType
            self.id = id
            self.lineLogicType = lineLogicType
            self.name = name
            self.operatorN = operatorN
            self.conditionDetails = conditionDetails
        }
        override init() {
            self.id = 0
            self.name = ""
            self.createdDate = ""
            self.compareField = ""
            self.compareValue = ""
            self.explanation = ""
            self.groupIndex = 0
            self.groupLogicType = ""
            self.lineLogicType = ""
            self.operatorN = ""
            self.conditionDetails = []
       
        }
    func encode( with coder: NSCoder) {
    coder.encode(compareField, forKey: "compareField")
    coder.encode(compareValue, forKey: "compareValue")
    coder.encode(createdDate, forKey: "createdDate")
    coder.encode(explanation, forKey: "explanation")
    coder.encode(groupIndex, forKey: "groupIndex")
    coder.encode(groupLogicType, forKey: "groupLogicType")
    coder.encode(id!, forKey: "id")
    coder.encode(lineLogicType, forKey: "lineLogicType")
    coder.encode(name, forKey: "name")
    coder.encode(operatorN, forKey: "operatorN")
    coder.encode(conditionDetails, forKey: "conditionDetails")
        
    }
    required public init?(coder decoder: NSCoder) {
    self.id = decoder.decodeInteger(forKey: "id")
    self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
    self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
    self.compareField = decoder.decodeObject(forKey: "compareField") as? String ?? ""
    self.compareValue = decoder.decodeObject(forKey: "compareValue") as? String ?? ""
    self.explanation = decoder.decodeObject(forKey: "explanation") as? String ?? ""
    self.groupIndex = decoder.decodeInteger(forKey: "groupIndex")
    self.groupLogicType = decoder.decodeObject(forKey: "groupLogicType") as? String ?? ""
    self.lineLogicType = decoder.decodeObject(forKey: "lineLogicType") as? String ?? ""
    self.operatorN = decoder.decodeObject(forKey: "operatorN") as? String ?? ""
    self.conditionDetails = decoder.decodeObject(forKey: "conditionDetails") as? [ConditionDetails] ??  []
    }
}
