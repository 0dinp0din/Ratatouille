import SwiftUI
import SwiftData

struct ShowRecipeView: View
{
    @State private var showSheet = false
    
    @Query(filter: #Predicate<AreaModel>{$0.trash == false}) private var areas: [AreaModel]
    @Query(filter: #Predicate<CategoryModel>{$0.trash == false}) private var categories: [CategoryModel]
    
    @Bindable var recipe: RecipeModel
    
    @State private var area: AreaModel?
    @State private var category: CategoryModel?
    
    init(_ recipe: RecipeModel) {
        self.recipe = recipe
    }
    
    @Environment(\.dismiss) private var dismiss
    @AppStorage("isDarkMode") private var darkMode = false
    
    @State var strMeal: String = ""
    @State var strInstructions: String = ""
    
    var body: some View {
        
        NavigationStack {
            
            Group {
                Text(recipe.strMeal ).font(.largeTitle)
                AsyncImage(url: URL(string: recipe.strMealThumb )) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                
                Spacer()
                Text("Instruksjon")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(recipe.strInstructions)
            }
        }.onAppear {
            area = recipe.area
            category = recipe.category
            strMeal = recipe.strMeal
            strInstructions = recipe.strInstructions
        }.toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button
                {
                  showSheet.toggle()
                }
                label:
                {
                    Label("Rediger matoppskrift", systemImage: "pencil.circle")
                }
            }
        }
        .sheet(isPresented: $showSheet)
        {
          RecipeEdit(recipe)
        }
        .environment(\.colorScheme, darkMode ? .dark : .light)
    }
}
