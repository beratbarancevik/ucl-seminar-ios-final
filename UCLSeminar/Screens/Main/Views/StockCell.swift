//
//  StockCell.swift
//  UCLSeminar
//
//  Created by Berat Cevik on 07/10/2023.
//

import UIKit

final class StockCell: UITableViewCell {

    struct ViewState {
        let title: String
    }

    private let titleLabel = UILabel()

    var viewState: ViewState? {
        didSet {
            titleLabel.text = viewState?.title
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
