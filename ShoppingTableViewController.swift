//
//  ShoppingTableViewController.swift
//  shoesApp
//
//  Created by Mina Namlı on 11.05.2022.
//

import UIKit
import SnapKit

class ShoppingTableViewController: UITableViewController {
    
    var shoesModelNames = ["Air Max", "Air Froce", "Blazer Mid", "Jordan Zion", "Jordan Max Aura"]
    var shoesBrand = ["Nike", "Nike","Nike","Nike","Nike"]
    var shoesPrice = [100,120,123,134,95]
    var shoesImages = [UIImage]()
    var chosenShoeModelName = ""
    var chosenShoeBrandName = ""
    var chosenShoePrice = Int()
    var chosenShoeImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.rowHeight = 200
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "shoeCell")

//        satirlarin boyutlarini belirliyor:
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
                
        tableView.contentInset.top = 20
        tableView.frame = CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight)
        let contentSize = self.tableView.contentSize
        let footer = UIView(frame: CGRect(x: self.tableView.frame.origin.x,
                                          y: self.tableView.frame.origin.y + contentSize.height,
                                          width: self.tableView.frame.size.width,
                                          height: self.tableView.frame.height - self.tableView.contentSize.height))
                
        self.tableView.tableFooterView = footer
        
        shoesImages.append(UIImage(named: "nike1")!)
        shoesImages.append(UIImage(named: "nike2")!)
        shoesImages.append(UIImage(named: "nike3")!)
        shoesImages.append(UIImage(named: "nike4")!)
        shoesImages.append(UIImage(named: "nike5")!)

        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoesModelNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoeCell", for: indexPath)
        cell.imageView?.image = shoesImages[indexPath.row]
        cell.textLabel?.text = shoesBrand[indexPath.row]
        cell.textLabel?.text = shoesModelNames[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenShoeModelName = shoesModelNames[indexPath.row]
        chosenShoeBrandName = shoesBrand[indexPath.row]
        chosenShoeImage = shoesImages[indexPath.row]
        chosenShoePrice = shoesPrice[indexPath.row]
        
        let nextVC = shoeModelViewController()
        nextVC.selectedShoeModelName = chosenShoeModelName
        nextVC.selectedShoeBrandName = chosenShoeBrandName
        nextVC.selectedShoePrice = chosenShoePrice
        nextVC.selectedShoeImage = chosenShoeImage
        navigationController?.pushViewController(nextVC, animated: true)
        
        }
    
}
