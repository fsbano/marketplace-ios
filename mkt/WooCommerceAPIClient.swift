//
//  WooCommerceAPIClient.swift
//  mkt
//
//  Created by Fabio Sbano on 10/04/22.
//

import Foundation

class WooCommerceAPIClient: ObservableObject {
  @Published var products: [Product] = []
    
  func Products() {
    print ("/wp-json/wc/v3/products/categories")
    APIClient.Products.get { product in
      DispatchQueue.main.sync {
        self.products = product
      }
    }
  }
}
