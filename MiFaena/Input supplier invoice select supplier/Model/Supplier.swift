//
//  Supplier.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation

struct Supplier {
    
    let supplierId, userId, taxId, shortName: String
    let longName, address: String
    let city, state, country: String
    let phone: String
    let bank: String
    var dateAdded: Date
    
    init?(supplierId:String, dictionary:[String:Any]) {
        
        guard let userId = dictionary["userId"] as? String else { return nil }
        guard let taxId = dictionary["taxId"] as? String else { return nil }
        guard let shortName = dictionary["shortName"] as? String else { return nil }
        guard let name = dictionary["longName"] as? String else { return nil }
        guard let address = dictionary["address"] as? String else { return nil }
        guard let city = dictionary["city"] as? String else { return nil }
        guard let state = dictionary["state"] as? String else { return nil }
        guard let country = dictionary["country"] as? String else { return nil }
        guard let phone = dictionary["phone"] as? String else { return nil }
        guard let bank = dictionary["bank"] as? String else { return nil }
        guard let dateAdded = dictionary["timeStamp"] as? String else { return nil }
        
        self.supplierId = supplierId
        self.userId = userId
        self.taxId = taxId
        self.shortName = shortName
        self.longName = name
        self.address = address
        self.city = city
        self.state = state
        self.country = country
        self.phone = phone
        self.bank = bank
        self.dateAdded = Date(timeIntervalSince1970: Double(dateAdded)!)
                
    }
    
}
