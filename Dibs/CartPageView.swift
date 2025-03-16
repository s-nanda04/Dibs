//
//  CartPageView.swift
//  Dibs
//
//  Created by Jia Amarnani on 3/16/25.
//

import SwiftUI

struct CartPageView: View {
    @EnvironmentObject var cartManager: CartManager  // Access shared cart state

    var body: some View {
        VStack {
            Text("Shopping Cart")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            List {
                ForEach(cartManager.cartItems) { item in
                    HStack {
                        if let uiImage = loadImage(named: item.image) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(10)
                        } else {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 80, height: 80)
                                .overlay(Text("No Image"))
                                .cornerRadius(10)
                        }

                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text("$\(String(format: "%.2f", item.price))")
                                .font(.subheadline)
                                .foregroundColor(.green)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
            }
            
            Text("Total: $\(cartManager.totalPrice(), specifier: "%.2f")")
                .font(.title2)
                .fontWeight(.bold)
                .padding()

            Button(action: {
                print("Checkout clicked")
            }) {
                Text("Checkout")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.bottom)
        }
    }
    
    func loadImage(named imageName: String) -> UIImage? {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageName)
        return UIImage(contentsOfFile: url.path)
    }
}


#Preview {
    CartPageView()
        .environmentObject(CartManager()) // Injects CartManager into preview

}
