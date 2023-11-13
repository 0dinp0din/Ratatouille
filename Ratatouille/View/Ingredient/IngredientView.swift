import Foundation

import SwiftUI
import SwiftData

struct IngredientView: View {
    
    @AppStorage("isDarkMode") private var darkMode = false
    
    @Query private var ingredients: [IngredientModel]
    
    var body: some View {
        NavigationStack {
            Group {
                if ingredients.isEmpty {
                    ContentUnavailableView("Ingen ingredienser", systemImage: "square.stack.3d.up.slash")
                } else {
                    List(ingredients) {
                        ingredient in
                        
                        Text(ingredient.strIngredient)
                    }
                }
            }
            .navigationTitle("Ingredienser")
        }
    }
}

#Preview {
    IngredientView().modelContainer(for: IngredientModel.self)
}
