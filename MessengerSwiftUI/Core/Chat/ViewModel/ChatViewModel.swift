//
//  ChatViewModel.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 08/01/2024.
//

import Foundation

class ChatViewModel : ObservableObject {
    @Published var messageText = ""
    @Published var messages = [Message]()
    let service : ChatService
    
    init(user : User) {
        self.service = ChatService(chatParthner: user)
        observeMessages()
    }
    func observeMessages() {
        service.observeMEssage() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    func sendMessage() {
        service.sendMessage(messageText)
    }
}
