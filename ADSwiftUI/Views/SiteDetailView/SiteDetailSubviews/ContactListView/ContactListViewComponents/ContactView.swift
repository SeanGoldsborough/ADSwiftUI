//
//  ContactView.swift
//  UserView
//
//  Created by Sean Goldsborough on 10/31/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import SwiftUI

struct ContactView: View {
    var contact: Contacts

    var body: some View {

        HStack{
            VStack(alignment: .leading) {
                Text(contact.name ?? "N/A")
                    .font(.headline)
                    .foregroundColor(.primary)
                ContactDetailsView(contactData: contact.phone ?? "N/A", imageName: "hammer")
                .font(.subheadline)
                   
                ContactDetailsView(contactData: contact.phone_home ?? "N/A", imageName: "house")
                .font(.subheadline)
                
                ContactDetailsView(contactData: contact.email ?? "N/A", imageName: "envelope")
                .font(.subheadline)
            }
        }
    }
}

struct ContactDetailsView: View {
    var contactData: String
    var imageName: String

    var body: some View {
        HStack {
            Image(systemName: imageName).foregroundColor(.blue)
            Text(contactData)//.foregroundColor(.blue)
        }
    }
}
