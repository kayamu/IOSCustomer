//
//  InvoiceContacts.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class InvoiceContacts: NSObject, NSCoding, Codable {
var billingInfoCity : String
var billingInfoPostCode : String
var billingInfoProvince : String
var billingInfoStreet1 : String
var billingInfoStreet2 : String
var contactInfoCity : String
var contactInfoId : Int?
var contactInfoPostCode : String
var contactInfoProvince : String
var contactInfoStreet1 : String
var contactInfoStreet2 : String
var createdDate : String
var customerBillingInfoId : Int?
var customerContactInfoId : Int?
var customerId : Int?
var customerType : String
var id : Int?
var name : String
var phone : String
var taxNumber : String
    init (
    billingInfoCity : String,
    billingInfoPostCode : String,
    billingInfoProvince : String,
    billingInfoStreet1 : String,
    billingInfoStreet2 : String,
    contactInfoCity : String,
    contactInfoId : Int,
    contactInfoPostCode : String,
    contactInfoProvince : String,
    contactInfoStreet1 : String,
    contactInfoStreet2 : String,
    createdDate : String,
    customerBillingInfoId : Int,
    customerContactInfoId : Int,
    customerId : Int,
    customerType : String,
    id : Int,
    name : String,
    phone : String,
    taxNumber : String
    )
        {
            self.billingInfoCity = billingInfoCity
            self.billingInfoPostCode = billingInfoPostCode
            self.billingInfoProvince = billingInfoProvince
            self.billingInfoStreet1 = billingInfoStreet1
            self.billingInfoStreet2 = billingInfoStreet2
            self.contactInfoCity = contactInfoCity
            self.contactInfoId = contactInfoId
            self.contactInfoPostCode = contactInfoPostCode
            self.contactInfoProvince = contactInfoProvince
            self.contactInfoStreet1 = contactInfoStreet1
            self.contactInfoStreet2 = contactInfoStreet2
            self.createdDate = createdDate
            self.customerBillingInfoId = customerBillingInfoId
            self.customerContactInfoId = customerContactInfoId
            self.customerId = customerId
            self.customerType = customerType
            self.id = id
            self.name = name
            self.phone = phone
            self.taxNumber = taxNumber
        }
        override init() {
            self.id = 0
            self.name = ""
            self.createdDate = ""
            self.phone = ""
            self.billingInfoCity = ""
            self.billingInfoPostCode = ""
            self.billingInfoProvince = ""
            self.billingInfoStreet1 = ""
            self.billingInfoStreet2 = ""
            self.contactInfoCity = ""
            self.contactInfoId = 0
            self.contactInfoPostCode = ""
            self.contactInfoProvince = ""
            self.contactInfoStreet1 = ""
            self.contactInfoStreet2 = ""
            self.customerBillingInfoId = 0
            self.customerContactInfoId = 0
            self.customerId = 0
            self.customerType = ""
            self.taxNumber = ""
        }
    func encode( with coder: NSCoder) {
        coder.encode(billingInfoCity, forKey: "billingInfoCity")
        coder.encode(billingInfoPostCode, forKey: "billingInfoPostCode")
        coder.encode(billingInfoProvince, forKey: "billingInfoProvince")
        coder.encode(billingInfoStreet1, forKey: "billingInfoStreet1")
        coder.encode(billingInfoStreet2, forKey: "billingInfoStreet2")
        coder.encode(contactInfoCity, forKey: "contactInfoCity")
        coder.encode(contactInfoId, forKey: "contactInfoId")
        coder.encode(contactInfoPostCode, forKey: "contactInfoPostCode")
        coder.encode(contactInfoProvince, forKey: "contactInfoProvince")
        coder.encode(contactInfoStreet1, forKey: "contactInfoStreet1")
        coder.encode(contactInfoStreet2, forKey: "contactInfoStreet2")
        coder.encode(createdDate, forKey: "createdDate")
        coder.encode(customerBillingInfoId, forKey: "customerBillingInfoId")
        coder.encode(customerContactInfoId, forKey: "customerContactInfoId")
        coder.encode(customerId, forKey: "customerId")
        coder.encode(customerType, forKey: "customerType")
        coder.encode(id!, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(phone, forKey: "phone")
        coder.encode(taxNumber, forKey: "taxNumber")
    }
    required public init?(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
        self.phone = decoder.decodeObject(forKey: "phone") as? String ?? ""
        self.billingInfoCity = decoder.decodeObject(forKey: "billingInfoCity") as? String ?? ""
        self.billingInfoPostCode = decoder.decodeObject(forKey: "billingInfoPostCode") as? String ?? ""
        self.billingInfoProvince = decoder.decodeObject(forKey: "billingInfoProvince") as? String ?? ""
        self.billingInfoStreet1 = decoder.decodeObject(forKey: "billingInfoStreet1") as? String ?? ""
        self.billingInfoStreet2 = decoder.decodeObject(forKey: "billingInfoStreet2") as? String ?? ""
        self.contactInfoCity = decoder.decodeObject(forKey: "contactInfoCity") as? String ?? ""
        self.contactInfoId = decoder.decodeObject(forKey: "contactInfoId") as? Int ?? 0
        self.contactInfoPostCode = decoder.decodeObject(forKey: "contactInfoPostCode") as? String ?? ""
        self.contactInfoProvince = decoder.decodeObject(forKey: "contactInfoProvince") as? String ?? ""
        self.contactInfoStreet1 = decoder.decodeObject(forKey: "contactInfoStreet1") as? String ?? ""
        self.contactInfoStreet2 = decoder.decodeObject(forKey: "contactInfoStreet2") as? String ?? ""
        self.customerBillingInfoId = decoder.decodeObject(forKey: "customerBillingInfoId") as? Int ?? 0
        self.customerContactInfoId = decoder.decodeObject(forKey: "customerContactInfoId") as? Int ?? 0
        self.customerId = decoder.decodeObject(forKey: "customerId") as? Int ?? 0
        self.customerType = decoder.decodeObject(forKey: "customerType") as? String ?? ""
        self.taxNumber = decoder.decodeObject(forKey: "taxNumber") as? String ?? ""
    }
}
