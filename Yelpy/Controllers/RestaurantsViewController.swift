//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here
    
    @IBOutlet weak var label: UILabel!
    
    // –––––– TODO: Initialize restaurantsArray
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var restaurantImg: UIImageView!
    
    var restaurantsArray: [[String:Any?]] = []
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getAPIData()

    }
    
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getAPIData() {
        API.getRestaurants { (restaurants) in guard let restaurants = restaurants
            else{
                return
            }
            print(restaurants)
            self.restaurantsArray = restaurants
            self.tableView.reloadData()
        }
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
        let restaurant = restaurantsArray[indexPath.row]
        cell.label.text = restaurant["name"] as? String ?? ""
        
        if let imgUrlString = restaurant["image_url"] as! String {
            let imageUrl = URL(string: imgUrlString)
            cell.restaurantImg.af_setImage(withURL: imageUrl!)
//            af.setImage(withUrl: imageUrl!)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
}

// ––––– TODO: Create tableView Extension and TableView Functionality


