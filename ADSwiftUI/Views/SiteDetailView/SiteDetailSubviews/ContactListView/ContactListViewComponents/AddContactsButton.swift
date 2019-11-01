//
//  AddContactsButton.swift
//  UserView
//
//  Created by Sean Goldsborough on 10/31/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import SwiftUI

struct AddContactsButton: View {
    var body: some View {
       
        Button(action: {
            print("Add new contact tapped.")
        }) {
            HStack {
                Image(systemName: "plus.circle").foregroundColor(.blue)
                Text("Add New Contact")
            }
        }
    }
}
