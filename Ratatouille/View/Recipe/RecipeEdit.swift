import SwiftUI
import SwiftData

struct RecipeEdit: View
{
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
        Form {
            TextField("Navn", text: $strMeal)
            TextField("Instruksjon", text: $strInstructions)
            
            
            Picker("Landområde", selection: $area) {
                Text("Velg et landområde").tag(nil as AreaModel?)
                ForEach(areas) {
                    area in Text(area.strArea).tag(area as AreaModel?)
                }
            }
            
            Picker("Kategori", selection: $category)
            {
                Text("Velg kategori").tag(nil as CategoryModel?)
                ForEach(categories) {
                    category in Text(category.strCategory).tag(category as CategoryModel?)
                }
            }
            
            Section
            {
                Button(role: .destructive) {
                    recipe.archiveDate = .now
                    recipe.trash = true
                    dismiss()
                }
            label:
                {
                    Label("Arkiver matoppskrift", systemImage: "archivebox.fill")
                }
            }
        }

        .onAppear {
            
            area = recipe.area
            category = recipe.category
            strMeal = recipe.strMeal
            strInstructions = recipe.strInstructions
        }
        .toolbar
        {
            ToolbarItem(placement: .cancellationAction)
            {
                Button("Avbryt", role: .cancel)
                {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .principal)
            {
                Text("Redigere matoppskrift")
            }
            
            ToolbarItem(placement: .confirmationAction)
            {
                Button("Lagre")
                {
                    recipe.area = area
                    recipe.category = category
                    recipe.strMeal = strMeal
                    recipe.strInstructions = strInstructions
                    
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .environment(\.colorScheme, darkMode ? .dark : .light)
    }
}
