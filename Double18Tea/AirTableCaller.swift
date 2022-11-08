//
//  AirTableCaller.swift
//  Double18Tea
//
//  Created by sam su on 2022/11/7.
//

import UIKit
struct AirTable{
    static let shared = AirTable()
    static let baseURL = "https://api.airtable.com/v0/appvCOeXjzJJF0ooo/"
    static let apiKey = "key1DCv9iTMMreHPe"
    func getImage(url:URL, completion: @escaping (UIImage?) -> Void){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data,
               let image = UIImage(data: data){
                completion(image)
            }else{
                completion(nil)
            }
        }.resume()
    }
}





//https://api.airtable.com/v0/appvCOeXjzJJF0ooo/Menu
//"Authorization" : "Bearer key1DCv9iTMMreHPe"
