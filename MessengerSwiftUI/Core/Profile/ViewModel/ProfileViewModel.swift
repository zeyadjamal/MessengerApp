//
//  ProfileViewModel.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 01/01/2024.
//

import SwiftUI
import PhotosUI

class ProfileViewModel : ObservableObject {
    @Published var seltectedItem : PhotosPickerItem? {
        didSet { Task {try await leadImage()} }
    }
    @Published var profileImage :Image?
    
    func leadImage() async throws {
        guard let item = seltectedItem else { return }
        guard let imageDate = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: imageDate) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
