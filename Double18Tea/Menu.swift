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
    let fields:Drink
}

struct Drink:Decodable{
    let item:String
    let sort:Int
    let priceMedium:Int?
    let priceLarge:Int
    let sugarLevel:String
    let iceLevel:String
    let mark:String?
    let description:String?
    let series:String
    let drinkImage:[DrinkImage]?
    
    struct DrinkImage:Decodable{
        let url:URL
    }
}

let toppings = ["小珍珠", "波霸", "雙珠", "布丁", "蜜烏凍"]
var sugarOptions = [String]()
var iceOptions = [String]()


enum sugarLevel{
    case allSet, fixed, regular_notTooMuch, regular_notTooMuch_noSugar, goldenRatio_noSugar
    
    
    func sugarDescription(){
        switch self{
        case .allSet:
            sugarOptions = ["正常糖", "少糖", "半糖", "微糖", "2分糖", "1分糖", "無糖"]
        case .fixed:
            sugarOptions = ["甜度固定"]
        case .regular_notTooMuch:
            sugarOptions = ["正常甜", "不要太甜"]
        case .regular_notTooMuch_noSugar:
            sugarOptions = ["正常甜", "不要太甜", "無糖"]
        case .goldenRatio_noSugar:
            sugarOptions = ["黃金比例", "無糖"]
        }
    }
}


enum iceLevel{
    case allSet, normalSet, normalSetWithoutHot, iceOnly, fixed
    
    func iceDescription(){
        switch self{
        case .allSet:
            iceOptions = ["正常冰", "少冰", "微冰", "去冰", "完全去冰", "多冰", "溫", "熱"]
        case .normalSet:
            iceOptions = ["正常冰", "少冰", "微冰", "去冰", "溫", "熱"]
        case .normalSetWithoutHot:
            iceOptions = ["正常冰", "少冰", "微冰", "去冰", "溫",]
        case .iceOnly:
            iceOptions = ["正常冰", "少冰", "微冰", "去冰"]
        case .fixed:
            iceOptions =  ["冰塊固定"]
        }
    }
    
}




/*
 <sugarLevel>
 allSet
 ["正常糖", "少糖", "半糖", "微糖", "2分糖", "1分糖", "無糖"]
 fixed
 ["甜度固定"]
 regular_notTooMuch
 ["正常甜", "不要太甜"]
 regular_notTooMuch_noSugar
 ["正常甜", "不要太甜", "無糖"]
 goldenRatio_noSugar
 ["黃金比例", "無糖"]


 <iceLevel>
 allSet
 ["正常冰", "少冰", "微冰", "去冰", "完全去冰", "多冰", "溫", "熱"]
 normalSet
 ["正常冰", "少冰", "微冰", "去冰", "溫", "熱"]
 normalSetWithoutHot
 ["正常冰", "少冰", "微冰", "去冰", "溫",]
 iceOnly
 ["正常冰", "少冰", "微冰", "去冰"]
 fixed
 ["冰塊固定"]


 IsTopping
 (true)
 ["小珍珠", "波霸", "雙珠", "布丁", "蜜烏凍"]
 */



//https://api.airtable.com/v0/appvCOeXjzJJF0ooo/Menu
//"Authorization" : "Bearer key1DCv9iTMMreHPe"
