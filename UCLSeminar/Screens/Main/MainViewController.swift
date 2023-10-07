//
//  MainViewController.swift
//  UCLSeminar
//
//  Created by Berat Cevik on 07/10/2023.
//

import UIKit

class MainViewController: UIViewController {

    private let viewModel = MainViewModel(stocksService: StocksService())

    private let tableView: UITableView = {
        $0.backgroundColor = .systemBackground
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(StockCell.self, forCellReuseIdentifier: "stock-cell")
        return $0
    }(UITableView())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        tableView.dataSource = self
        tableView.delegate = self

        viewModel.bind()
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let stockCell = tableView.dequeueReusableCell(withIdentifier: "stock-cell") as? StockCell else {
            return UITableViewCell()
        }
        stockCell.viewState = .init(title: "JP Morgan")
        return stockCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
