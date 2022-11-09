//
//  ImagesUrl.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class ImageUrl: NSObject, NSCoding, Codable {
var createdDate : String
var explanation : String
var id : Int?
var name : String
var type : String
var urlAddress : String
    init (
        createdDate : String,
        explanation : String,
        id : Int,
        name : String,
        type : String,
        urlAddress : String)
            {
                self.createdDate = createdDate
                self.explanation = explanation
                self.id = id
                self.name = name
                self.type = type
                self.urlAddress = urlAddress
                
            }
            override init() {
                self.id = 0
                self.name = ""
                self.createdDate = ""
                self.explanation = ""
                self.type = ""
                self.urlAddress = ""
                
            }
    func encode( with coder: NSCoder) {
        coder.encode(createdDate, forKey: "createdDate")
        coder.encode(explanation, forKey: "explanation")
        coder.encode(id!, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(type, forKey: "type")
        coder.encode(urlAddress, forKey: "urlAddress")
        
    }
    required public init?(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
        self.explanation = decoder.decodeObject(forKey: "explanation") as? String ?? ""
        self.type = decoder.decodeObject(forKey: "type") as? String ?? ""
            self.urlAddress = decoder.decodeObject(forKey: "urlAddress") as? String ?? ""
        
    }
}
    
