//
//  MainViewModel.swift
//  UCLSeminar
//
//  Created by Berat Cevik on 07/10/2023.
//

final class MainViewModel: MainViewModelProtocol {

    private let stocksService: StockServiceProtocol

    init(stocksService: StockServiceProtocol) {
        self.stocksService = stocksService
    }

    func bind(viewStateHandler: @escaping (MainViewState) -> Void) {
        stocksService.getStocks { stocks in
            viewStateHandler(.init(rows: stocks.map { StockCell.ViewState(title: $0.title) }))
        }
    }

    func uploadStocks() {
        stocksService.uploadStocks()
    }

}

protocol MainViewModelProtocol {

    func bind(viewStateHandler: @escaping (MainViewState) -> Void)
    func uploadStocks()

}
