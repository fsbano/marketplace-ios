//
//  APIClient.swift
//  mkt
//
//  Created by Fabio Sbano on 09/04/22.
//

import Foundation

struct APIClient {
  let consumerKey = ""
  let consumerSecret = ""
    
  public var products = [Product]()
    
  func getConsumerKey() -> String {
      return self.consumerKey
  }
    
  func getConsumerSecret() -> String {
      return self.consumerSecret
  }
}

extension APIClient {
  enum Products {
    static func get(completion: @escaping ([Product]) -> Void) {
      let client = APIClient()
      let url = URL(string: "https://fsbano.io/wp-json/wc/v3/products?per_page=100")!
      var request = URLRequest(url: url)
      request.httpMethod = "GET"
                                
      let user = (client.getConsumerKey() + ":" + client.getConsumerSecret()).data(using: .utf8)!.base64EncodedString()
      request.addValue("Basic \(user)", forHTTPHeaderField: "Authorization")
            
      URLSession.shared.dataTask(with: request) { data, response, error in
        do {
              if let data = data {
                let product = try JSONDecoder().decode([Product].self, from: data)
                completion(product)
              }
        } catch {
              print("Error")
        }
      }.resume()
    }
  }
}
