//
//  PhotosViewModel.swift
//  UIKit-SwiftUI
//
//  Created by Sachin Daingade on 16/08/23.
//

import Foundation
import Combine

enum LoadingState {
    case idle
    case loading
    case failed(ErrorHandler)
}

class PhotosViewModel: ObservableObject {
    
    @Published var showProgressView = false
    private var cancallables = Set<AnyCancellable>()
    @Published public private(set) var photos: [Photo] = []
    @Published public private(set) var loadingState: LoadingState = LoadingState.idle
    
    public enum Input {
        case getPhotos
    }
    
    @Published public var input: Input?
    
    init() {
        $input.compactMap{$0}.sink{ [unowned self] action in
            switch action {
            case .getPhotos:
                self.getAllphotos()
            }
        } .store(in: &cancallables)
    }
    
    private func getAllphotos() {
        showProgressView = true
        loadingState = .loading
        PhotoNetwork.getPhotos() { [unowned self] (result:Result<SamplePhoto, ErrorHandler>) in
            //   showProgressView = false
            switch result {
            case .success(let allPhotos):
                DispatchQueue.main.async { [unowned self] in
                    self.photos.removeAll()
                    self.photos = allPhotos.photos
                    self.loadingState = .idle
                }
            case .failure(let error):
                DispatchQueue.main.async {  [unowned self] in
                    self.loadingState = .failed(error)
                }
            }
        }
    }
    
    deinit {
        cancallables.forEach{$0.cancel()}
    }
}
