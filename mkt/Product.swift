//
//  Product.swift
//  mkt
//
//  Created by Fabio Sbano on 09/04/22.
//

import Foundation

struct Product: Decodable, Identifiable, Hashable {
  let id: Int
  let name: String
}

