//
//  SearchTableViewCell.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        $0.numberOfLines = .zero
        $0.lineBreakMode = .byWordWrapping
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var idLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(idLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            idLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            idLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            idLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        idLabel.setContentHuggingPriority(.required, for: .horizontal)
        idLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    func configure(value: Security) {
        nameLabel.text = value.name
        idLabel.text = value.id
    }
    
}
