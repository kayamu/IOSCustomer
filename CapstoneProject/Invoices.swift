//
//  Invoices.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class Invoices: NSObject, NSCoding, Codable {
var createdDate : String
var customerBillingInfoId : Int?
var customerCartId : Int?
var customerContactInfoId : Int?
var customerId : Int?
var customerName : String
var customerType : String
var id : Int?
var invoiceNumber : String
var type : String
var totalCost : Double
var totalProfit : Double
var totalAmount : Double
var fedaralTaxesAmount : Double
var provintionalTaxesAmount : Double
var addOnAmount : Double
var requestDate : String
var invoiceDate : String
var lastTranactionId : Int?
var totalTaxes : Double
var discountsAmount : Double
var message : String
var invoiceDetails : [InvoiceDetails]
var invoiceContacts : [InvoiceContacts]

    init (
    createdDate : String,
    customerBillingInfoId : Int,
    customerCartId : Int,
    customerContactInfoId : Int,
    customerId : Int,
    customerName : String,
    customerType : String,
    id : Int,
    invoiceNumber : String,
    type : String,
    totalCost : Double,
    totalProfit : Double,
    totalAmount : Double,
    fedaralTaxesAmount : Double,
    provintionalTaxesAmount : Double,
    addOnAmount : Double,
    requestDate : String,
    invoiceDate : String,
    lastTranactionId : Int,
    totalTaxes : Double,
    discountsAmount : Double,
    message : String,
    invoiceDetails : [InvoiceDetails],
    invoiceContacts : [InvoiceContacts])
    
        {
            self.createdDate = createdDate
            self.customerBillingInfoId = customerBillingInfoId
            self.customerCartId = customerCartId
            self.customerContactInfoId = customerContactInfoId
            self.customerId = customerId
            self.customerName = customerName
            self.customerType = customerType
            self.id = id
            self.invoiceNumber = invoiceNumber
            self.requestDate = requestDate
            self.type = type
            self.totalCost = totalCost
            self.totalProfit = totalProfit
            self.totalAmount = totalAmount
            self.fedaralTaxesAmount = fedaralTaxesAmount
            self.provintionalTaxesAmount = provintionalTaxesAmount
            self.addOnAmount = addOnAmount
            self.invoiceDate = invoiceDate
            self.lastTranactionId = lastTranactionId
            self.totalTaxes = totalTaxes
            self.discountsAmount = discountsAmount
            self.message = message
            self.invoiceDetails = invoiceDetails
            self.invoiceContacts = invoiceContacts
        }
    
        override init() {
            self.id = 0
            self.createdDate = ""
            self.customerName = ""
            self.customerBillingInfoId = 0
            self.customerContactInfoId = 0
            self.customerId = 0
            self.customerType = ""
            self.customerCartId = 0
            self.invoiceNumber = ""
            self.type = ""
            self.totalCost = 0
            self.totalProfit = 0
            self.totalAmount = 0
            self.fedaralTaxesAmount = 0
            self.provintionalTaxesAmount = 0
            self.addOnAmount = 0
            self.requestDate = ""
            self.invoiceDate = ""
            self.lastTranactionId = 0
            self.totalTaxes = 0
            self.discountsAmount = 0
            self.message = ""
            self.invoiceDetails = []
            self.invoiceContacts = []
        }
    func encode( with coder: NSCoder) {
            coder.encode(createdDate, forKey: "createdDate")
            coder.encode(customerBillingInfoId, forKey: "customerBillingInfoId")
            coder.encode(customerCartId, forKey: "customerCartId")
            coder.encode(customerContactInfoId, forKey: "customerContactInfoId")
            coder.encode(customerId, forKey: "customerId")
            coder.encode(customerName, forKey: "customerName")
            coder.encode(customerType, forKey: "customerType")
            coder.encode(id!, forKey: "id")
            coder.encode(invoiceNumber, forKey: "invoiceNumber")
            coder.encode(requestDate, forKey: "requestDate")
            coder.encode(type, forKey: "type")
            coder.encode(totalCost, forKey: "totalCost")
            coder.encode(totalProfit, forKey: "totalProfit")
            coder.encode(totalAmount, forKey: "totalAmount")
            coder.encode(fedaralTaxesAmount, forKey: "fedaralTaxesAmount")
            coder.encode(provintionalTaxesAmount, forKey: "provintionalTaxesAmount")
            coder.encode(addOnAmount, forKey: "addOnAmount")
            coder.encode(invoiceDate, forKey: "invoiceDate")
            coder.encode(lastTranactionId, forKey: "lastTranactionId")
            coder.encode(totalTaxes, forKey: "totalTaxes")
            coder.encode(discountsAmount, forKey: "discountsAmount")
            coder.encode(message, forKey: "message")
            coder.encode(invoiceDetails, forKey: "invoiceDetails")
            coder.encode(invoiceContacts, forKey: "invoiceContacts")
    }
    required public init?(coder decoder: NSCoder) {
            self.id = decoder.decodeInteger(forKey: "id")
            self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
            self.customerName = decoder.decodeObject(forKey: "customerName") as? String ?? ""
            self.customerBillingInfoId = decoder.decodeObject(forKey: "customerBillingInfoId") as? Int ?? 0
            self.customerContactInfoId = decoder.decodeObject(forKey: "customerContactInfoId") as? Int ?? 0
            self.customerId = decoder.decodeObject(forKey: "customerId") as? Int ?? 0
            self.customerType = decoder.decodeObject(forKey: "customerType") as? String ?? ""
            self.customerCartId = decoder.decodeObject(forKey: "customerCartId") as? Int ?? 0
            self.invoiceNumber = decoder.decodeObject(forKey: "invoiceNumber") as? String ?? ""
            self.type = decoder.decodeObject(forKey: "type") as? String ?? ""
            self.totalCost = decoder.decodeObject(forKey: "totalCost") as? Double ?? 0
            self.totalProfit = decoder.decodeObject(forKey: "totalProfit") as? Double ?? 0
            self.totalAmount = decoder.decodeObject(forKey: "totalAmount") as? Double ?? 0
            self.fedaralTaxesAmount = decoder.decodeObject(forKey: "fedaralTaxesAmount") as? Double ?? 0
            self.provintionalTaxesAmount = decoder.decodeObject(forKey: "provintionalTaxesAmount") as? Double ?? 0
            self.addOnAmount = decoder.decodeObject(forKey: "addOnAmount") as? Double ?? 0
            self.requestDate = decoder.decodeObject(forKey: "requestDate") as? String ?? ""
            self.invoiceDate = decoder.decodeObject(forKey: "invoiceDate") as? String ?? ""
            self.lastTranactionId = decoder.decodeObject(forKey: "lastTranactionId") as? Int ?? 0
            self.totalTaxes = decoder.decodeObject(forKey: "totalTaxes") as? Double ?? 0
            self.discountsAmount = decoder.decodeObject(forKey: "discountsAmount") as? Double ?? 0
            self.message = decoder.decodeObject(forKey: "message") as? String ?? ""
            self.invoiceDetails = decoder.decodeObject(forKey: "invoiceDetails") as? [InvoiceDetails] ?? []
            self.invoiceContacts = decoder.decodeObject(forKey: "invoiceContacts") as? [InvoiceContacts] ?? []
    }
}
