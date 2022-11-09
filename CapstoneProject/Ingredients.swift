//
//  Ingredients.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-11-01.
//

import UIKit
class Ingredients: NSObject, NSCoding, Codable {
var createdDate : String
var id : Int?
var name : String
var imageUrls : [ImageUrl]
var nutriens : [Nutriens]
    init (
    createdDate : String,
    id : Int,
    name : String,
    imageUrls : [ImageUrl],
    nutriens : [Nutriens])
        {
            self.createdDate = createdDate
            self.id = id
            self.name = name
            self.imageUrls = imageUrls
            self.nutriens = nutriens
        
        }
    
        override init() {
            self.id = 0
            self.name = ""
            self.createdDate = ""
            self.imageUrls = []
            self.nutriens = []

        }
    func encode( with coder: NSCoder) {
        coder.encode(createdDate, forKey: "createdDate")
        coder.encode(id!, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(imageUrls, forKey: "imageUrls")
        coder.encode(nutriens, forKey: "nutriens")
    }
    required public init?(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.createdDate = decoder.decodeObject(forKey: "createdDate") as? String ?? ""
        self.imageUrls = decoder.decodeObject(forKey: "imageUrls") as? [ImageUrl] ?? []
        self.nutriens = decoder.decodeObject(forKey: "nutriens") as? [Nutriens] ?? []
    }
}
