//
//  HistoryTableViewController.swift
//  Loginpage.swift
//
//  Created by MMKG on 15/12/23.
//

import UIKit

struct transaction{
    var name: String
    var date: String
    var image:UIImage?
    var Amount: String
    var description: String
}
struct trans{
    var name: String
    var date: String
    var image:UIImage?
    var Amount: String
    var description: String
    
}
let cell1 = transaction(name: "Topup Gopay", date:"08 Dec 2023  13.00" ,image: UIImage(systemName: "folder.badge.plus"), Amount: "-49.500",description: "Transfer your GoPay balance to another GoPay account or bank account, and make payment at GoPay merchants and online stores.")

let cell2 = transaction(name: "Pay Spotify", date:"08 Dec 2023  11.00",image: UIImage(systemName: "doc.text"), Amount: "-39.500",description: " Click on SEE HISTORY to view your payment history.You’ll be directed to a new page where you can view all your Spotify payments. The page displays each transaction’s date, amount, and status.")

let cell3 = transaction(name: "Pay Netflix", date:"08 Dec 2023  8.00",image: UIImage(systemName: "doc.text"), Amount: "-8.500",description: "Login into your account & Click on the Account option and go to Membership & Billing section & click Update Payment Info & change it to Paypal.")


let cellone = trans(name: "Transfer to Ira", date:"07 Dec 2023  12.00" ,image: UIImage(systemName: "square.and.arrow.up"), Amount: "-1.149.500",description: "A rollover IRA is an account that allows for the transfer of assets from an old employer-sponsored retirement account to a traditional IRA.")
let celltwo = trans(name: "Pay Netflix", date:"07 Dec 2023  11.00",image: UIImage(systemName: "square.and.arrow.down"), Amount: "-1.249.500",description: "Login into your account & Click on the Account option and go to Membership & Billing section & click Update Payment Info & change it to Paypal.")
let cellthree = trans(name: "Pay Netflix", date:"07 Dec 2023  8.00",image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), Amount: "349.500",description :"Login into your account & Click on the Account option and go to Membership & Billing section & click Update Payment Info & change it to Paypal.")



class HistoryTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var trans: [transaction] = [cell1,cell2,cell3]
    
    var tran: [trans] = [cellone,celltwo,cellthree]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return tableView == YesterdayTableview ? trans.count : tran.count
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.tableview {
            let transaction = trans[indexPath.row]
            print(indexPath.row)
            print(transaction)
            
            let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "View") as! ViewController
            ViewController.transactions = transaction
            navigationController?.pushViewController(ViewController, animated: true)
        }
        if tableView == self.YesterdayTableview{
            let transaction = tran[indexPath.row]
            print(indexPath.row)
            print(transaction)
            
            let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "View") as! ViewController
            ViewController.transfer = transaction
            navigationController?.pushViewController(ViewController, animated: true)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.tableview{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! tableviewcell
            let transaction = trans[indexPath.row]
            
            cell.cellUdate(trans: transaction)
            return cell
            }

            if tableView == self.YesterdayTableview {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell_1", for: indexPath) as! yesterdaycell
                let transaction = tran[indexPath.row]
                
                cell.cellUdate(tran: transaction)
                return cell
            }
            
            
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    @IBOutlet weak var todaylabel: UILabel!
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var YesterdayTableview: UITableView!
    
    @IBOutlet weak var yesterday: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        YesterdayTableview.delegate = self
        YesterdayTableview.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear (_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear (_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
   

}
class tableviewcell: UITableViewCell{
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var amount: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var inamge: imageview!
    
    func cellUdate(trans:transaction){
        self.name.text = trans.name
        self.date.text = trans.date
        self.amount.text = trans.Amount
        self.inamge.image = trans.image
        
    }
     //button.setImage(UIImage(systemName: "doc.text"), for: .normal)
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
       // button.setTitleColor(UIColor(cgColor: "back" as! CGColor), for: .normal)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

class yesterdaycell: UITableViewCell{
    
    @IBOutlet weak var namecell: UILabel!
    
    @IBOutlet weak var amountcell: UILabel!
    
    @IBOutlet weak var imagecell: imageview!
    
    
    @IBOutlet weak var datecell: UILabel!
    func cellUdate(tran:trans){
        self.namecell.text = tran.name
        self.datecell.text = tran.date
        self.amountcell.text = tran.Amount
        self.imagecell.image = tran.image
    }
    
    
    
}
