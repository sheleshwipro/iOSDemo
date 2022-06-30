//
//  FactListModel.swift
//  iOSDemo
//
//  Created by Apple on 29/06/22.
//

import Foundation
struct FactListModel:Codable{
    let title:String
    let rows:[FactModel]
}
