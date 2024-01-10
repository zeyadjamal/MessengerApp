//
//  NewMessageViewModel.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 08/01/2024.
//

import Foundation
import Firebase

@MainActor
class NewMessageViewModel : ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fetchAllUsers()
        self.users = users.filter({$0.id != currentUid })
    }
}
