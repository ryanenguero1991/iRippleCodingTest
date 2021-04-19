//
//  Products.swift
//  iOSTest
//
//  Created by Ryan Enguero on 4/19/21.
//

import Foundation

struct Products : Codable {

    
    var description : String?
    var id : Int?
    var name : String?
    var retail_price : Double?
    var stock_no : String?
    var tag_list : [String]
    var thumbnail_url : String?
    
        
    enum CodingKeys: String, CodingKey {

        case description = "description"
        case id
        case name = "name"
        case retail_price
        case stock_no = "stock_no"
        case tag_list
        case thumbnail_url = "thumbnail_url"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        retail_price = try container.decodeIfPresent(Double.self, forKey: .retail_price)
        stock_no = try container.decodeIfPresent(String.self, forKey: .stock_no)
        tag_list = try container.decode([String].self, forKey: .tag_list)
        thumbnail_url = try container.decodeIfPresent(String.self, forKey: .thumbnail_url)
             
        }
    
}
