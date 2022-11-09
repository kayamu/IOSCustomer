//
//  Review.swift
//  iOSProjWithDashBoard
//
//  Created by  on 2022-04-16.
//

import UIKit

class Review: NSObject {
    var id : Int?
    var heading : String?
    var message : String?
    var rating : Int?
   
    
    
    func initWithData(theRow i : Int, theHeading h : String, theMessage m : String, theRating r : Int) {
        id = i
        heading = h
        message = m
        rating = r
    }
}
