//
//  ChatView.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 03/01/2024.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel : ChatViewModel
    let user : User
    
    init(user : User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
        return
    }
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CircularProfileView(user: user, size: .xlarge)
                    VStack(spacing : 4) {
                        Text(user.fullname)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                LazyVStack {
                    ForEach(viewModel.messages) {message in
                        ChatNewMassage(message: message)
                    }
                }
            }
            Spacer()
            ZStack(alignment : .trailing) {
                TextField("Message....", text: $viewModel.messageText,axis: .vertical)
                    .padding(12)
                    .padding(.trailing,40)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                Button {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                }label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatView(user: User.MOCK_USER)
}
