//
//  SitePicture.swift
//  UserView
//
//  Created by Sean Goldsborough on 11/1/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct SitePicture: View {
    
    @ObservedObject var image = ImageLoader()
    var imageName: String

    var body: some View {
        ZStack{
            Image(uiImage: image.image ?? UIImage(systemName: "circle")!)
            .resizable()
            .frame(width: 100, height: 100)
            ActivityIndicator(isAnimating: .constant(image.isAnimating), style: .large)
        }.onAppear {
            self.image.getImage(urlString: self.imageName)
        }
    }
}
