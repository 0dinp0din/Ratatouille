import SwiftUI

struct AreaAdd: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State var strArea: String = ""
    @State var countryCode: String = ""
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Navn på landområde", text: $strArea)
                TextField("Landskode (F.eks \"NO\")", text: $countryCode)
                
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
                  Text("Nytt landsområde")
                }
                
                ToolbarItem(placement: .confirmationAction)
                {
                  Button("Lagre")
                  {
                    let area = AreaModel()
                    
                      area.strArea = strArea
                      area.countryCode = countryCode.uppercased()
                      context.insert(area)
                      dismiss()
                      
                  }
                }
            }
        }
    }
}

#Preview
{
  AreaAdd(strArea: "", countryCode: "")
}
