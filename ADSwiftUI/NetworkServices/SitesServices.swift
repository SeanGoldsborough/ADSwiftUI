//
//  SitesServices.swift
//  UserView
//
//  Created by Sean Goldsborough on 11/1/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import Foundation
import Combine

public struct SitesService {
   var url: URL {
urlComponents.url ?? (URLComponents(string: "https://s3.amazonaws.com/decom_uploads/external/sites.json")?.url!)!
  }


  private var urlComponents: URLComponents {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "s3.amazonaws.com"
    components.path = "decom_uploads/external/sites.json"
    return components
  }

  public init() {}
}
    
extension SitesService: SitesServiceDataPublisher {
   
  public func publisher() -> AnyPublisher<Data, URLError> {
    
    URLSession.shared
    .dataTaskPublisher(for: url)
      .map(\.data)
      .eraseToAnyPublisher()
    
  }
}


