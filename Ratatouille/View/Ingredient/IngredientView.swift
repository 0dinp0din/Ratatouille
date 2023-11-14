import SwiftUI
import SwiftData

struct IngredientView: View {
    @AppStorage("isDarkMode") var darkMode = false
    
    @Query(filter: #Predicate<IngredientModel>{$0.trash == false}) private var ingredients: [IngredientModel]
    
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            Group {
                if ingredients.isEmpty {
                    ContentUnavailableView("Ingen Ingredienser", systemImage: "square.stack.3d.up.slash")
                } else {
                    List {
                        ForEach(ingredients) { ingredient in
                            NavigationLink(destination: IngredientEdit(ingredient)) {
                                IngredientRow(ingredient)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Ingredienser")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button
                    {
                      showSheet.toggle()
                    }
                    label:
                    {
                        Label("Ny Ingrediens", systemImage: "plus.circle.fill")
                    }
                }
            }
            .sheet(isPresented: $showSheet)
            {
              IngredientAdd()
            }
        }
        .environment(\.colorScheme, darkMode ? .dark : .light)
    }
}

#Preview {
    IngredientView().modelContainer(for: IngredientModel.self)
}



/*import SwiftUI
import SwiftData

struct IngredientView: View {
    @AppStorage("isDarkMode") var darkMode = false
    @Environment(\.dismiss) private var dismiss
    
    @Query(filter: #Predicate<IngredientModel>{$0.trash == false}) private var ingredients: [IngredientModel]
    
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            Group {
                if ingredients.isEmpty {
                    ContentUnavailableView("Ingen Ingredienser", systemImage: "square.stack.3d.up.slash")
                } else {
                    List {
                        ForEach(ingredients) { ingredient in
                            NavigationLink(destination: IngredientEdit(ingredient)) {
                                IngredientRow(ingredient)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Ingredienser")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button
                    {
                      showSheet.toggle()
                    }
                    label:
                    {
                        Label("Ny Ingrediens", systemImage: "plus.circle.fill")
                    }
                }
            }
            .sheet(isPresented: $showSheet)
            {
              IngredientAdd()
            }
        }
        .environment(\.colorScheme, darkMode ? .dark : .light)
    }
}

#Preview {
    IngredientView().modelContainer(for: IngredientModel.self)
}
*/
