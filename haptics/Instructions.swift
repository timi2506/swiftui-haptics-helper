import SwiftUI
import HapticEase
import AVKit
struct InstructionsView: View {
    @State private var PackageURL: String = "https://github.com/emreeilhan/HapticEase.git"
    @Environment(\.openURL) var openURL
    @State private var showVideoSheet: Bool = false
    @State private var showNotification = false
    
    
    var body: some View {
        VStack {
            List {
                Section("Step 1") {
                    Text("Add the \"HapticEase\" Swift Package to your Project as a Package dependency using the link below (Press and hold to Copy or Share)")
                    Text(PackageURL)
                        .padding(.horizontal)
                        .onTapGesture {
                            openURL(URL(string: "https://github.com/emreeilhan/HapticEase.git")!)
                        }
                        .contextMenu {
                            let copyshareURL = URL(string: PackageURL)
                            ShareLink(item: copyshareURL!) {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }
                            Button(action: {
                                UIPasteboard.general.url = copyshareURL
                                HapticFeedback()
                                    .success()
                            }) {
                                HStack {
                                    Text("Copy")
                                    Image(systemName: "doc.on.doc")
                                }
                            }
                        }
                        .padding()
                        .frame(height: 40) // Set height to mimic a textbox
                        .background(Color(UIColor.systemGray6)) // White background like a text field
                        .cornerRadius(8) // Rounded corners
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.25), lineWidth: 1) // Subtle border
                        )
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1) // Optional shadow for depth
                        .foregroundColor(.primary) // Text color
                        .font(.body) // Text style
                    Button("Show Video Tutorial", systemImage: "arrow.up.left.and.arrow.down.right") {
                        showVideoSheet = true
                    }
                    
                }
                Section("Step 2") {
                    Text("Go to the \"Haptics\" Tab in the App and try out the Haptics")
                    Text("If you like one of the Haptics, tap it and then either manually make a Haptic Action for it using the HapticEase Documentation on GitHub")
                }
                Section("OR") {
                    Text("Press \"Create Haptic Code\" to Show, and Copy or Share Code with ease!, the Button Code is just a Button with the Label \"Play Haptic\" that has the HapticFeedback Action already as an action, the Haptic Code has just the HapticFeedback Action Code for the Haptic you selected for use in for example Functions or onTapGestures")
                }
            }
            // Some Sheet functionality such as Notif Overlay were made by GPT
            .sheet(isPresented: $showVideoSheet, onDismiss: {
                showNotification = false // Hide notification when sheet is dismissed
            }) {
                ZStack {
                    // Video Player
                    let videoURL = Bundle.main.url(forResource: "tutorial1", withExtension: "mov")
                    VideoPlayer(player: AVPlayer(url: videoURL!))
                        .cornerRadius(10)
                        .ignoresSafeArea()
                    
                    // Notification Overlay
                    if showNotification {
                        Text("Rotate your device to Landscape for the best experience!")
                            .padding()
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .transition(.opacity) // Smooth transition
                            .padding()
                            .onAppear {
                                // Hide notification after 3 seconds
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                    withAnimation {
                                        showNotification = false
                                    }
                                }
                            }
                    }
                }
                .onAppear {
                    // Show the notification when the sheet appears
                    withAnimation {
                        showNotification = true
                    }
                }
            }
        }
    }
}
