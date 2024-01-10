//
//  SettingOptionViewModel.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 01/01/2024.
//

import SwiftUI

enum SettingOptionViewModel : Int , CaseIterable , Identifiable {
    
    case darkModel
    case activeStatus
    case accessibillity
    case privacy
    case notificaiton

    
    var title : String {
        switch self {
        case .darkModel: return "Dark mode"
        case .activeStatus: return "Active status"
        case .accessibillity: return "Accessibillity"
        case .privacy: return "Privacy"
        case .notificaiton: return "Notificaiton"
     
        }
    }
    
    var imageName : String {
        switch self {
        case .darkModel: return "moon.circle.fill"
        case .activeStatus: return "message.badge.circle.fill"
        case .accessibillity: return "person.circle.fill"
        case .privacy: return "lock.circle.fill"
        case .notificaiton: return "bell.circle.fill"
      
        }
    }
    var imagegroundColor : Color {
        switch self {
        case .darkModel: return .black
        case .activeStatus: return Color(.systemGreen)
        case .accessibillity: return .black
        case .privacy: return Color(.systemBlue)
        case .notificaiton: return Color(.systemPurple)
        }
    }
    var id : Int {return self.rawValue}
}
