//
//  AppDelegate.swift
//  CapstoneProject
//
//  Created by Muharrem KAYA on 2022-04-13.
//

import UIKit
import FirebaseCore
import FirebaseMessaging
import FBSDKCoreKit

import SQLite3

//AppDelegate class is used through out the project different pages, to store and retrieve the data
// for Customers, allergens, menus

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //Login Customer info
    var customer = Customer() // Customer object
    var allergens : [Ingredients] = [] //Allergen array
    var subscribedMenus : [Menus] = [] // Menu array
    var selectedMenu : Menus = Menus() // Selected menu list
    
    
    var databaseName : String? = "MyDatabase.db"
    var databasePath : String?
    var reviews : [Review] = []



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        

        //configuring the FirebaseApp
        FirebaseApp.configure();
        
        ApplicationDelegate.shared.application(
          application,
          didFinishLaunchingWithOptions: launchOptions
        )
        
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
       
            let documentsDir = documentPaths[0]
        
        databasePath = documentsDir.appending("/" + databaseName!)
      
        checkAndCreateDatabase()
      
        readDataFromDatabase()
        
        
        
        return true
    }
    
    func checkAndCreateDatabase()
    {

        var success = false
        let fileManager = FileManager.default
        
        success = fileManager.fileExists(atPath: databasePath!)
    
        if success
        {
            return
        }
    
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName!)
        
    
        try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath!)
    
    
    return;
    }
    
    func readDataFromDatabase()
    {
        reviews.removeAll()
        var db: OpaquePointer? = nil
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK {
           
            
            var queryStatement: OpaquePointer? = nil
            var queryStatementString : String = "select * from entries"
        
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
                
             
                while( sqlite3_step(queryStatement) == SQLITE_ROW ) {
                
                   
                    
                    let id: Int = Int(sqlite3_column_int(queryStatement, 0))
                    let cheading = sqlite3_column_text(queryStatement, 1)
                    let cmessage = sqlite3_column_text(queryStatement, 2)
                    let crating = Int(sqlite3_column_int(queryStatement, 3))
                    
                    let heading = String(cString: cheading!)
                    let message = String(cString: cmessage!)
                    let rating  = Int(truncating: crating as NSNumber)
           
                    
                    let data : Review = Review.init()
                    data.initWithData(theRow: id, theHeading: heading, theMessage: message, theRating : rating)
                    reviews.append(data)
                    
                    print("Query Result:")
                    print("\(id) | \(heading) | \(message) | \(rating)")
                    
                }
                
                
                sqlite3_finalize(queryStatement)
            } else {
                print("SELECT statement could not be prepared")
            }
            
            
            
            sqlite3_close(db);

        } else {
            print("Unable to open database.")
        }
    
    }
    
    
    func insertIntoDatabase(review : Review) -> Bool
    {
        
        var db: OpaquePointer? = nil
        var returnCode : Bool = true
        
        
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(self.databasePath)")
            
        
            var insertStatement: OpaquePointer? = nil
            var insertStatementString : String = "insert into entries values(NULL, ?, ?, ?)"
            
         
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
               
           
         
                let headingStr = review.heading! as NSString
                let messageStr = review.message! as NSString
                let ratingStr = review.rating! as NSNumber
                
                sqlite3_bind_text(insertStatement, 1, headingStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, messageStr.utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 3, Int32(truncating: ratingStr))
                
           
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    let rowID = sqlite3_last_insert_rowid(db)
                    print("Successfully inserted row. \(rowID)")
                } else {
                    print("Could not insert row.")
                    returnCode = false
                }
                sqlite3_finalize(insertStatement)
            } else {
                print("INSERT statement could not be prepared.")
                returnCode = false
            }
            
        
            sqlite3_close(db);
            
        } else {
            print("Unable to open database.")
            returnCode = false
        }
        return returnCode
    }
    
 
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

