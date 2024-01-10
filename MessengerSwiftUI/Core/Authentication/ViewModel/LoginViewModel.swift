//
//  LoginViewModel.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 04/01/2024.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email : String = ""
    @Published var password : String = ""
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email , password: password)
    }
}
 
