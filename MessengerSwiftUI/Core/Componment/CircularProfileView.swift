//
//  CircularProfileView.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 02/01/2024.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case meduim
    case large
    case xlarge
    
    var dimension : CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .meduim: return 56
        case .large: return 64
        case .xlarge: return 88
        }
    }
}


struct CircularProfileView: View {
    var user : User?
    let size : ProfileImageSize
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            Image(imageUrl)
                .resizable()
                .scaledToFit()
                .frame(width : size.dimension , height: size.dimension)
                .clipShape(Circle())
        }else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width : size.dimension , height: size.dimension)
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircularProfileView(user: User.MOCK_USER, size: .meduim)
}
