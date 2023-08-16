//
//  PhotoCell.swift
//  UIKit-SwiftUI
//
//  Created by Sachin Daingade on 16/08/23.
//

import SwiftUI
import Combine


struct PhotoCell: View {
    @StateObject var photoViewModel: PhotoViewModel
    var body: some View {
        
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: photoViewModel.url),content: asyncImageView)
                .frame(width:100, height:100)
            VStack(alignment: .leading) {
                Text(photoViewModel.title)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .font(.subheadline).bold()
                Text(photoViewModel.description)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .font(.subheadline)
            }
        }
    }
    
    
    @ViewBuilder
    private func asyncImageView(for phase: AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
          //  ProgressView("Loading..")
            ProgressView()
        case .success(let image):
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
        case .failure(let error):
            VStack(spacing:16) {
                Image(systemName: "xmark.octagon.fill")
                    .foregroundColor(.red)
                Text(error.localizedDescription)
                    .multilineTextAlignment(.center)
            }
            
        @unknown default:
            Text("unknown")
                .foregroundColor(.gray)
        }
    }
}
    struct PhotoCell_Previews: PreviewProvider {
        
        static var previews: some View {
            let dummyPhoto = Photo(description: "Sachin", id: 1, url: "https://api.slingacademy.com/public/sample-photos/1.jpeg", title: "Sachin Daingade", user: 1234)
            let photoViewModel = PhotoViewModel(withPhoto: dummyPhoto)
            PhotoCell(photoViewModel: photoViewModel)
                .padding([.leading,.trailing,.top,.bottom] ,10)
                .previewLayout(.sizeThatFits)
        }
    }
