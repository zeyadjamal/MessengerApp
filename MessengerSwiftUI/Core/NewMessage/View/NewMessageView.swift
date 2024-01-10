//
//  NewMessageView.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 01/01/2024.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @StateObject private var viewModel = NewMessageViewModel()
    @Binding var selectedUser : User?
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("TO" , text: $searchText)
                    .frame(height : 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("CONTACTS")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity , alignment : .leading)
                    .padding()
                
                ForEach(viewModel.users) { user in
                    VStack {
                        HStack {
                            CircularProfileView(user: user, size: .small)
                            Text(user.fullname)
                                .font(.footnote)
                            Spacer()
                        }
                        .padding(.leading)
                        Divider()
                            .padding(.leading , 40)
                    }
                    .onTapGesture {
                        selectedUser = user
                        dismiss()
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        NewMessageView(selectedUser: .constant(User.MOCK_USER))
    }
}
