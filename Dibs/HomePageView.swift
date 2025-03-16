import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let image: String
    let description: String
}

struct HomePageView: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: String = "All"
    @State private var items: [Item] = [
        Item(name: "Shirt", price: 15.99, image: "Shirt", description: "A stylish shirt"),
        Item(name: "Chair", price: 39.99, image: "Chair", description: "Comfortable chair"),
        Item(name: "Backpack", price: 25.49, image: "Backpack", description: "A handy backpack"),
        Item(name: "Desk", price: 89.99, image: "Desk", description: "Work desk"),
        Item(name: "Notebook", price: 5.99, image: "Notebook", description: "A notebook for notes")
    ]
    
    let categories = ["Clothes", "Furniture", "Supplies"]
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func loadImage(named imageName: String) -> UIImage? {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageName)
        return UIImage(contentsOfFile: url.path)
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search", text: $searchText)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)

                    Spacer()
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
                                .bold()
                                .background(selectedCategory == category ? Color.purple.opacity(0.3) : Color.clear)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)

                // Grid of Items (2 per row, max 5 items)
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(items) { item in
                        NavigationLink(destination: ItemDetailView(item: item)) { // NavigationLink to ItemDetailView
                            VStack {
                                // Load the image using the image name
                                if let uiImage = loadImage(named: item.image) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 130, height: 100)
                                        .cornerRadius(10)
                                } else {
                                    Image(item.image) // Fallback for asset images
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 130, height: 100)
                                        .cornerRadius(10)
                                }

                                Text(item.name)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Text("$\(item.price, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }
                }
                .padding()

                Spacer()

                // Bottom Buttons
                HStack {
                    NavigationLink(destination: ListPageView(items: $items)) {
                        Text("List Item")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.black)
                            .bold(true)
                            .background(Color.purple.opacity(0.4))
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: CartPageView()) {
                        Text("Cart")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .bold()
                            .foregroundColor(.black)
                            .background(Color.blue.opacity(0.5))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
            .background(Color.blue.opacity(0.1))
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomePageView()
}
