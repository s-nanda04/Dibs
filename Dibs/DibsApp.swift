//
//  DibsApp.swift
//  Dibs
//
//  Created by minesh sumair on 3/15/25.
//

import SwiftUI

@main
struct DibsApp: App {
    
    @StateObject private var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            HomePageView()
            .environmentObject(cartManager) // Inject the cart globally
            LandingView()
        }
    }
}
