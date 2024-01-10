//
//  Message .swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 08/01/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable , Codable ,Hashable {
    @DocumentID var messageId : String?
    let fromId : String
    let told : String
    let messageText : String
    let timestamp : Timestamp
    
    var user : User?
    var id : String {
        return messageId ?? NSUUID().uuidString
    }
    var chatPartnerId : String {
        return fromId == Auth.auth().currentUser?.uid ? told : fromId
    }
    var isFromCurrentUser : Bool {
        return fromId == Auth.auth().currentUser?.uid
    }
    var timestampString : String {
        return timestamp.dateValue().timestampString()
    }
}
