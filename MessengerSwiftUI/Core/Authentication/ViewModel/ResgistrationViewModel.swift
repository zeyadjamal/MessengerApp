//
//  ResgistrationViewModel.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 04/01/2024.
//

import SwiftUI

class ResgistrationViewModel : ObservableObject {
    @Published var email : String  = ""
    @Published var password : String = ""
    @Published var fullname : String = ""
    
    func createUser() async throws {
        try await AuthService.shared.crateUser(withEmail: email, password: password, fullname: fullname) 
        
    }
}
