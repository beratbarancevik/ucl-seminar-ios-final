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

    func bind() {
        stocksService.getStocks { stocks in
            
        }
    }

}

protocol MainViewModelProtocol {
    func bind()
}
