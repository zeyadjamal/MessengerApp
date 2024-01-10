//
//  Date.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 09/01/2024.
//

import Foundation

extension Date {
    private var timeFormtter : DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateFormat = "HH : mm"
        return formatter
    }
    private var dayFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateFormat = "MM/dd/yy"
        return formatter
    }
    func timeString() -> String {
        return timeFormtter.string(from: self)
    }
    func dateString() -> String {
        return dayFormatter.string(from: self)
    }
    func timestampString() -> String {
        if Calendar.current.isDateInToday(self) {
            return timeString()
        }else if Calendar.current.isDateInToday(self) {
           return "Yesterday"
        }else {
            return dateString()
        }
    }
}
