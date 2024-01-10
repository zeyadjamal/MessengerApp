//
//  LoginView.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 01/01/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack {
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
                    
                    
                    SecureField("password", text: $viewModel.password)
                        .padding(12)
                        .font(.footnote)
                        .background((Color(.systemGray6)))
                        .cornerRadius(12)
                        .padding(.horizontal, 24)
                    
                }
                NavigationLink {
                    Text("Forget password")
                    
                }label: {
                    Text("Forget password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity , alignment: .trailing)
                }
                Button {
                    Task {try await  viewModel.login() }
                }label: {
                    Text("Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350 , height: 44)
                    .background(.blue)
                    .cornerRadius(10)
                }
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5 )
                    Text("OR")
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5 )
                }.foregroundColor(.gray)
                HStack {
                    Image("facebook")
                        .resizable()
                        .scaledToFit()
                        .frame(width : 20 , height : 20)
                    Text("Continue with facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
                Spacer()
                Divider()
                
                NavigationLink {
                    ResgisratationView()
                        .navigationBarBackButtonHidden(true)
                }label: {
                    HStack(spacing : 3) {
                        Text("you don't have account?")
                        Text("Sgin Up")
                            .fontWeight(.semibold)
                        
                    }
                    .foregroundColor(.blue)
                    .font(.footnote)
                    .fontWeight(.semibold)
                }
                .padding(.vertical , 10)
        }
    }
}
}

#Preview {
    LoginView()
}
