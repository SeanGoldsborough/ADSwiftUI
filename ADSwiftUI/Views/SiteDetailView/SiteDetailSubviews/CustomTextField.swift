//
//  CustomTextField.swift
//  UserView
//
//  Created by Sean Goldsborough on 10/31/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import SwiftUI
import Combine

struct CustomTextField: View {
    
    @Binding var isEditing: Bool
    @State var placeHolder: String
    @State var text: Binding<String>
    @State var image = ImageLoader()

    var body: some View {
        return HStack {
            if !isEditing {
                TextField(placeHolder, text: text).disabled(self.isEditing).background(Color.yellow)
            } else {
                TextField(placeHolder, text: text).disabled(self.isEditing).background(Color.white)
            }
        }
    }
}
