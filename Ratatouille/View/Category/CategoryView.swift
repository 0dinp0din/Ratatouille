import SwiftUI
import SwiftData

struct CategoryView: View {
    @AppStorage("isDarkMode") var darkMode = false
    
    @Query(filter: #Predicate<CategoryModel>{$0.trash == false}) private var categories: [CategoryModel]
    
    var body: some View {
        NavigationStack {
            Group {
                if categories.isEmpty {
                    ContentUnavailableView("Ingen kategorier", systemImage: "square.stack.3d.up.slash")
                } else {
                    List(categories) {
                        category in
                        
                        CategoryRow(category)
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
