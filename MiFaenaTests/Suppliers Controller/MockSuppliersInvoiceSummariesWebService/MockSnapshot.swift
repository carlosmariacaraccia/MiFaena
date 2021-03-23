//
//  MockSnapshot.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/23/21.
//

import Foundation
import Firebase


class MockSnapshotSuppliersInvoicesSummary:DataSnapshot {
    
    override var value: Any? {
        ["supplierId":"hjalksdhfjasdhf", "suppliersInvoiceId":"asdhfkjhasdf", "suppliersShortname":"Colombo y Magliano SA",  "suppliersMovementId":"asdfasdf", "invoiceType":"A", "invoiceNumber":"1234-4559800", "invoiceDescription":"23 Toros con 16020 kg", "suppliersIconName":"hacienda", "invoiceDate":1577847600.0, "amount":"123123.45"] as [String:AnyObject]
    }
    
    override var key: String {
        return "asdkfhalksdhfllkjljkahsdf"
    }
}
