//
//  DetailImageView.swift
//  UserView
//
//  Created by Sean Goldsborough on 10/31/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import SwiftUI

struct DetailPicture: View {
    
    @ObservedObject var image = ImageLoader()
    @State var imageName: String
    var isAnimating: Bool

    var body: some View {
        VStack{
            Image(uiImage: image.image ?? UIImage(systemName: "circle")!)
            .resizable()
            ActivityIndicator(isAnimating: .constant(self.isAnimating), style: .large)
        }.onAppear {
            self.image.getImage(urlString: self.imageName)
        }
    }
}
