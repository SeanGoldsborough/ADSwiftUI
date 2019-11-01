//
//  SiteListViewModel.swift
//  UserView
//
//  Created by Sean Goldsborough on 10/27/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//




import Foundation
import SwiftUI
import UIKit
import Combine

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage = UIImage(systemName: "photo")
    @Published var isAnimating = true
    
    
    func getImage(urlString: String) {
        SitesListViewModel.fetchImage(urlString: urlString)
            
            .sink(receiveCompletion: { (err) in
                print(err)
            }) { (value) in
                self.image = value
                self.isAnimating = false      
        }
    }
}

class SitesListViewModel: ObservableObject {
    // MARK: - Published properties
    @Published var sites = [Sites]()
    @Published var contacts : [Contacts] = []
    
    private let sitesService: SitesServiceDataPublisher = SitesService()
    
    //public init(sitesService: SitesServiceDataPublisher = SitesService())

    static func fetchImage(urlString: String) -> AnyPublisher<UIImage, Error> {
        let url = URL(string: urlString)

        return URLSession.shared.dataTaskPublisher(for: url!)
            .retry(1)
            .tryMap { (data, response) -> UIImage in
                guard let image = UIImage(data: data) else {
                    return UIImage(systemName: "doc.text")!
                }
                return image
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
    func getData() {
        sitesService.publisher()
            .retry(1)
            .map { $0 }
            .decode(type: Base.self, decoder: JSONDecoder())
            .receive(on : RunLoop.main)
            .sink(receiveCompletion: { (error) in
                print(error)
            }, receiveValue: {
                self.sites = $0.sites!
                print($0)
            })
    }
    
}
