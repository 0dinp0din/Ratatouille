import SwiftUI
import SwiftData

@main
struct RatatouilleApp: App {
    @State var isSplash = true
    @AppStorage("firstLaunch") private var firstLaunch = true
    
    let modelContainer: ModelContainer
    
    init() {
        do {
            modelContainer = try ModelContainer(for: CategoryModel.self, AreaModel.self, RecipeModel.self, IngredientModel.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            
            if isSplash {
                SplashView(splash: $isSplash)
            }
            else {
                MainView()
            }
        }.modelContainer(modelContainer)
    }
}
