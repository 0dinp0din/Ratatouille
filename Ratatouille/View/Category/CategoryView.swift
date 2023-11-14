import SwiftUI
import SwiftData

struct CategoryView: View {
    @AppStorage("isDarkMode") var darkMode = false
    @Environment(\.dismiss) private var dismiss
    
    @Query(filter: #Predicate<CategoryModel>{$0.trash == false}) private var categories: [CategoryModel]
    
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            Group {
                if categories.isEmpty {
                    ContentUnavailableView("Ingen kategorier", systemImage: "square.stack.3d.up.slash")
                } else {
                    List {
                        ForEach(categories) { category in
                            NavigationLink(destination: CategoryEdit(category)) {
                                CategoryRow(category)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Kategorier")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button
                    {
                      showSheet.toggle()
                    }
                    label:
                    {
                        Label("Ny kategori", systemImage: "plus.circle.fill")
                    }
                }
            }      
            .sheet(isPresented: $showSheet)
            {
              CategoryAdd()
            }
        }
        .environment(\.colorScheme, darkMode ? .dark : .light)
    }
}

#Preview {
    CategoryView().modelContainer(for: CategoryModel.self)
}
