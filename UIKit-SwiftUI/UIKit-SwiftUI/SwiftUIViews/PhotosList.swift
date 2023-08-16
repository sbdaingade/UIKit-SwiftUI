//
//  PhotosList.swift
//  UIKit-SwiftUI
//
//  Created by Sachin Daingade on 16/08/23.
//

import SwiftUI

struct PhotosList: View {
    @StateObject var photosViewModel = PhotosViewModel()
    
    var body: some View {
       
        List(photosViewModel.photos) { photo in
            let viewModel = PhotoViewModel(withPhoto: photo)
            PhotoCell(photoViewModel: viewModel)
        }
        .onAppear(perform: {
            photosViewModel.input = .getPhotos
        })
        .navigationTitle("Home")
    }
}

struct PhotosList_Previews: PreviewProvider {
    static var previews: some View {
        PhotosList()
    }
}
