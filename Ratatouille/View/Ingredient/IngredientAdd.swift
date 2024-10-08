import SwiftUI

struct IngredientAdd: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @AppStorage("isDarkMode") private var darkMode = false
    
    @State var strIngredient: String = ""
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Navn på ingrediens", text: $strIngredient)
                
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
                  Text("Ny ingrediens")
                }
                
                ToolbarItem(placement: .confirmationAction)
                {
                  Button("Lagre")
                  {
                    let ingredient = IngredientModel()
                    
                      ingredient.strIngredient = strIngredient
                      context.insert(ingredient)
                      dismiss()
                      
                  }
                }
            }
        }
        .environment(\.colorScheme, darkMode ? .dark : .light)
    }
}

#Preview
{
  IngredientAdd(strIngredient: "")
}
