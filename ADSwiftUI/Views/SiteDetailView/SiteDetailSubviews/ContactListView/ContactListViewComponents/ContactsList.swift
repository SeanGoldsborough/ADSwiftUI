//
//  ContactsListView.swift
//  UserView
//
//  Created by Sean Goldsborough on 10/31/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import SwiftUI
import Combine

struct ContactsList: View {
   
    @ObservedObject var sitesDetailViewModel: SitesDetailViewModel
    @State var sites: Sites
    @State var showingSheet: Bool

    var body: some View {
        VStack {
            if self.sitesDetailViewModel.otherContactsArray.count >= 1 {
                
                List(self.sitesDetailViewModel.otherContactsArray, id: \.self) { item in
                    ContactView(contact: item)
                        .onTapGesture {
                            self.showingSheet = true
                        }
                   .actionSheet(isPresented: self.$showingSheet) {
                    ActionSheet(title: Text("Contact \(item.name!): "), buttons: [.default(Text("Call \(item.name!): \(item.phone!)")), .default(Text("Email \(item.name!): \(item.email!)")), .cancel(Text("Cancel"))])
                    }
                }
            }
            else if self.sitesDetailViewModel.otherContactsArray.count == 0 {
                HStack{
                    AddContactsButton().padding(.leading)
                    Spacer()
                }
                
                List(self.sitesDetailViewModel.otherContactsArray, id: \.self) { item in
                    ContactView(contact: item)
                }
            }
            else {
                HStack{
                    AddContactsButton().padding(.leading)
                    Spacer()
                }
                List{
                    Text("")
                }
            }
        }.onAppear{
            self.sitesDetailViewModel.createOtherContactsArray(site: self.sites)
            if self.sitesDetailViewModel.otherContactsArray.count >= 1 {
                self.sitesDetailViewModel.otherContactsArray.remove(at: 0)
            }
        }
    }
}

