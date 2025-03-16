//
//  CartManager.swift
//  Dibs
//
//  Created by Jia Amarnani on 3/16/25.
//
import SwiftUI

class CartManager: ObservableObject {
    @Published var cartItems: [Item] = []

    func addToCart(item: Item) {
        cartItems.append(item)
    }

    func totalPrice() -> Double {
        return cartItems.reduce(0) { $0 + $1.price }
    }
}

