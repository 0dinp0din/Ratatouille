import SwiftUI

struct AreaEdit: View
{
    @Bindable var area: AreaModel
    
    init(_ area: AreaModel) {
        self.area = area
    }
    
    @Environment(\.dismiss) private var dismiss
    
    @State var strArea: String = ""
    @State var countryCode: String = ""

    
    var body: some View {
        Form {
            TextField("Navn på landområde", text: $strArea)
            TextField("Landskode (F.eks \"NO\")", text: $countryCode)
            
            Section
            {
                Button(role: .destructive) {
                    area.archiveDate = .now
                    area.trash = true
                    dismiss()
                }
            label:
                {
                    Label("Arkiver landområde", systemImage: "archivebox.fill")
                }
            }
        }
        .onAppear {
            strArea = area.strArea
            countryCode = area.countryCode

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
                Text("Redigere landområde")
            }
            
            ToolbarItem(placement: .confirmationAction)
            {
                Button("Lagre")
                {
                    area.strArea = strArea
                    area.countryCode = countryCode
                    
                    dismiss()
                }
                .disabled(strArea.isEmpty)
            }
        }
        .navigationBarBackButtonHidden()
    }
}
