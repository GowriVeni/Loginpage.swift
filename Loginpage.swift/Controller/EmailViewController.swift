//
//  EmailViewController.swift
//  Loginpage.swift
//
//  Created by MMKG on 24/11/23.
//

import UIKit

class EmailViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    func signup(){
          let mail = emailTextField.text
        //let pass = passwordTextField.text
        defaults.setValue(mail, forKeyPath: "mail")
      //  defaults.setValue(pass, forKeyPath: "pass")
         defaults.synchronize()
         showToast(message: "signup success")
      

     }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
