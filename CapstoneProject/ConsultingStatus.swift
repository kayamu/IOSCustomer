//
//  ConsultingStatus.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class ConsultingStatus: NSObject, NSCoding, Codable {
var id : Int?
var lastStatus : String
var customerId : Int
 
    init (
    id : Int,
    lastStatus : String,
    customerId : Int)
        {
            self.customerId = customerId
            self.id = id
            self.lastStatus = lastStatus
        }
        override init() {
            self.id = 0
            self.customerId = 0
            self.lastStatus = ""
        }
    func encode( with coder: NSCoder) {
        coder.encode(customerId, forKey: "customerId")
        coder.encode(id!, forKey: "id")
        coder.encode(lastStatus, forKey: "lastStatus")
    }
    required public init?(coder decoder: NSCoder) {
    self.id = decoder.decodeInteger(forKey: "id")
    self.customerId = decoder.decodeInteger(forKey: "customerId")
    self.lastStatus = decoder.decodeObject(forKey: "lastStatus") as? String ?? ""
    }
}
