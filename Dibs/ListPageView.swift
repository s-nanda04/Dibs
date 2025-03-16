//
//  ListPageView.swift
//  Dibs
//
//  Created by minesh sumair on 3/15/25.
//

import SwiftUI

struct ListPageView: View {
    @Binding var items: [Item]
    
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented = false
    @State private var itemName: String = ""
    @State private var itemPrice: String = ""
    @State private var itemDescription: String = ""
    
    @Environment(\.presentationMode) var presentationMode // To dismiss the view after listing
    

    var body: some View {
        VStack(spacing: 20) {
            Text("List an Item")
                .font(.title)
                .bold()
            
            // Image Picker Button
            Button(action: {
                isImagePickerPresented.toggle()
            }) {
                ZStack {
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 170)
                            .clipped()
                            .cornerRadius(10)
                    } else {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 200, height: 170)
                            .overlay(Text("Tap to upload").foregroundColor(.gray))
                            .cornerRadius(10)
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(image: $selectedImage)
            }

            // Item Name Input
            TextField("Enter item name", text: $itemName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            // Item Price Input
            TextField("Enter item price", text: $itemPrice)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding(.horizontal)

            // Item Description Input (Limited to 50 words)
            TextField("Enter description (max 50 words)", text: $itemDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            // List Item Button
            Button(action: {
                listNewItem()
            }) {
                Text("List Item")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding()
    }

    // Function to list the new item
    func listNewItem() {
        guard let price = Double(itemPrice), !itemName.isEmpty else {
            print("Invalid input")
            return
        }

        var imageName = "default_image" // Default placeholder
        
        if let selectedImage = selectedImage {
            imageName = saveImageToDocuments(image: selectedImage)
        }

        let newItem = Item(name: itemName, price: price, image: imageName, description: itemDescription)
        items.append(newItem)
        presentationMode.wrappedValue.dismiss()
    }

    func saveImageToDocuments(image: UIImage) -> String {
        let imageName = UUID().uuidString + ".jpg"
        if let data = image.jpegData(compressionQuality: 0.8) {
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageName)
            try? data.write(to: url)
        }
        return imageName
    }

}

#Preview {
    ListPageView(items: .constant([Item(name: "Example Item", price: 19.99, image: "default_image", description: "An example item")]))
}
