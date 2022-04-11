//
//  ContentView.swift
//  mkt
//
//  Created by Fabio Sbano on 08/04/22.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var wooCommerceAPIClient = WooCommerceAPIClient()
  @State private var multiSelection = Set<UUID>()
        
  var body: some View {
    NavigationView {
      List {
        ForEach(wooCommerceAPIClient.products, id: \.self) { product in
          Text(product.name)
        }
      }
      .navigationTitle("Products")
      .toolbar { EditButton() }
      .onAppear {
      self.wooCommerceAPIClient.Products()
      }
    }
    Text("\(multiSelection.count) selections")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
