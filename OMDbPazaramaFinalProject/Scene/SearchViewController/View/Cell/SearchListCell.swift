//
//  SearchListCell.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 7.11.2023.
//

import UIKit

final class SearchListCell: UITableViewCell {
    
    var moviePoster = UIImageView()
    var movieTitleLabel = UILabel()
    var movieYearLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(moviePoster)
        addSubview(movieTitleLabel)
        addSubview(movieYearLabel)
        
        configureImageView()
        configureLabels()
        setImageConstraints()
        setLabelsConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView(){
        moviePoster.layer.cornerRadius = 10
        moviePoster.clipsToBounds = true
        moviePoster.contentMode = .scaleAspectFit

        
    }
    func configureLabels(){
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
        
        movieYearLabel.numberOfLines = 0
        movieYearLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    func setImageConstraints(){
        moviePoster.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moviePoster.centerYAnchor.constraint(equalTo: centerYAnchor),
            moviePoster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            moviePoster.heightAnchor.constraint(equalToConstant: 200),
            moviePoster.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setLabelsConstraints(){
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieYearLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieTitleLabel.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 20),
            movieTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            movieYearLabel.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 20),
            movieYearLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 20),
            movieYearLabel.heightAnchor.constraint(equalToConstant: 40),
            movieYearLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),

                        
        ])
    }
}
