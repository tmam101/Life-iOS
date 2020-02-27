//
//  Finances.swift
//  LifeiOS
//
//  Created by Thomas Goss on 2/26/20.
//  Copyright © 2020 Thomas Goss. All rights reserved.
//

import Foundation

class Finances {
    let network = Network()
    
    func getAccessToken(publicToken: String) {
        network.post(path: "get_access_token", parameters: ["public_token" : publicToken])
    }
    
    func getTransactions(_ callback: @escaping (_ response: [Transaction]) -> ()) {
        network.get(path: "transactions", { response in
            guard let data = response["transactions"] as! [String: Any]?, let data2 = data["transactions"] as! [[String: Any]]? else {
                return
            }
            var transactions: [Transaction] = []
            for d in data2 {
                transactions.append(Transaction(json: d))
            }
            callback(transactions)
        })
    }
    
    func getTotalExpenses(_ callback: @escaping (_ response: Double) -> ()) {
        getTransactions({ response in
            var amount: Double = 0
            for transaction in response {
                let num = transaction.getAmount()
                amount += num
            }
            callback(amount)
        })
    }
    
    
    
}
