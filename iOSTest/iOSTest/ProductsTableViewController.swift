//
//  ProductsTableViewController.swift
//  iOSTest
//
//  Created by Ryan Enguero on 4/19/21.
//

import UIKit
import Alamofire
import AlamofireImage

class ProductsTableViewController: UITableViewController {

    var product = [Products]()
    let credentials = UserDefaults.standard.dictionary(forKey: "credentials")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        NetworkHandler().getProduct(url: UserDefaults.standard.string(forKey: "apiURL")!, endpoint: productPageEndpoint, username: credentials!["api_token"] as! String, password: "X") { (products) in
//            print(products)
            
            self.product = products
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
           
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return product.count 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell

        let productDetails = product[indexPath.row]
        
        if productDetails.thumbnail_url != ""{
//            cell.imgThumbnail.downloaded(from: UserDefaults.standard.string(forKey: "apiURL")! + productDetails.thumbnail_url!)
            NetworkHandler().downloadImageUsingAF(url: UserDefaults.standard.string(forKey: "apiURL")! + productDetails.thumbnail_url!, username: credentials!["api_token"] as! String, password: "X", completionHandler:  { (image) in
                DispatchQueue.main.async {
                    cell.imgThumbnail.image = image
                }
                
            })
        }else{
            cell.imgThumbnail.image = UIImage(named: "image-not-found.png") 
        }
        
        cell.lblName.text = "Name: " + productDetails.name!
        var tagList = "\(productDetails.tag_list)" as String
        tagList = tagList.replacingOccurrences(of: "[", with: "")
        tagList = tagList.replacingOccurrences(of: "\("\"")", with: "")
        tagList = tagList.replacingOccurrences(of: "]", with: "")
        cell.lblTags.text = "Tags: \(tagList)"
        cell.lblPrice.text = "\("Price: ₱")\(productDetails.retail_price ?? 0 )"
        cell.lblStockNumber.text = "Stock no.: " + productDetails.stock_no!
        cell.lblDescription.text = "Description: \(productDetails.description ?? "r")"
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
 
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
