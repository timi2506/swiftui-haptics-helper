import SwiftUI
import HapticEase

struct ContentView: View {
    @State private var HapticID: String = "Play a Haptic"
    @State private var showShareMenu: Bool = false


    var body: some View {
                    TabView {
                        HapticsView()
                            .tabItem {
                                Label("Haptics", systemImage: "iphone.radiowaves.left.and.right")
                            }
                        
                        InstructionsView()
                            .tabItem {
                                Label("How to Add?", systemImage: "swift")
                            }
                    }
            
        }

    }

