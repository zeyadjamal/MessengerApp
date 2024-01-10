//
//  ContentViewModel.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 04/01/2024.
//

import Firebase
import Combine
class ContentViewModel : ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init () {
        setupSubscribesr()
    }
    private func setupSubscribesr() {
        AuthService.shared.$userSession.sink {[weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellables)
    }
}
