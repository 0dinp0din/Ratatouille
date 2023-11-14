import SwiftUI

struct CategoryEdit: View
{
    @Bindable var category: CategoryModel
    
    init(_ category: CategoryModel) {
        self.category = category
    }
    
    @Environment(\.dismiss) private var dismiss
    
    @State var strCategory: String = ""
    @State var strCategoryThumb: String = ""
    @State var strCategoryDescription: String = ""
    
    var body: some View {
        Form {
            TextField("Navn", text: $strCategory)
            TextField("Url til bilde", text: $strCategoryThumb)
            TextField("Beskrivelse", text: $strCategoryDescription)
            
            Section
            {
                Button(role: .destructive) {
                    category.archiveDate = .now
                    category.trash = true
                    dismiss()
                }
            label:
                {
                    Label("Arkiver kategori", systemImage: "archivebox.fill")
                }
            }
        }
        .onAppear {
            strCategory = category.strCategory
            strCategoryThumb = category.strCategoryThumb
            strCategoryDescription = category.strCategoryDescription
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
                Text("Redigere kategori")
            }
            
            ToolbarItem(placement: .confirmationAction)
            {
                Button("Lagre")
                {
                    category.strCategory = strCategory
                    category.strCategoryThumb = strCategoryThumb
                    category.strCategoryDescription = strCategoryDescription
                    
                    dismiss()
                }
                .disabled(strCategory.isEmpty)
            }
        }
        .navigationBarBackButtonHidden()
    }
}
