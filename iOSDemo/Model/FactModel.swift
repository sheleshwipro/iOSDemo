//
//  FactModel.swift
//  iOSDemo
//
//  Created by Apple on 29/06/22.
//

import Foundation
struct FactModel:Codable{
    let title:String?
    let rowDescription:String?
    let imageHref:String?
    
    enum CodingKeys: String, CodingKey {
           case title
           case rowDescription = "description"
           case imageHref
       }
}
