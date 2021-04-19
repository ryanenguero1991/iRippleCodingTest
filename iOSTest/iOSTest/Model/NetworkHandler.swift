//
//  NetworkHandler.swift
//  iOSTest
//
//  Created by Ryan Enguero on 4/19/21.
//

import UIKit
import Alamofire

class NetworkHandler: NSObject {
    
    
    func getApiToken(url: String, accountName: String, email: String, password: String, completionHandler: @escaping ([String: Any]) -> Void){
        
        let urlToken = url + "/api/tokens.json?account_name=\(accountName)&email=\(email)&password=\(password)"
        
        AF.request(urlToken, method: .get)
            .responseJSON { (response) in
                
                switch response.result {
                case .success(let value):
                    let value = value as! [String: Any]
                    completionHandler(value)
//                    print(value)
                    
                case .failure(let error):
                    print(error)
                }
    }
    }
    
    
    func getApiURL(url: String, accountName: String, completionHandler: @escaping (String) -> Void){
        
        AF.request(url + accountName, method: .get)
                .responseString { response in
                    switch response.result {
                    case .success(let value):
//                        print(value)
                    completionHandler(value)
                    case .failure(let error):
                        print(error)
                    }
            }
    }
        
    
    func getProduct(url: String, endpoint: String, username: String, password: String, completionHandler: @escaping ([Products]) -> Void){
        
        AF.request(url + endpoint, method: .get).authenticate(username: username, password: password)
            .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                    
                        
//                        print(value)
                        
                        let value = value as! [[String: Any]]
                        
                        
                        let jsonData = self.jsonToData(json: value)
                        
                        
                        let decoder = JSONDecoder()


                        do {
                            let response = try decoder.decode([Products].self, from: jsonData!)
                            print(response)
                            
                            completionHandler(response)
                        } catch let error  {
                            print("Parsing Failed \(error.localizedDescription)")
                            debugPrint(error)
                        }
                        
                      
                        
                        
                    case .failure(let error):
                        print(error)
                    }
            }
    }
    
    
    func downloadImageUsingAF(url: String, username: String, password: String, completionHandler: @escaping (UIImage) -> Void) {
        AF.request(url).authenticate(username: username, password: password).responseImage { response in

            if case .success(let image) = response.result {
                print("image downloaded: \(image)")
            }
            
            
            switch response.result {
            case .success(let image):
//                        print(value)
            completionHandler(image)
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    
    
    func jsonToData(json: Any) -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil;
    }

    

}
