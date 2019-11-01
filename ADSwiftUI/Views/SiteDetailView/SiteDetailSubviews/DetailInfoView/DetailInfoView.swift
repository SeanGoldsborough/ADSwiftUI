//
//  DetailInfoView.swift
//  UserView
//
//  Created by Sean Goldsborough on 10/31/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct DetailInfoView: View {
    
    @State var site: Sites
    @State var isNotEditing: Bool
    @ObservedObject var sitesDetailViewModel: SitesDetailViewModel
    
    @State var showingSheet: Bool
    @State var showingAlert: Bool
    
    @State var hasContactInfo: Bool
    @State var hasOtherContacts: Bool
    
    @State var address: String
    @State var phone: String
    @State var phoneHome: String
    @State var email: String
    
    var body: some View {
        //second 3rd
        VStack {
            HStack {
                TextField("Address", text: .constant("Address")).disabled(self.isNotEditing).foregroundColor(.white).padding(.leading).font(.headline)
            }.background(Color(.lightGray)).padding(0)
            
            CustomTextField(isEditing: self.$sitesDetailViewModel.globalBool, placeHolder: "N/A", text: self.$address).font(.subheadline).padding(.leading)
            
            HStack {
                TextField("Phone", text: .constant("Phone")).disabled(self.isNotEditing).foregroundColor(.white).padding(.leading).font(.headline)
            }.background(Color(.lightGray)).padding(0)
            
            HStack{
                VStack(alignment: .leading) {
                    CustomTextField(isEditing: self.$sitesDetailViewModel.globalBool, placeHolder: "N/A", text: self.$phone).foregroundColor(.blue).font(.subheadline)
                }.padding(.trailing)
                .onTapGesture{
                    self.showingAlert = true
                    self.sitesDetailViewModel.placePhoneCall(phoneNumber: self.site.contacts?.first?.phone ?? "N/A")
                }
                VStack(alignment: .leading) {
                    TextField("Work", text: .constant("Work")).disabled(self.isNotEditing).multilineTextAlignment(.trailing).layoutPriority(0).font(.subheadline)
                }.padding(.trailing)
            }.padding(.leading)
                                        
            HStack{
                VStack(alignment: .leading) {
                
                    CustomTextField(isEditing: self.$sitesDetailViewModel.globalBool, placeHolder: "N/A", text: self.$phoneHome).font(.subheadline)
                }.padding(.trailing).foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    TextField("Home", text: .constant("Home")).disabled(self.isNotEditing).multilineTextAlignment(.trailing).font(.subheadline)
                    }.padding(.trailing).layoutPriority(0)
            }.padding(.leading)
                                            
            HStack {
                TextField("Email", text: .constant("Email")).disabled(self.isNotEditing).foregroundColor(.white).padding(.leading).font(.headline)
            }.background(Color(.lightGray)).padding(0)
            
            HStack{
                VStack(alignment: .leading) {
                    CustomTextField(isEditing: self.$sitesDetailViewModel.globalBool, placeHolder: "N/A", text: self.$email).foregroundColor(.blue)
                }.padding(.trailing).font(.subheadline)
                .onTapGesture{
                    self.showingAlert = true
                    self.sitesDetailViewModel.sendEmail(email: self.site.contacts?.first?.email ?? "N/A")
                }

                VStack(alignment: .leading) {
                    TextField("Work", text: .constant("Work")).disabled(self.isNotEditing).multilineTextAlignment(.trailing).font(.subheadline)
                }.padding(.trailing)
            }.padding(.leading)             
        }
    }
}


