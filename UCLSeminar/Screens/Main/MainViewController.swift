//
//  MainViewController.swift
//  UCLSeminar
//
//  Created by Berat Cevik on 07/10/2023.
//

import UIKit

class MainViewController: UIViewController {

    private let viewModel = MainViewModel(stocksService: StocksService())

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.bind()
    }

}
