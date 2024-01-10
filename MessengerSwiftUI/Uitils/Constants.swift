//
//  Constants.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 08/01/2024.
//

import Foundation
import Firebase

struct FirestoreConstants {
    
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}
