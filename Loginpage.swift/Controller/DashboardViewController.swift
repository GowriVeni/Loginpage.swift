//
//  DashboardViewController.swift
//  Loginpage.swift
//
//  Created by MMKG on 11/12/23.
//

import UIKit

class DashboardViewController: UIViewController {

    
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear (_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear (_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func backButton(_ sender: Any) {
        let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "history") as! HistoryViewController
        navigationController?.pushViewController(ViewController, animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
