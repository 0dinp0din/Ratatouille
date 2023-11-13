import SwiftUI
import SwiftData

struct CategoryView: View {
    @AppStorage("isDarkMode") var darkMode = false
    
    @Query private var categories: [CategoryModel]
    
    var body: some View {
        NavigationStack {
            Group {
                if categories.isEmpty {
                    ContentUnavailableView("Ingen kategorier", systemImage: "square.stack.3d.up.slash")
                } else {
                    List(categories) {
                        category in
                        
                        HStack {
                            
                            AsyncImage(url: URL(string: category.strCategoryThumb)) { image in
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                            } placeholder: {
                                ProgressView()
                            }
                            
                            Text(category.strCategory)
                        }
                    }
                }
            }
            .navigationTitle("Kategorier")
        }
    }
}

#Preview {
    CategoryView().modelContainer(for: CategoryModel.self)
}
