//
//  MockDatabaseReference.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/23/21.
//

import Foundation
import Firebase


class MockDatabaseReference:DatabaseReference {
    
    var mockSnapShot:DataSnapshot?
    
    override func child(_ pathString: String) -> DatabaseReference {
        self
    }
    
    override func observe(_ eventType: DataEventType, with block: @escaping (DataSnapshot) -> Void) -> UInt {
        let snapshot = mockSnapShot!
        DispatchQueue.global().async {
            block(snapshot)
        }
        return 0
    }
    
    override func observeSingleEvent(of eventType: DataEventType, with block: @escaping (DataSnapshot) -> Void) {
        let snapshot = mockSnapShot!
        DispatchQueue.global().async {
            block(snapshot)
        }
    }
}
