//
//  tabbarViewController.swift
//  shoesApp
//
//  Created by Mina Namlı on 12.05.2022.
//

import UIKit

class tabbarViewController: UITabBarController {

    let tabBarCnt = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tabBarCnt.view)


    }
    
    func createTabBarController() {
                   
        let firstVc = ViewController()
        firstVc.tabBarItem = UITabBarItem.init(title : "home", image: UIImage(systemName: "house"), tag: 0)
               
        let secondVc = ShoppingTableViewController()
        secondVc.tabBarItem = UITabBarItem.init(title: "list", image: UIImage(named: "btn_list"), tag: 1)
        
        let thirdVc = favViewController()
        thirdVc.tabBarItem = UITabBarItem.init(title: "Fav", image: UIImage(named: "favbutton"), tag: 2)
                
        let controllerArray = [firstVc, secondVc, thirdVc]
        tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
           
           }


}
