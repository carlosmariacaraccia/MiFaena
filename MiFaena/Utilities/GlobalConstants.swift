//
//  GlobalConstants.swift
//  MiFaena
//
//  Created by Carlos Caraccia on 3/17/21.
//

import Foundation
import Firebase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")
let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_SUPPLIERS_INV_SUMMARIES = DB_REF.child("suppliers_invoices_summaries")

