//
//  AuthService.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 04/01/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
class AuthService {
    
    @Published var userSession : FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        loadCurrentUserData()
    }
    @MainActor
    func login(withEmail email : String , password : String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password )
            self.userSession = result.user
        }catch {
            print("DEBUG : Faliled to Login in with error : \(error.localizedDescription )")
        }
        
    }
    @MainActor
    func crateUser(withEmail email : String , password : String ,fullname : String )async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
          try await self.uploadUserData(email: email , fullname: fullname, id: result.user.uid)
            loadCurrentUserData()
        }catch {
            print("DEBUG Failed to create user with : \(error.localizedDescription)")
        }
    }
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            UserService.shared.currentUser = nil
        }catch {
            print("DEBUG : Failed to sign out with error \(error.localizedDescription)")
        }
    }
    private func uploadUserData(email : String ,fullname : String , id : String)async throws {
        let user = User(fullname: fullname, email: email)
        guard let encodeUser = try? Firestore.Encoder().encode(user)else {return}
        try await Firestore.firestore().collection("users").document(id).setData(encodeUser)
    }
    private func loadCurrentUserData() {
        Task {try await UserService.shared.fetchCurrentUser() }
    }
}
