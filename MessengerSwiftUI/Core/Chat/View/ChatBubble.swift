//
//  ChatBubble.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 03/01/2024.
//

import SwiftUI

struct ChatBubble: Shape {
    let fromeCurrentUser : Bool
    
    func path(in rect : CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [
            .topLeft,.topRight,fromeCurrentUser ? .bottomLeft : .bottomRight
        ],cornerRadii:CGSize(width: 16, height: 16))
        return Path(path.cgPath)
    }
}

#Preview {
    ChatBubble(fromeCurrentUser: true)
}
