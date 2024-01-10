//
//  User.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 01/01/2024.
//

import Foundation
import FirebaseFirestoreSwift
struct User : Codable , Identifiable , Hashable {
    @DocumentID var uid: String?
    let fullname : String
    let email : String
    var profileImageUrl : String?
    
    var id : String {
        return uid ?? NSUUID().uuidString
    }
    var fristName : String {
        let formratter = PersonNameComponentsFormatter()
        let components = formratter.personNameComponents(from: fullname)
        return components?.givenName ?? fullname
    }
}
extension User {
    static let MOCK_USER = User(fullname: "Zeyad gamal", email: "zeyadjamal@gmail.com", profileImageUrl: "man")
}
