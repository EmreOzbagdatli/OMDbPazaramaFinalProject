//
//  ViewController.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 6.11.2023.
//

import UIKit


class FavouriteViewController: UIViewController {

//    lazy var button: UIButton = {
//        let button = UIButton()
//        button.setTitle("Tap", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        return button
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupUI()
        
        
    }
    private func setupUI() {
        view.backgroundColor = .systemOrange
//        view.addSubview(button)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        navigationController?.navigationBar.prefersLargeTitles = true
//        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            button.heightAnchor.constraint(equalToConstant: 80),
//            button.widthAnchor.constraint(equalToConstant: 300),
//            ])
    }
//
//    @objc func didTapButton() {
//        self.navigationController?.pushViewController(DetailViewController(), animated: true)
//    }


}

