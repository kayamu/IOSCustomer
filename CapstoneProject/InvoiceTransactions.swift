//
//  InvoiceTransactions.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class InvoiceTransactions: NSObject, NSCoding, Codable {
var createdDate : String
var id : Int?
var type : String
var statusChangedDate : String
var transactionDate : String
var invoices : [Invoices]
    
    init (
    createdDate : String,
    id : Int,
    type : String,
    statusChangedDate : String,
    transactionDate : String,
    invoices : [Invoices])
    
    {
            self.createdDate = createdDate
            self.id = id
            self.statusChangedDate = statusChangedDate
            self.transactionDate = transactionDate
            self.type = type
            self.invoices = invoices
    
    }
    
    override init() {
        self.id = 0
        self.createdDate = ""
        self.type = ""
        self.statusChangedDate = ""
        self.transactionDate = ""
        self.invoices = []

    }
    func encode( with coder: NSCoder) {
        coder.encode(createdDate, forKey: "createdDate")
        coder.encode(id!, forKey: "id")
        coder.encode(statusChangedDate, forKey: "statusChangedDate")
        coder.encode(transactionDate, forKey: "transactionDate")
        coder.encode(type, forKey: "type")
        coder.encode(invoices, forKey: "invoices")
    }
    
    required public init?(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
        self.type = decoder.decodeObject(forKey: "type") as? String ?? ""
        self.statusChangedDate = decoder.decodeObject(forKey: "statusChangedDate") as? String ?? ""
        self.transactionDate = decoder.decodeObject(forKey: "transactionDate") as? String ?? ""
        self.invoices = decoder.decodeObject(forKey: "invoices") as? [Invoices] ?? []
    }
}
