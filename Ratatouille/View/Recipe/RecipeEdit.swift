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
    
    @State var strMeal: String = ""
    
    var body: some View {
        Form {
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
            /*
            strArea = area.strArea
            countryCode = area.countryCode*/

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
                    /*
                    area.strArea = strArea
                    area.countryCode = countryCode.uppercased()*/
                    
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
