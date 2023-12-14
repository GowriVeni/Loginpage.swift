//
//  ModelManger.swift
//  Loginpage.swift
//
//  Created by MMKG on 30/11/23.
//

import Foundation
import SQLite3

var db: OpaquePointer?
func loginAuthentication (email:String , password:String)-> Bool{
    
let query = "SELECT * FROM logindata WHERE email = '"+email+"' and password = '"+password+"'"
  var queryStatement: OpaquePointer? = nil
  if sqlite3_prepare_v2(dbQueue, query, -1, &queryStatement, nil) == SQLITE_OK {
  if sqlite3_step(queryStatement) == SQLITE_ROW
   {
      sqlite3_finalize(queryStatement)
      return true
   }
   } else {
    let errmsg = String(cString: sqlite3_errmsg(dbQueue) )
    print ("'insert into:: could not be prepared::\(errmsg)")
    
}
    sqlite3_finalize(queryStatement)
return false
}

func executeStatement(email:String , password:String)->loginpage{
    
    var data = loginpage()
    let query = "SELECT * FROM logindata WHERE email = '"+email+"' and password = '"+password+"'"
    var queryStatement: OpaquePointer? = nil
    if sqlite3_prepare_v2(dbQueue, query, -1, &queryStatement, nil) == SQLITE_OK {
        if sqlite3_step(queryStatement) == SQLITE_ROW{
            let c1 = sqlite3_column_text(queryStatement, 0)
            if c1 != nil{
                data.email = String(cString: c1!)
                
            }
            
        }
    }
    let datas = UserDefaults.standard.string(forKey: "data.email")
    if datas == data.email{
        UserDefaults.standard.setValue(true, forKeyPath: "login")
        UserDefaults.standard.synchronize()
    }
        return data
    }
    
    /*func executeselect(email:String , password:String)->loginpage{
     
     var data = loginpage()
     let query = "select * from logindata where email = '"+email+" and password =
     '"+password+"'"
     var queryStatement: OpaquePointer? = nil
     if sqlite3_prepare_v2(db, query, -1, &queryStatement, nil) == SQLITE_OK {
     if sqlite3_step(queryStatement) == SQLITE_ROW
     {
     let c1 = sqlite3_column_text (queryStatement, 0)
     if c1 I= nilt
     data.name = String(String: c1!)
     }
     let c2 = sqlite3_column_text (queryStatement, 1)
     if c2 != nilt
     data.email = String(String: c21)
     }
     let c3 = sqlite3_column_text (queryStatement, 2)
     if c3 != nilf
     data.password = String(String: c31)
     }
     }
     
     }
     
     /*var shareInstance = ModelManger()
      
      class ModelManger{
      
      var database : FMDatabase? = nil
      
      static func getInstance() -> ModelManger {
      if shareInstance.database == nil{
      shareInstance.database = FMDatabase(path: DBmanager.share.getpPath(dbName: "LoginPage.db"))
      
      }
      return shareInstance
      }
      
      
      func saveSignup(login: loginn)->Bool{
      
      shareInstance.database?.open()
      let issave = shareInstance.database?.executeUpdate("INSERT INTO login(email,password) VALUES (?,?)", withArgumentsIn: [login.email, login.password])
      
      shareInstance.database?.close()
      return issave!
      
      }
      func getLogin(email:String,password:String){
      shareInstance.database?.open()
      
      let email = shareInstance.database?.executeStatements("SELECT email FROM login")
      
      let password = shareInstance.database?.executeStatements("SELECT password FROM login")
      
      
      /*var log = [loginn]()
       do{
       let resultset: FMResultSet? = try shareInstance.database?.executeQuery("SELECT email FROM login", values: nil)
       
       if resultset != nil{
       while resultset!.next(){
       let login = loginn(id: (resultset!.string(forColumn: "id")!), email: (resultset!.string(forColumn: "email")!), password: (resultset!.string(forColumn: "password")!))
       log.append(login)
       }
       }
       }
       catch let err{
       print(err.localizedDescription)
       }*/
      
      shareInstance.database?.close()
      
      
      
      }
      
      
      }*/
     
     */


