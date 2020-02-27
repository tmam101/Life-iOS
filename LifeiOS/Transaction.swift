//
//  Transaction.swift
//  LifeiOS
//
//  Created by Thomas Goss on 2/26/20.
//  Copyright © 2020 Thomas Goss. All rights reserved.
//

import Foundation

class Transaction {
    var json: [String: Any]
    
    init(json: [String: Any]) {
        self.json = json
    }
    
    func getAmount() -> Double {
        guard let amount = json["amount"] as! Double? else {
            return 0
        }
        return amount
    }
    
}
