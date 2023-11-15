import SwiftUI

struct SearchView: View {
    @State private var recipes: [Recipe] = []
    
    @AppStorage("isDarkMode") private var darkMode = false
    @State private var selectedButtonIndex: Int = 5
    private let buttonIcons = ["globe", "rectangle.3.group.bubble", "carrot.fill", "magnifyingglass"]
    @State var showSheet = false
    
    var body: some View {
        NavigationStack {
            Group {
                
                List {
                    ForEach(recipes) { recipe in
                        
                        NavigationLink(destination: ResultView(recipe)) {
                            ResultRow(recipe)
                        }
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
                        .onChange(of: selectedButtonIndex) {
                            showSheet = true
                        }
                        .sheet(isPresented: $showSheet,onDismiss: {showSheet = false}, content: {
                            SearchModal(selectedButtonIndex: $selectedButtonIndex, updateData: { recipes in
                                self.recipes = recipes
                            }).presentationDetents([.medium]).presentationDragIndicator(.visible)
                            })
                    }
                }
            }
            
        }
    }
}

#Preview {
    SearchView()
}
