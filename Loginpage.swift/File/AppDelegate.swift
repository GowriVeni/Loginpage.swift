 //
//  AppDelegate.swift
//  Loginpage.swift
//
//  Created by MMKG on 21/11/23.
//

import UIKit
import SQLite3

var dbURL = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String

var dbQueue: OpaquePointer!
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //DBmanager.share.copydatabase(dbName: "LoginPage.db")
        // print("Database", URL.documentsDirectory)
        dbQueue = createndOpenDatabase()
       // dbQueue = createndOpenDatabase () //create and open database + set the pointer
        if(createTables ( ) == false){
        print("Error in Creating Tables")
        }
        else
        {print ("YAYI tables")}
        return true
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
    
    /* lazy var container: NSPersistentContainer = {
     let container = NSPersistentContainer (name: "data")
     container.loadPersistentStores{(done, error) in
     print(error as Any)
     }
     return container
     }()*/
    func createndOpenDatabase() -> OpaquePointer? // Swift type for C Pointers
    {
        var db: OpaquePointer?
        let url = NSURL (fileURLWithPath: dbURL)// Sets up the URL to the database
        // Name your database here
        if let pathComponent = url.appendingPathComponent("login.sqlite")
        {
            let filePath = pathComponent.path
            
            if sqlite3_open(filePath, &db) == SQLITE_OK{
                
                print ("Successfuly opened the database :) at \(filePath) ")
                return db
                
            } else
            {
                print("could not open a db")
                
            }
        } else{
            print("hjhkjhkj")
        }
        return db
        
    }
    func createTables () -> Bool{
        
    var bRetVal: Bool = false
        
    let createTable = sqlite3_exec(dbQueue, "CREATE TABLE logindata(email TEXT NULL, password TEXT NULL)", nil,nil,nil)
                                   
        if (createTable != SQLITE_OK) {
            print ("Not able to create table")
            bRetVal = false
        }
    else
    {
      bRetVal = true
    }
    return bRetVal
        
    }
    }
    
