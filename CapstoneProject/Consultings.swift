//
//  Consultings.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class Consultings: NSObject, NSCoding, Codable {

var createdDate : String
var customerName : String
var customerNotes : String
var id : Int?
var lastStatus : String
var customerId : Int
var consultingStatus : [ConsultingStatus]
var nutritionist : [Nutritionist]
var epicrysis : [Epicrysis]
var menuSuggestions : [MenuSuggestions]

    init (
    createdDate : String,
    customerName : String,
    customerNotes : String,
    id : Int,
    lastStatus : String,
    customerId : Int,
    consultingStatus : [ConsultingStatus],
    nutritionist : [Nutritionist],
    epicrysis : [Epicrysis],
    menuSuggestions : [MenuSuggestions])
        {
            self.createdDate = createdDate
            self.customerId = customerId
            self.customerName = customerName
            self.customerNotes = customerNotes
            self.id = id
            self.lastStatus = lastStatus
            self.consultingStatus = consultingStatus
            self.nutritionist = nutritionist
            self.epicrysis = epicrysis
            self.menuSuggestions = menuSuggestions
        }
        override init() {
            self.id = 0
            self.createdDate = ""
            self.customerId = 0
            self.customerName = ""
            self.customerNotes = ""
            self.lastStatus = ""
            self.consultingStatus = []
            self.nutritionist = []
            self.epicrysis = []
            self.menuSuggestions = []
        }
    func encode( with coder: NSCoder) {
    coder.encode(createdDate, forKey: "createdDate")
    coder.encode(customerId, forKey: "customerId")
    coder.encode(customerName, forKey: "customerName")
    coder.encode(customerNotes, forKey: "customerNotes")
    coder.encode(id!, forKey: "id")
    coder.encode(lastStatus, forKey: "lastStatus")
    coder.encode(consultingStatus, forKey: "consultingStatus")
    coder.encode(nutritionist, forKey: "nutritionist")
    coder.encode(epicrysis, forKey: "epicrysis")
    coder.encode(menuSuggestions, forKey: "menuSuggestions")
    }
    
    required public init?(coder decoder: NSCoder) {
    self.id = decoder.decodeInteger(forKey: "id")
    self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
    self.customerId = decoder.decodeInteger(forKey: "customerId")
    self.customerName = decoder.decodeObject(forKey: "customerName") as? String ?? ""
    self.customerNotes = decoder.decodeObject(forKey: "customerNotes") as? String ?? ""
    self.lastStatus = decoder.decodeObject(forKey: "lastStatus") as? String ?? ""
    self.consultingStatus = decoder.decodeObject(forKey: "consultingStatus") as? [ConsultingStatus] ?? []
    self.nutritionist = decoder.decodeObject(forKey: "nutritionist") as? [Nutritionist] ?? []
    self.epicrysis = decoder.decodeObject(forKey: "epicrysis") as? [Epicrysis] ?? []
    self.menuSuggestions = decoder.decodeObject(forKey: "menuSuggestions") as? [MenuSuggestions] ?? []
    
    }
    
}
