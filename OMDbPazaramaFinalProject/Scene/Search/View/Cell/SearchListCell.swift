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
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(moviePoster)
        addSubview(movieTitleLabel)
        addSubview(movieYearLabel)
        
        configureImageView()
        configureLabels()
        setImageConstraints()
        setLabelsConstraints()
    }
    
    private func configureImageView() {
        moviePoster.layer.cornerRadius = 10
        moviePoster.clipsToBounds = true
        moviePoster.contentMode = .scaleAspectFit
        
      
    }
    
    private func configureLabels() {
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
        movieTitleLabel.textAlignment = .center
        movieTitleLabel.font = .boldSystemFont(ofSize: 24)
        
        movieYearLabel.numberOfLines = 0
        movieYearLabel.adjustsFontSizeToFitWidth = true
        movieYearLabel.textAlignment = .center
        movieYearLabel.font = .boldSystemFont(ofSize: 24)
    }
    
    private func setImageConstraints() {
        moviePoster.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moviePoster.centerYAnchor.constraint(equalTo: centerYAnchor),
            moviePoster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            moviePoster.heightAnchor.constraint(equalToConstant: 200),
            moviePoster.widthAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
    private func setLabelsConstraints() {
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieYearLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieTitleLabel.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 10),
            movieTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            movieYearLabel.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 10),
            movieYearLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 20),
            movieYearLabel.heightAnchor.constraint(equalToConstant: 40),
            movieYearLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
}
