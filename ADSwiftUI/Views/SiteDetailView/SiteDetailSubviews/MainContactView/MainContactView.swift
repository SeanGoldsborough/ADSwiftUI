//
//  MainContactView.swift
//  UserView
//
//  Created by Sean Goldsborough on 10/31/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import SwiftUI
import Combine

struct MainContactView: View {
    
    @ObservedObject var sitesDetailViewModel: SitesDetailViewModel
    @State var site: Sites
    @Binding var isNotEditing: Bool
    @ObservedObject var image = ImageLoader()
    
    @State var buildingName: String
    @State var contactName: String    
    @State var imageName: String
    
    var body: some View {
        VStack {
            
            //top 3rd
            HStack {
                
                VStack {
                    Image(uiImage: image.image ?? UIImage(systemName: "circle")!)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
                    .aspectRatio(contentMode: .fit)
                    .background(Color(.clear))
                        .padding(.leading)
                    .padding(4)
                }
                    
                VStack {
                    VStack {
                        VStack {
                            TextField("Building Name", text: .constant("Building Name")).disabled(true).font(.headline)
                            CustomTextField(isEditing: self.$sitesDetailViewModel.globalBool, placeHolder: "N/A", text: self.$buildingName).font(.body)
                        }.padding(.bottom)
                        VStack {
                            TextField("Main Contact", text: .constant("Main Contact")).disabled(true).font(.headline)
                            CustomTextField(isEditing: self.$sitesDetailViewModel.globalBool, placeHolder: "N/A", text: self.$contactName).font(.body)
                        }
                    }.padding(.leading)
                }
            }
        }
        .onAppear{
            self.image.getImage(urlString: self.site.image!)
            self.buildingName = self.site.name ?? "N/A"
            self.contactName = self.site.contacts?.first?.name ?? "N/A"
        }
    }
}

