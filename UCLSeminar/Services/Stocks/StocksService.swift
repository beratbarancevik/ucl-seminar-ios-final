//
//  StocksService.swift
//  UCLSeminar
//
//  Created by Berat Cevik on 07/10/2023.
//

import FirebaseFirestore

final class StocksService: StockServiceProtocol {

    private let db: Firestore

    init(db: Firestore = Firestore.firestore()) {
        self.db = db
    }

    func getStocks() {
        db.collection("stocks").getDocuments { snapshot, error in

        }
    }
    
    func getStockDetails(stockID: String) {
        db.collection("stocks").document(stockID).getDocument { snapshot, error in

        }
    }

}

protocol StockServiceProtocol {

    func getStocks()
    func getStockDetails(stockID: String)

}
