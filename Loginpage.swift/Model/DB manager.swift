//
//  DB manager.swift
//  Loginpage.swift
//
//  Created by MMKG on 30/11/23.
//

import Foundation
import UIKit

class DBmanager{
    static let share = DBmanager()
    
    //Mark: get path for Database
    
    func getpPath(dbName: String)-> String{
        let documentryDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileurl = documentryDirectory.appendingPathComponent(dbName)
        print(fileurl.path)
        return fileurl.path
        
    }
    // create database
    func copydatabase(dbName : String){
        let dbpath = getpPath(dbName: "LoginPage.db")
        let fileManger = FileManager.default
        
        if !fileManger.fileExists(atPath: dbpath){
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(dbName)
            do{
                try fileManger.copyItem(atPath:file!.path, toPath: dbpath)
            }catch let err {
                print(err.localizedDescription)
            }
        }
        
    }
    
}
