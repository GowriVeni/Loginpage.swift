//
//  loginpageViewController.swift
//  Loginpage.swift
//
//  Created by MMKG on 21/11/23.
//

import UIKit
import SQLite3

let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
/*class Entity : NSManagedObject{
    @NSManaged var email: String?
    @NSManaged var password: String?
    //@NSManaged var issigned: Bool
}*/

class loginpageViewController: UIViewController {
//let db = Databasehandler()
var passwordVisible: Bool = true
var isDisplay: Bool = false
let defaults = UserDefaults.standard
var button: Bool = false
   /* var container: NSPersistentContainer {
        let appDelegates = UIApplication.shared.delegate as! AppDelegate
        return appDelegates.container
        
    }*/
    //var logged = loginn(id: "", email: "", password: "")
    @IBOutlet weak var loginpageLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showhide: UIButton!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var LoginpageButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var forgotpassword: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         configureView()
        reset()
         // Do any additional setup after loading the view.
       if UserDefaults.standard.bool(forKey: "login"){
           // let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "dashboard") as! DashboardViewController
           // navigationController?.pushViewController(ViewController, animated: true)
           let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "table") as! tableViewController
           navigationController?.pushViewController(ViewController, animated: true)
       }
        
        
    }
    
    override func viewWillAppear (_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear (_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func forgotpassword(_ sender: Any) {
    
        if let vc = self.storyboard?.instantiateViewController (withIdentifier:"forgot") as? ForgotViewController
        {
            if let sheet = vc.sheetPresentationController{
                
                sheet.detents = [.custom(resolver: { context in
                    0.3 * context.maximumDetentValue
                    }), .medium()]
                
            }
            self.navigationController?.present(vc, animated: true)
            //self.navigationController.p
        }
    }
    
    @IBAction func signupButtton(_ sender: UIButton) {
        
        if button {
           button = false
            LoginpageButton.setTitle("login", for: .normal)
            loginpageLabel.text = "Login"
            loginpageLabel.textAlignment = .center
            signupButton.setTitle("signup", for: .normal)
            accountLabel.text = "   Don't have an account?"
            accountLabel.textAlignment = .right
            
        }else{
            button = true
            LoginpageButton.setTitle("Signup", for: .normal)
            loginpageLabel.text = "Sign Up"
            loginpageLabel.textAlignment = .center
            signupButton.setTitle("login", for: .normal)
            accountLabel.text = "Already have an account?"
            accountLabel.textAlignment = .center
        }
    }
    
    @IBAction func LoginpageButton(_ sender: Any) {
        
        if button{
            button = false
            
            let insertStatementString = "INSERT INTO logindata(email,password) VALUES (?, ?);"
            var insertStatementQuery: OpaquePointer?
            
            if (sqlite3_prepare_v2(dbQueue, insertStatementString, -1, &insertStatementQuery, nil)) == SQLITE_OK{
                sqlite3_bind_text(insertStatementQuery, 1, emailTextField.text ?? "", -1, SQLITE_TRANSIENT)
                sqlite3_bind_text(insertStatementQuery, 2, passwordTextField.text ?? "", -1, SQLITE_TRANSIENT)
                
                if (sqlite3_step(insertStatementQuery)) == SQLITE_DONE{
                    
                    emailTextField.text = ""
                    passwordTextField.text = ""
                    LoginpageButton.isEnabled = false
                    emailTextField.becomeFirstResponder()
                    print("successfully insert the record")
                    showToast(message: "Signup Success")
                }else{
                    print("error")
                }
                sqlite3_finalize(insertStatementQuery)
            }
        }
        else{
            button = true
            //var insertStatementQuery: OpaquePointer?
            //let password = String(cString: queryResultCol1!)
            let ans = loginAuthentication(email: emailTextField.text!, password: passwordTextField.text!)
            if ans{
                
                let data = executeStatement(email: emailTextField.text!, password: passwordTextField.text!)
                print(data.email)
                emailTextField.text = ""
                passwordTextField.text = ""
               // LoginpageButton.isEnabled = false
                UserDefaults.standard.set(data.email, forKey: "email")
                UserDefaults.standard.string(forKey: "email")
                UserDefaults.standard.set(true, forKey: "login")
                showToast(message: "Login Success")
                //  print(data.password)
               
                // print("valid")
                let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "table") as! tableViewController
                navigationController?.pushViewController(ViewController, animated: true)
            }else{
                emailTextField.text = ""
                passwordTextField.text = ""
                LoginpageButton.isEnabled = false
                 showToast(message: "Invalid login address")
                print("invalid")
            }
            
        }
            
            /* let login = login(id: "", email: emailTextField.text!, password: passwordTextField.text!)
             let issave = ModelManger.getInstance().saveSignup(login:login)
             emailTextField.text = " "
             passwordTextField.text = " "
             print("isSave:\(issave)")
             showToast(message: "Signup SuccessFully")*/
            
            /*   if button{
             button = false
             let login = loginn(id: "", email: emailTextField.text!, password: passwordTextField.text!)
             let issave = ModelManger.getInstance().saveSignup(login:login)
             
             emailTextField.text = ""
             passwordTextField.text = ""
             LoginpageButton.isEnabled = false
             print("isSave:\(issave)")
             showToast(message: "Signup SuccessFully")
             }
             else {
             button = true
             let email: () = ModelManger.getInstance().getLogin(email: emailTextField.text!, password: passwordTextField.text!)
             if email != nil{
             showToast(message: "Login SuccessFully")
             let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "dash") as! DashboardViewController
             navigationController?.pushViewController(ViewController, animated: true)
             }else{
             showToast(message: "invalid")
             }*/
            
        
        
        
        /*  let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "dash") as! DashboardViewController
         navigationController?.pushViewController(ViewController, animated: true)  */
        
        
        
        
        //print ("isSave: \(issave)")
        /* let loginpage = NSEntityDescription.insertNewObject(forEntityName: "Entity", into: container.viewContext) as? Entity
         
         loginpage?.email = emailTextField.text
         loginpage?.password = passwordTextField.text
         //  loginpage?.issigned = (LoginpageButton.tag != 0)
         
         do{
         try container.viewContext.save()
         }catch{
         print(error)
         
         }
         NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)
         self.dismiss(animated: true)
         
         
         / let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "dash") as! DashboardViewController
         navigationController?.pushViewController(ViewController, animated: true)*/
        
        /* func login(){
         let mail = emailTextField.text
         let pass = passwordTextField.text
         let mailSavedata = defaults.string(forKey: "mail")
         let passSavedata = defaults.string(forKey: "pass")
         if (mailSavedata == mail) && (passSavedata == pass){
         button = false
         defaults.setValue(true, forKeyPath: "login")
         defaults.synchronize()
         let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "dash") as! DashboardViewController
         navigationController?.pushViewController(ViewController, animated: true)
         }
         else{
         button = true
         let alert = UIAlertController(title: "Alert", message: "Unmatch Login details", preferredStyle: .alert)
         let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { action in
         })
         alert.addAction(defaultAction)
         DispatchQueue.main.async(execute: {
         self.present(alert, animated: true)
         })
         
         }
         }
         func signup(){
         let mail = emailTextField.text
         let pass = passwordTextField.text
         defaults.setValue(mail, forKeyPath: "mail")
         defaults.setValue(pass, forKeyPath: "pass")
         defaults.synchronize()
         showToast(message: "signup success")
         
         
         }*/
    }
    
    @IBAction func showhideButton(_ sender: Any) {
        
        if  passwordVisible
        {
            passwordTextField.isSecureTextEntry = false
            passwordVisible = false
            
            isDisplay = false
            showhide.setImage(UIImage(systemName:
                                                "eye"), for: .normal)
        }
        
        else
        {
            passwordTextField.isSecureTextEntry = true
            passwordVisible = true
            isDisplay = true
            showhide.setImage (UIImage(systemName:
                                                "eye.slash"), for: .normal)
        }
    }
    
    @IBAction func emailChamge(_ sender: UITextField) {
        
        if let email = emailTextField.text
        {
            if let errormessage = inValidEmailAddr(email)
            {
                emailError.text = errormessage
                emailError.isHidden = false
            }
            else{
                emailError.isHidden = true
            }
        }
        checkValidationFormat()
    }
    
    func  inValidEmailAddr(_ value :String)->String?
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if !emailPred.evaluate(with: value)
        {
            return "Invaild Email "
        }
        return nil
    }
    
    @IBAction func passwordchange(_ sender: Any) {
    
        if let password = passwordTextField.text
        {
            if let errormessage = inValidPassword(password)
            {
                passwordError.text = errormessage
                passwordError.isHidden = false
                
            }
            else{
                passwordError.isHidden = true
            }
        }
        checkValidationFormat()
    }
    
    func inValidPassword(_ value: String)->String?
    {
        if value.count < 8
        {
            return "Password Must be at least 8 Character"
        }
        if digit(value)
        {
            return "Password Must Contain at least one Numeric"
        }
        if UpperCase(value)
        {
            return "Password Must Contain at least one UpperCase"
        }
        
        if LowerCase(value)
        {
            return "Password Must Contain at least one lowerCase"
        }
        
        return nil
    }
    
    func digit(_ value:String)->Bool{
        
        let passwordRegx = ".*[0-9]+.*"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return !passwordCheck.evaluate(with: value)
    }
    
    func UpperCase(_ value:String)->Bool{
        
        let passwordRegx = ".*[A-Z]+.*"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return !passwordCheck.evaluate(with: value)
    }
    
    func LowerCase(_ value:String)->Bool{
        
        let passwordRegx = ".*[a-z]+.*"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return !passwordCheck.evaluate(with: value)
    }
    
    func configureView(){
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearsOnBeginEditing = true
    }
    
    func checkValidationFormat(){
        
        if emailError.isHidden && passwordError.isHidden {
            LoginpageButton.isEnabled = true
           // signinButton.isEnabled = true
        }
        else{
            LoginpageButton.isEnabled = false
            //signinButton.isEnabled = false
        }
    }
    
    func reset(){
        //resetButton.isEnabled = false
        emailError.isHidden = false
        passwordError.isHidden = false
        LoginpageButton.isEnabled = false
        emailError.text = ""
        passwordError.text = ""
        //signinButton.isEnabled = false
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    }


    extension UIViewController{
        func showToast(message:String){
            let toastlabel = UILabel(frame: CGRect ( x: self.view.frame.width/3-75 , y: self.view.frame.height - 150, width: 280, height:45))
            toastlabel.textAlignment = .center
            toastlabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastlabel.textColor = UIColor.white
            toastlabel.alpha = 1.0
            toastlabel.layer.cornerRadius = 15
            toastlabel.clipsToBounds = true
            toastlabel.text = message
            self.view.addSubview(toastlabel)
            
            UIView.animate(withDuration: 3.0, delay: 1.0,options: .curveEaseInOut, animations: {
                toastlabel.alpha = 0.0
            }){ (isCompleted) in
                toastlabel.removeFromSuperview()
            }
        }
}
