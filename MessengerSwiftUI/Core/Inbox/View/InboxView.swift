//
//  InboxView.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 01/01/2024.
//

import SwiftUI

struct InboxView: View {
    @State private var showMessageView = false
    @StateObject var viewModel = InboxViewModel()
    @State private var selectedUsers : User?
    @State private var showChat = false
    
    private var user : User? {
        return viewModel.currentUser
    }
    var body: some View {
        NavigationStack {
                List {
                    ActiveNowView()
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .padding(.vertical)
                        .padding(.horizontal,4)
                    ForEach(viewModel.recentMessages) {message in
                        ZStack {
                            NavigationLink(value : message) {
                                EmptyView()
                            }.opacity(0.0)
                            InboxRowView(message: message)
                        }
                    }
                }
                .navigationTitle("Chat")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(PlainListStyle())
            .onChange(of: selectedUsers, perform : {newValue in
                showChat = newValue != nil
            })
            .navigationDestination(for: Message.self, destination: { message in
                if let user = message.user {
                    ChatView(user : user)
                }
            })
            .navigationDestination(for: Route.self, destination: { route in
                switch route {
                case .profile(let user):
                    profileView(user: user)
                case .chatView(let user):
                    ChatView(user: user)
                }
            })
            .navigationDestination(isPresented: $showChat , destination: {
                if let user = selectedUsers {
                    ChatView(user : user)
                }
            })
            .fullScreenCover(isPresented: $showMessageView, content: {
                NewMessageView(selectedUser: $selectedUsers)
            })
            .toolbar {
                ToolbarItem(placement : .navigationBarLeading) {
                    HStack {
                        if let user {
                            NavigationLink(value: Route.profile(user)) {
                                CircularProfileView(user: user, size: .xSmall)
                            }
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showMessageView.toggle()
                        selectedUsers = nil
                    }label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 35 , height: 35)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }
                }
            }
        }
    }
}

#Preview {
    InboxView()
}
