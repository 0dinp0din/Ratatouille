import SwiftUI
import SwiftData

struct AreaView: View {
    @AppStorage("isDarkMode") var darkMode = false
    
    @Query(filter: #Predicate<AreaModel>{$0.trash == false}) private var areas: [AreaModel]
    
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            Group {
                if areas.isEmpty {
                    ContentUnavailableView("Ingen landområder", systemImage: "square.stack.3d.up.slash")
                } else {
                    List {
                        ForEach(areas) { area in
                            NavigationLink(destination: AreaEdit(area)) {
                                AreaRow(area)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Landområder")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button
                    {
                      showSheet.toggle()
                    }
                    label:
                    {
                        Label("Nytt landområde", systemImage: "plus.circle.fill")
                    }
                }
            }
            .sheet(isPresented: $showSheet)
            {
              AreaAdd()
            }
        }
        .environment(\.colorScheme, darkMode ? .dark : .light)
    }
}

#Preview {
    AreaView().modelContainer(for: AreaModel.self)
}
