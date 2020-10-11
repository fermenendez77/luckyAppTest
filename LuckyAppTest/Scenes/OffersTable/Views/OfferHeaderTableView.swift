//
//  OfferHeaderTableView.swift
//  LuckyAppTest
//
//  Created by Fernando Menendez on 10/10/2020.
//

import Foundation
import UIKit

class OfferHeaderTableView : UITableViewHeaderFooterView {
    
    let titleLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        contentView.backgroundColor = .systemBackground
        titleLabel.textColor = .label
        titleLabel.font = titleLabel.font.withSize(24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24.0),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(title : String) {
        titleLabel.text = title
    }
}
