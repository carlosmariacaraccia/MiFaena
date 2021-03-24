//
//  MockDatabaseReference.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/23/21.
//

import Foundation
import Firebase

class MockDalaiLama {
    
}

enum FirebaseMockSnapshots {
    
    case suppliersInvoiceSummaries(mock: MockSnapshotSuppliersInvoicesSummary)
    case xdd(mock:MockDalaiLama)
    
    var mock:AnyObject? {
        
        switch self {
        case .suppliersInvoiceSummaries(mock: let mockObject):
            return mockObject
        case .xdd(mock: let dalaiLama):
            return dalaiLama
        }
    }
    
}

class MockDatabaseReference:DatabaseReference {
    
    
    override func child(_ pathString: String) -> DatabaseReference {
        self
    }
    
    override func observe(_ eventType: DataEventType, with block: @escaping (DataSnapshot) -> Void) -> UInt {
        let snapshot = MockSnapshotSuppliersInvoicesSummary()
        DispatchQueue.global().async {
            block(snapshot)
        }
        return 0
    }
    
    override func observeSingleEvent(of eventType: DataEventType, with block: @escaping (DataSnapshot) -> Void) {
        let snapshot = MockSnapshotSuppliersInvoicesSummary()
        DispatchQueue.global().async {
            block(snapshot)
        }
    }
}
