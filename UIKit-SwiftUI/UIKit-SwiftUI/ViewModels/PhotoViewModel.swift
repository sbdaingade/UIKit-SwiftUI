//
//  PhotoViewModel.swift
//  UIKit-SwiftUI
//
//  Created by Sachin Daingade on 16/08/23.
//

import Foundation
import Combine
public class PhotoViewModel: ObservableObject, Identifiable {
    
    @Published public var title: String
    @Published public var url: String
    @Published public var description: String
    
    private var photo: Photo
    
    init(withPhoto photo: Photo) {
        self.photo = photo
        self.title = photo.title
        self.url = photo.url
        self.description = photo.description
    }
    
    deinit {
        debugPrint("deint PhotoViewModel")
    }
}
