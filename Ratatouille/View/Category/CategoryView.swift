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
                        
                        Text(category.strCategory)
                    }
                }
            }
        }
    }
}

#Preview {
    CategoryView().modelContainer(for: CategoryModel.self)
}
