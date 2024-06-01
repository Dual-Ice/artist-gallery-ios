//
//  WorkTableViewCell.swift
//  artist-gallery-ios
//
//  Created by  Maksim Stogniy on 01.06.2024.
//

// WorkTableViewCell.swift
import UIKit

class WorkTableViewCell: UITableViewCell {
    let workImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        workImageView.contentMode = .scaleAspectFit
        contentView.addSubview(workImageView)
        workImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            workImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            workImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            workImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            workImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
