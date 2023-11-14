import SwiftUI

struct IngredientEdit: View
{
    @Bindable var ingredient: IngredientModel
    
    init(_ ingredient: IngredientModel) {
        self.ingredient = ingredient
    }
    
    @Environment(\.dismiss) private var dismiss
    
    @State var strIngredient: String = ""

    
    var body: some View {
        Form {
            TextField("Navn på ingrediens", text: $strIngredient)
            
            Section
            {
                Button(role: .destructive) {
                    ingredient.archiveDate = .now
                    ingredient.trash = true
                    dismiss()
                }
            label:
                {
                    Label("Arkiver ingrediens", systemImage: "archivebox.fill")
                }
            }
        }
        .onAppear {
            strIngredient = ingredient.strIngredient

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
                Text("Redigere ingrediens")
            }
            
            ToolbarItem(placement: .confirmationAction)
            {
                Button("Lagre")
                {
                    ingredient.strIngredient = strIngredient
                    
                    dismiss()
                }
                .disabled(strIngredient.isEmpty)
            }
        }
        .navigationBarBackButtonHidden()
    }
}
