//
//  MoviesTabBarController.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 6.11.2023.
//

import UIKit

final class MoviesTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
    }

    private func configureTabs() {
        let vc1 = FavouriteViewController()
        let vc2 = SearchViewController()
        
        
        let networkService = NetworkServiceAdapter()
        let searchViewModel = SearchViewModel(networkService: networkService)
        let favoriteViewModel = FavoritesViewModel(networkService: networkService, delegate: vc1)
        vc1.viewModel = favoriteViewModel
        vc2.viewModel = searchViewModel
        
        //Set tab Images
        vc1.tabBarItem.image = UIImage(systemName: "folder")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        //Set titles
        vc1.title = "Favourite"
        vc2.title = "Search"
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
                
        setViewControllers([nav2,nav1], animated: true)
    }
}
