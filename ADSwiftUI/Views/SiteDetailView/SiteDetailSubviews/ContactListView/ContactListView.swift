//
//  ContactListView.swift
//  UserView
//
//  Created by Sean Goldsborough on 10/31/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import SwiftUI
import Combine

struct ContactListView: View {
    @ObservedObject var sitesDetailViewModel: SitesDetailViewModel
    @State var site: Sites
    @State var isNotEditing: Bool
    @State var showingSheet: Bool
    @State var showingAlert: Bool
    
    var body: some View {
        VStack {
            HStack {
                TextField("", text: .constant("Other Contacts")).disabled(true).foregroundColor(.white).padding(.leading).font(.headline)
            }.background(Color(.lightGray)).padding(0)
            
            HStack {
                ContactsList(sitesDetailViewModel: self.sitesDetailViewModel, sites: self.site, showingSheet: self.showingSheet)
            }
        }
    }
}

