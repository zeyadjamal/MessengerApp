//
//  ChatNewMassage.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 03/01/2024.
//

import SwiftUI

struct ChatNewMassage: View {
    let message : Message
    
    private var fromeCurrentUser : Bool {
        return message.isFromCurrentUser
    }
    var body: some View {
        HStack {
            if fromeCurrentUser {
                Spacer()
                Text(message.messageText)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(fromeCurrentUser: fromeCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5 , alignment: .trailing)
            }else {
                HStack(alignment : .bottom , spacing : 8) {
                    CircularProfileView(user: User.MOCK_USER, size: .xxSmall)
                    Text(message.messageText)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubble(fromeCurrentUser: fromeCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)
                    Spacer()
                }
            }
        }
        .padding(.horizontal,8)
    }
}

//#Preview {
 //   ChatNewMassage()
//}
