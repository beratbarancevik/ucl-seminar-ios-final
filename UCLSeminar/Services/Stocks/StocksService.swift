//
//  StocksService.swift
//  UCLSeminar
//
//  Created by Berat Cevik on 07/10/2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

final class StocksService: StockServiceProtocol {

    private let db: Firestore

    init(db: Firestore = Firestore.firestore()) {
        self.db = db
    }

    func getStocks(completionHandler: @escaping ([Stock]) -> Void) {
        db.collection("stocks").getDocuments { snapshot, error in
            do {
                guard let stocks = try snapshot?.documents.map({ try $0.data(as: Stock.self) }) else {
                    return
                }
                completionHandler(stocks)
            } catch {
                print("Decoding error")
            }
        }
    }
    
    func getStockDetails(stockID: String, completionHandler: @escaping (Stock) -> Void) {
        db.collection("stocks").document(stockID).getDocument { snapshot, error in
            do {
                guard let stock = try snapshot?.data(as: Stock.self) else {
                    return
                }
                completionHandler(stock)
            } catch {
                print("Decoding error")
            }
        }
    }

}

protocol StockServiceProtocol {

    func getStocks(completionHandler: @escaping ([Stock]) -> Void)
    func getStockDetails(stockID: String, completionHandler: @escaping (Stock) -> Void)

}
