//
//  ViewController.swift
//  iOSTest
//
//  Created by Ryan Enguero on 4/15/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var txtAccountName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        if txtAccountName.text != nil && txtEmail.text != nil && txtPassword.text != nil {
        
            NetworkHandler().getApiURL(url: accountApiURL, accountName: txtAccountName.text ?? "", completionHandler: { (apiUrl) in
                
                UserDefaults.standard.set(apiUrl, forKey: "apiURL")
                
                print(apiUrl)
                
                
                NetworkHandler().getApiToken(url: apiUrl, accountName: self.txtAccountName.text ?? "", email: self.txtEmail.text ?? "", password: self.txtPassword.text ?? "", completionHandler: { (credentials) in
                    
                    UserDefaults.standard.set(credentials as NSDictionary, forKey: "credentials")                    
                    print(credentials)
                    
                    DispatchQueue.main.async {
                        
                        let productsTableView = self.storyboard?.instantiateViewController(identifier: "ProductsTableViewController") as! ProductsTableViewController
                        productsTableView.modalPresentationStyle = .fullScreen
                        
                        self.present(productsTableView, animated: true, completion: nil)
                        
                    }
                  
                })
                
            })
            
        }
        
    }
    
    
    


}

