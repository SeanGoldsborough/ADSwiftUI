//
//  ActivityIndicator.swift
//  UserView
//
//  Created by Sean Goldsborough on 11/1/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
