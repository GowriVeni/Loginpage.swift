//
//  ViewController.swift
//  Loginpage.swift
//
//  Created by MMKG on 15/12/23.
//

import UIKit

class ViewController: UIViewController {

    var transactions: transaction?
    var transfer: trans?
    @IBOutlet weak var namelabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var backarrow: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (transactions != nil){
            
        namelabel.text = transactions?.name
        imageView.image = transactions?.image
        textView.text = transactions?.description
    }
        if transfer != nil{
            namelabel.text = transfer?.name
            imageView.image = transfer?.image
            textView.text = transfer?.description
        }
       // namelabel.text = transfer?.name
       // imageView.image = transfer?.image
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear (_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear (_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
   
    @IBAction func backarrow(_ sender: Any) {
        let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "table") as! HistoryTableViewController
        //ViewController.transactions = transaction
        navigationController?.pushViewController(ViewController, animated: true)
        
    }
    
}
