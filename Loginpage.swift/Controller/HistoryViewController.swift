//
//  HistoryViewController.swift
//  Loginpage.swift
//
//  Created by MMKG on 08/12/23.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear (_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear (_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

   
    @IBAction func backButton(_ sender: Any) {
        let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "dashboard") as! DashboardViewController
        navigationController?.pushViewController(ViewController, animated: true)
        
    }
    
    
    @IBAction func logoutButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "login")
          
        
        let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "table") as! tableViewController
        navigationController?.pushViewController(ViewController, animated: true)
         
        
    }
    
    
}
