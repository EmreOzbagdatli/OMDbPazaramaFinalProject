//
//  SearchViewController.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 6.11.2023.
//

import UIKit

class SearchViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating {
    var searchText: String = ""

    let searchController = UISearchController()

    lazy var viewModel: SearchViewModel = {
        let vm = SearchViewModel()
        return vm
    }()

    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    private let emptyWarningLabel: UILabel = {
        let view = UILabel()
        view.text = "Search Movies"
        view.backgroundColor = .black
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchListCell.self, forCellReuseIdentifier: "MoviesCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        tableView.rowHeight = 200
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }

    private func setupUI() {
        view.backgroundColor = .systemOrange
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        self.navigationController?.navigationBar.prefersLargeTitles = true

        setupTableView()
        setupEmptyWarningLabel()
    }
    
    private func setupEmptyWarningLabel() {
        view.addSubview(emptyWarningLabel)
        
        NSLayoutConstraint.activate([
            emptyWarningLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyWarningLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc(updateSearchResultsForSearchController:) func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        searchText = text
        viewModel.resetPageIndex()
        
        viewModel.fetchMovies(by: text) { [weak self] in
            DispatchQueue.main.async {
                self?.emptyWarningLabel.isHidden = !(self?.viewModel.movies.isEmpty ?? false)
                self?.tableView.reloadData()
            }
        }
    }
}
