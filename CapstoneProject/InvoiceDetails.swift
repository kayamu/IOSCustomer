//
//  InvoiceDetails.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class InvoiceDetails: NSObject, NSCoding, Codable {
var createdDate : String
var customerCartId : Int
var customerId : Int
var detailAmount : Double
var id : Int?
var itemCode : String
var itemId : Int
var itemName : String
var itemType : String
var paymentType : String
var subscriptionDurationWeeks : Int
var nutritionistId : Int
var subscriptionStartingDate : String
var totalCost : Double
var totalProfit : Double
var totalAmount : Double
var fedaralTaxesAmount : Double
var provintionalTaxesAmount : Double
var addOnAmount : Double
var lineNumber : Int
var nutritionistEarning : Double
var nutritionistPercentage : Double
var fedaralTaxesPercentage : Double
var provintionalTaxesPercentage : Double
var totalTaxesAmount : Double
var totalTaxesPercentage : Double
var discountAmount : Double
var discountPercentage : Double
var addOnCode : String
var addOnPercentage : Double
var subItems : [SubItems]
    init (
        createdDate : String,
        customerCartId : Int,
        customerId : Int,
        detailAmount : Double,
        id : Int,
        itemCode : String,
        itemId : Int,
        itemName : String,
        itemType : String,
        paymentType : String,
        subscriptionDurationWeeks : Int,
        nutritionistId : Int,
        subscriptionStartingDate : String,
        totalCost : Double,
        totalProfit : Double,
        totalAmount : Double,
        fedaralTaxesAmount : Double,
        provintionalTaxesAmount : Double,
        addOnAmount : Double,
        lineNumber : Int,
        nutritionistEarning : Double,
        nutritionistPercentage : Double,
        fedaralTaxesPercentage : Double,
        provintionalTaxesPercentage : Double,
        totalTaxesAmount : Double,
        totalTaxesPercentage : Double,
        discountAmount : Double,
        discountPercentage : Double,
        addOnCode : String,
        addOnPercentage : Double,
        subItems : [SubItems]
        )
            {
                self.createdDate = createdDate
                self.customerCartId = customerCartId
                self.customerId = customerId
                self.detailAmount = detailAmount
                self.id = id
                self.itemCode = itemCode
                self.itemId = itemId
                self.itemName = itemName
                self.itemType = itemType
                self.nutritionistId = nutritionistId
                self.paymentType = paymentType
                self.subscriptionDurationWeeks = subscriptionDurationWeeks
                self.subscriptionStartingDate = subscriptionStartingDate
                self.totalCost = totalCost
                self.totalProfit = totalProfit
                self.totalAmount = totalAmount
                self.fedaralTaxesAmount = fedaralTaxesAmount
                self.provintionalTaxesAmount = provintionalTaxesAmount
                self.addOnAmount = addOnAmount
                self.lineNumber = lineNumber
                self.nutritionistEarning = nutritionistEarning
                self.nutritionistPercentage = nutritionistPercentage
                self.fedaralTaxesPercentage = fedaralTaxesPercentage
                self.provintionalTaxesPercentage = provintionalTaxesPercentage
                self.totalTaxesAmount = totalTaxesAmount
                self.totalTaxesPercentage = totalTaxesPercentage
                self.discountAmount = discountAmount
                self.discountPercentage = discountPercentage
                self.addOnCode = addOnCode
                self.addOnPercentage = addOnPercentage
                self.subItems = subItems
            }
            override init() {
                self.id = 0
                self.createdDate = ""
                self.customerId = 0
                self.customerCartId = 0
                self.detailAmount = 0
                self.itemCode = ""
                self.itemId = 0
                self.itemName = ""
                self.itemType = ""
                self.paymentType = ""
                self.subscriptionDurationWeeks = 0
                self.nutritionistId = 0
                self.subscriptionStartingDate = ""
                self.totalCost = 0
                self.totalProfit = 0
                self.totalAmount = 0
                self.fedaralTaxesAmount = 0
                self.provintionalTaxesAmount = 0
                self.addOnAmount = 0
                self.lineNumber = 0
                self.nutritionistEarning = 0
                self.nutritionistPercentage = 0
                self.fedaralTaxesPercentage = 0
                self.provintionalTaxesPercentage = 0
                self.totalTaxesAmount = 0
                self.totalTaxesPercentage = 0
                self.discountAmount = 0
                self.discountPercentage = 0
                self.addOnCode = ""
                self.addOnPercentage = 0
                self.subItems = [SubItems]
            }
    func encode( with coder: NSCoder) {
            coder.encode(createdDate, forKey: "createdDate")
            coder.encode(customerCartId, forKey: "customerCartId")
            coder.encode(customerId, forKey: "customerId")
            coder.encode(detailAmount, forKey: "detailAmount")
            coder.encode(id!, forKey: "id")
            coder.encode(itemCode, forKey: "itemCode")
            coder.encode(itemId, forKey: "itemId")
            coder.encode(itemName, forKey: "itemName")
            coder.encode(itemType, forKey: "itemType")
            coder.encode(nutritionistId, forKey: "nutritionistId")
            coder.encode(paymentType, forKey: "paymentType")
            coder.encode(subscriptionDurationWeeks, forKey: "subscriptionDurationWeeks")
            coder.encode(subscriptionStartingDate, forKey: "subscriptionStartingDate")
            coder.encode(totalCost, forKey: "totalCost")
            coder.encode(totalProfit, forKey: "totalProfit")
            coder.encode(totalAmount, forKey: "totalAmount")
            coder.encode(fedaralTaxesAmount, forKey: "fedaralTaxesAmount")
            coder.encode(provintionalTaxesAmount, forKey: "provintionalTaxesAmount")
            coder.encode(addOnAmount, forKey: "addOnAmount")
            coder.encode(lineNumber, forKey: "lineNumber")
            coder.encode(nutritionistEarning, forKey: "nutritionistEarning")
            coder.encode(nutritionistPercentage, forKey: "nutritionistPercentage")
            coder.encode(fedaralTaxesPercentage, forKey: "fedaralTaxesPercentage")
            coder.encode(provintionalTaxesPercentage, forKey: "provintionalTaxesPercentage")
            coder.encode(totalTaxesAmount, forKey: "totalTaxesAmount")
            coder.encode(totalTaxesPercentage, forKey: "totalTaxesPercentage")
            coder.encode(discountAmount, forKey: "discountAmount")
            coder.encode(discountPercentage, forKey: "discountPercentage")
            coder.encode(addOnCode, forKey: "addOnCode")
            coder.encode(addOnPercentage, forKey: "addOnPercentage")
            coder.encode(subItems, forKey: "subItems")

    }
    required public init?(coder decoder: NSCoder) {
    self.id = decoder.decodeInteger(forKey: "id")
    self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
    self.customerId = decoder.decodeObject(forKey: "customerId") as? Int ?? 0
    self.customerCartId = decoder.decodeObject(forKey: "customerCartId") as? Int ?? 0
    self.detailAmount = decoder.decodeObject(forKey: "detailAmount") as? Double ?? 0
    self.itemCode = decoder.decodeObject(forKey: "itemCode") as? String ?? ""
    self.itemId = decoder.decodeObject(forKey: "itemId") as? Int ?? 0
    self.itemName = decoder.decodeObject(forKey: "itemName") as? String ?? ""
    self.itemType = decoder.decodeObject(forKey: "itemType") as? String ?? ""
    self.paymentType = decoder.decodeObject(forKey: "paymentType") as? String ?? ""
    self.subscriptionDurationWeeks = decoder.decodeInteger(forKey: "subscriptionDurationWeeks")
    self.nutritionistId = decoder.decodeObject(forKey: "nutritionistId") as? Int ?? 0
    self.subscriptionStartingDate = decoder.decodeObject(forKey: "subscriptionStartingDate") as? String ?? ""
    self.totalCost = decoder.decodeObject(forKey: "totalCost") as? Double ?? 0
    self.totalProfit = decoder.decodeObject(forKey: "totalProfit") as? Double ?? 0
    self.totalAmount = decoder.decodeObject(forKey: "totalAmount") as? Double ?? 0
    self.fedaralTaxesAmount = decoder.decodeObject(forKey: "fedaralTaxesAmount") as? Double ?? 0
    self.provintionalTaxesAmount = decoder.decodeObject(forKey: "provintionalTaxesAmount") as? Double ?? 0
    self.addOnAmount = decoder.decodeObject(forKey: "addOnAmount") as? Double ?? 0
    self.lineNumber = decoder.decodeInteger(forKey: "lineNumber")
    self.nutritionistEarning = decoder.decodeObject(forKey: "nutritionistEarning") as? Double ?? 0
    self.nutritionistPercentage = decoder.decodeObject(forKey: "nutritionistPercentage") as? Double ?? 0
    self.fedaralTaxesPercentage = decoder.decodeObject(forKey: "fedaralTaxesPercentage") as? Double ?? 0
    self.provintionalTaxesPercentage = decoder.decodeObject(forKey: "provintionalTaxesPercentage") as? Double ?? 0
    self.totalTaxesAmount = decoder.decodeObject(forKey: "totalTaxesAmount") as? Double ?? 0
    self.totalTaxesPercentage = decoder.decodeObject(forKey: "totalTaxesPercentage") as? Double ?? 0
    self.discountAmount = decoder.decodeObject(forKey: "discountAmount") as? Double ?? 0
    self.discountPercentage = decoder.decodeObject(forKey: "discountPercentage") as? Double ?? 0
    self.addOnCode = decoder.decodeObject(forKey: "addOnCode") as? String ?? ""
    self.addOnPercentage = decoder.decodeObject(forKey: "addOnPercentage") as? Double ?? 0
    self.subItems = decoder.decodeObject(forKey: "subItems") as? [SubItems] ?? []
    }
}
