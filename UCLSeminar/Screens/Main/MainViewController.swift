//
//  MainViewController.swift
//  UCLSeminar
//
//  Created by Berat Cevik on 07/10/2023.
//

import UIKit

class MainViewController: UIViewController {

    private let viewModel = MainViewModel(stocksService: StocksService())

    private var stockRows: [StockCell.ViewState] = []

    private let tableView: UITableView = {
        $0.backgroundColor = .systemBackground
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(StockCell.self, forCellReuseIdentifier: StockCell.reuseIdentifier)
        return $0
    }(UITableView())

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Stocks"

        view.backgroundColor = .systemBackground

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        tableView.dataSource = self
        tableView.delegate = self

        viewModel.bind(viewStateHandler: { viewState in
            self.stockRows = viewState.rows
            self.tableView.reloadData()
        })
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stockRows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let stockCell = tableView.dequeueReusableCell(
            withIdentifier: StockCell.reuseIdentifier
        ) as? StockCell else {
            return UITableViewCell()
        }
        stockCell.viewState = stockRows[indexPath.row]
        return stockCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
