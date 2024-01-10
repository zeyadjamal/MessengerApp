//
//  profileView.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 01/01/2024.
//

import SwiftUI
import PhotosUI
struct profileView: View {
    @StateObject var viewModel = ProfileViewModel()
    let user : User
    var body: some View {
        VStack {
            VStack {
                PhotosPicker(selection : $viewModel.seltectedItem) {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFit()
                        .frame(width : 80 , height: 80)
                        .clipShape(Circle())
                    }else {
                        CircularProfileView(user: user, size: .xlarge)
                            
                    }
                }
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            List {
                Section {
                    ForEach(SettingOptionViewModel.allCases){option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width : 25 , height: 25)
                                .foregroundColor(option.imagegroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                Section {
                    Button("Logout"){
                        AuthService.shared.signOut()
                    }
                    Button("DeleteACCount") {
                        
                    }
                }.tint(.red)
            }
        }
    }
}

#Preview {
    profileView(user: User.MOCK_USER)
}
