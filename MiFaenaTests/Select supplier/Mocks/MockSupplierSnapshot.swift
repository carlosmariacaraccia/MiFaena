//
//  MockSupplierSnapshot.swift
//  MiFaenaTests
//
//  Created by Carlos Caraccia on 3/26/21.
//

import Foundation
import Firebase

class MockSupplierSnapshot: DataSnapshot {
    
    override var key: String {
         "-MUZfHD7z_DEiVO6ZR0N"
    }
    
    override var value: Any? {
         ["userId": "2L66Qdsv91dmCQumoOutcUfug7t2", "taxId": "30-51266460-8", "country":"Argentina",
          "shortName":"A J MENDIZABAL Y CIA", "address":"PERON JUAN TTE.GRAL. 683 Piso:08", "bank":"",
          "city":"", "longName":"A J MENDIZABAL Y CIA SOCIEDAD ANONIMA COMERCIAL MANDATARIA Y AGRO1PECUARIA",
          "phone":"", "state":"CABA", "timeStamp":"1580958000.0"] as [String:AnyObject]
    }
    
}
