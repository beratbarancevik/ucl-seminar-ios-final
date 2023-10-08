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

    static let reuseIdentifier = "stock-cell"

    private let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    private let starImageView: UIImageView = {
        $0.image = .init(systemName: "star")
        $0.tintColor = .label
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    var viewState: ViewState? {
        didSet {
            titleLabel.text = viewState?.title
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(titleLabel)
        addSubview(starImageView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: starImageView.leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            starImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            starImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            starImageView.heightAnchor.constraint(equalToConstant: 24),
            starImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
