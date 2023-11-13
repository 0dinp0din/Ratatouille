import Foundation

import SwiftUI
import SwiftData

struct IngredientView: View {
    
    @AppStorage("isDarkMode") private var darkMode = false
    
    //@Query private var recipes: [RecipeModel]
    
    var body: some View {
        NavigationStack {
            Group {

            }
        }
    }
}

#Preview {
    RecipeView()
}
