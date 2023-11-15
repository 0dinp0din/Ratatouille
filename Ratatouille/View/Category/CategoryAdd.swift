import SwiftUI

struct CategoryAdd: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @AppStorage("isDarkMode") private var darkMode = false
    
    @State var strCategory: String = ""
    @State var strCategoryThumb: String = ""
    @State var strCategoryDescription: String = ""
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Navn", text: $strCategory)
                TextField("Url til bilde", text: $strCategoryThumb)
                TextField("Beskrivelse", text: $strCategoryDescription)
                
            }.toolbar {
                ToolbarItem(placement: .cancellationAction)
                {
                  Button("Avbryt", role: .cancel)
                  {
                    dismiss()
                  }
                }
                
                ToolbarItem(placement: .principal)
                {
                  Text("Ny kategori")
                }
                
                ToolbarItem(placement: .confirmationAction)
                {
                  Button("Lagre")
                  {
                    let category = CategoryModel()
                    
                      category.strCategory = strCategory
                      category.strCategoryThumb = strCategoryThumb
                      category.strCategoryDescription = strCategoryDescription
                      
                      context.insert(category)
                      
                      dismiss()
                      
                  }
                    
                }
            }
            

        }
    }
}

#Preview
{
  CategoryAdd(strCategory: "", strCategoryThumb: "", strCategoryDescription: "")
}
