//
//  ResgisratationView.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 01/01/2024.
//

import SwiftUI

struct ResgisratationView: View {
    @StateObject var viewModel = ResgistrationViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()
            Image("messenger")
                .resizable()
                .scaledToFit()
                .frame(width: 120 , height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .padding(12)
                    .font(.footnote)
                    .background((Color(.systemGray6)))
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
                TextField("Enter your fullname", text: $viewModel.fullname)
                    .autocapitalization(.none)
                    .padding(12)
                    .font(.footnote)
                    .background((Color(.systemGray6)))
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
                
                SecureField("password", text: $viewModel.password)
                    .padding(12)
                    .font(.footnote)
                    .background((Color(.systemGray6)))
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
            }
            Button {
                Task { try await viewModel.createUser()}
            }label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360 , height: 44)
                    .background(.blue)
                    .cornerRadius(12)
            }.padding(.vertical)
            Spacer()
            Divider()
            Button {
                dismiss()
            }label: {
                HStack(spacing : 3) {
                    Text("you don't have account?")
                    Text("Sgin Up")
                       
                    
                }
                .foregroundColor(.blue)
                .font(.footnote)
                .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    ResgisratationView()
}
