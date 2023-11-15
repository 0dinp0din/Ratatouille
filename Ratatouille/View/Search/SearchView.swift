import SwiftUI

struct SearchView: View {
    @State private var recipes: [Recipe] = []
    
    @AppStorage("isDarkMode") private var darkMode = false
    @State private var selectedButtonIndex: Int = 0
    private let buttonIcons = ["square", "circle", "triangle", "star"]
    
    var body: some View {
        NavigationStack {
            Group {
                
                List {
                    ForEach(recipes) { recipe in
                        ResultRow(recipe)
                    }
                }
            }
            .navigationTitle("Søk")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Picker(selection: $selectedButtonIndex, label: Text("")) {
                            ForEach(0..<4) { index in
                                Image(systemName: buttonIcons[index]).tag(index)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    }
                }
            }
            
            
            
        }
        
    }
}

#Preview {
    SearchView()
}
