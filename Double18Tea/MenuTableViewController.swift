//
//  MenuTableViewController.swift
//  Double18Tea
//
//  Created by Ya Yu Yeh on 2022/11/7.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var menuDrinks = [Drink]()


    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMenu(tableTitle: "Menu")

    }
    
    func fetchMenu(tableTitle:String){
        if let url = URL(string: "https://api.airtable.com/v0/appvCOeXjzJJF0ooo/Menu"){
            var request = URLRequest(url: url)
            request.setValue("Bearer key1DCv9iTMMreHPe", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data{
                    let decoder = JSONDecoder()
                    do{
                        let menuResponse = try decoder.decode(MenuResponse.self, from: data)
//                        self.menuDrinks = menuResponse.records
                        DispatchQueue.main.async {
//                            tableView.reloadData()
                        }
                    }catch{
                        print("fetchMenuError:\(error)")
                    }
                }
            }.resume()
        
            
        }
        
    }
    
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuTableViewCell.self)", for: indexPath) as! MenuTableViewCell

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
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
