//
//  Menu.swift
//  Double18Tea
//
//  Created by Ya Yu Yeh on 2022/11/6.
//

import Foundation
struct MenuResponse:Decodable{
    let records:[Records]
}

struct Records:Decodable{
    let fields:Fields
}

struct Fields:Decodable{
    let item:String
    let sort:Int
    let priceMedium:Int?
    let priceLarge:Int
    let sugarLevel:String
    let iceLevel:String
    let mark:String?
    let description:String?
    let category:String
    let drinkImage:[DrinkImage]?
    
    struct DrinkImage:Decodable{
        let url:URL
    }
}




//https://api.airtable.com/v0/appvCOeXjzJJF0ooo/Menu
//"Authorization" : "Bearer key1DCv9iTMMreHPe"
