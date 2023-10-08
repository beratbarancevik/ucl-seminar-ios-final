//
//  Stock.swift
//  UCLSeminar
//
//  Created by Berat Cevik on 07/10/2023.
//

import FirebaseFirestoreSwift

struct Stock: Codable {

    @DocumentID var id: String?
    let title: String
    let logoUrl: String

}
