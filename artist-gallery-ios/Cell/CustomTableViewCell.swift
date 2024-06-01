//
//  CustomTableViewCell.swift
//  artist-gallery-ios
//
//  Created by  Maksim Stogniy on 01.06.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let artistImageView = UIImageView()
    let nameLabel = UILabel()
    let bioLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        artistImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        nameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        bioLabel.setContentHuggingPriority(.required, for: .vertical)
        nameLabel.setContentHuggingPriority(.required, for: .vertical)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        bioLabel.font = UIFont.systemFont(ofSize: 14)
        bioLabel.numberOfLines = 0
        
        contentView.addSubview(artistImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(bioLabel)
        
        NSLayoutConstraint.activate([
            artistImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            artistImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            artistImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            artistImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            
            nameLabel.leadingAnchor.constraint(equalTo: artistImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            bioLabel.leadingAnchor.constraint(equalTo: artistImageView.trailingAnchor, constant: 16),
            bioLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            bioLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with artist: Artist) {
        nameLabel.text = artist.name
        bioLabel.text = artist.bio
        
        artistImageView.contentMode = .scaleAspectFit
        artistImageView.image = UIImage(named: artist.image)
    }
}

