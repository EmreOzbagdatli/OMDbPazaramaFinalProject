//
//  MoviesTabBarController.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 6.11.2023.
//

import UIKit

class MoviesTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureTabs()
    }

    private func configureTabs() {

        let vc1 = FavouriteViewController()
        let vc2 = SearchViewController()
        let vc3 = ProfileViewController()
        
        //Set tab Images
        vc1.tabBarItem.image = UIImage(systemName: "folder")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.image = UIImage(systemName: "person")
        
        //Set titles
        vc1.title = "Favourite"
        vc2.title = "Search"
        vc3.title = "Profile"
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
                
        setViewControllers([nav2,nav1,nav3], animated: true)
        
    }
}
