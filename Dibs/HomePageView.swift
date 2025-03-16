//
//  BuyingPageView.swift
//  Dibs
//
//  Created by minesh sumair on 3/15/25.
//

import SwiftUI

struct HomePageView: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: String = "All"
    let categories = ["Clothes", "Furniture", "Supplies"]
    
    let items: [Item] = [
        Item(name: "Shirt", price: 15.99, imageName: "shirt"),
        Item(name: "Chair", price: 39.99, imageName: "chair"),
        Item(name: "Backpack", price: 25.49, imageName: "backpack"),
        Item(name: "Desk", price: 89.99, imageName: "desk"),
        Item(name: "Notebook", price: 5.99, imageName: "notebook")
    ]
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {

            // Profile Picture Button
            HStack {
              //search bar
                TextField("Search", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                Button(action: {
                    // Profile action
                }) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black)
                        .padding()
                }
            }

            // Category Filter
            HStack {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        selectedCategory = category
                    }) {
                        Text(category)
                            .padding()
                            .foregroundColor(Color.gray)
                            .bold(true)
                            .background(selectedCategory == category ? Color(red: 0.941, green: 0.627, blue: 0.965).opacity(0.3) : Color.clear)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)

            // Grid of Items (2 per row, max 5 items)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items.prefix(5)) { item in
                    VStack {
                        Image(item.imageName)
                            .resizable()
                            .frame(width: 130, height: 100)
                            .cornerRadius(10)
                        Text(item.name)
                            .font(.headline)
                        Text("$\(item.price, specifier: "%.2f")")
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
            }
            .padding()

            Spacer()

            // Bottom Buttons
            HStack {
                Button(action: {
                    // Navigate to List Item Page
                }) {
                    Text("List Item")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .bold(true)
                        .background(Color(red: 0.941, green: 0.627, blue: 0.965))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }

                Button(action: {
                    // Navigate to Cart Page
                }) {
                    Text("Cart")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .bold(true)
                        .background(Color(red: 0.560, green: 0.627, blue: 0.965))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
        .background(Color(red: 0.812, green: 0.937, blue: 0.988))
        .navigationBarBackButtonHidden(true)

    }
    
}

// Item Model
struct Item: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String
}

#Preview {
    HomePageView()
}

