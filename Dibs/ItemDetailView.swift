//
//  ItemDetailView.swift
//  Dibs
//
//  Created by minesh sumair on 3/16/25.
//

import SwiftUI

struct ItemDetailView: View {
    let item: Item  // Item model passed from HomePageView
    
    // Helper function to load the image from the document directory
    func loadImage(named imageName: String) -> UIImage? {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageName)
        return UIImage(contentsOfFile: url.path)
    }

    var body: some View {
        VStack {
            Text(item.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
            
            // Load image from document directory
            if let uiImage = loadImage(named: item.image) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 150)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 2, y: 2)
                    .padding()
            } else {
                // Fallback if image is not found
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 200, height: 150)
                    .overlay(Text("No Image Available").foregroundColor(.gray))
                    .cornerRadius(10)
                    .padding()
            }
            
            Text("$\(String(format: "%.2f", item.price))") // Display price
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.green)
                .padding(.bottom, 5)
            
            Text(item.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            
            Button(action: {
                // TODO: Add logic to add item to cart
                print("\(item.name) added to cart!")
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .navigationBarTitle(item.name, displayMode: .inline) // Set the navigation title to the item name
    }
}

#Preview {
    ItemDetailView(item: Item(name: "Example Item", price: 19.99, image: "example_image.jpg", description: "This is an example item with a description."))
}
