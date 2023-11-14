import SwiftUI

struct CategoryAdd: View {
    
    @Environment(\.modelContext) private var context
    
    @State var strCategory: String
    @State var strCategoryThumb: String
    @State var strCategoryDescription: String
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Navn", text: $strCategory)
                TextField("Url til bilde", text: $strCategoryThumb)
                TextField("Beskrivelse", text: $strCategoryDescription)
                
            }.toolbar {
                ToolbarItem(placement: .confirmationAction)
                {
                  Button("Lagre")
                  {
                    let category = CategoryModel()
                    
                      category.strCategory = strCategory

                    
                    context.insert(category)
                      
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
