import SwiftUI
import HapticEase

struct HapticsView: View {
    @State private var HapticID: String = "Play a Haptic First!"
    @State private var showShareMenu: Bool = false
    @State private var isShowingSheet: Bool = false
    
    
    var body: some View {
        VStack {
            List {
                Section ("Haptics") {
                    Button("Play Success Haptic") {
                        HapticFeedback()
                            .success()
                        HapticID = ".success()"
                    }
                    Button("Play Pulse Haptic") {
                        HapticFeedback()
                            .pulsePattern()
                        HapticID = ".pulsePattern()"
                    }
                    Button("Play Earthquake Haptic") {
                        HapticFeedback()
                            .earthquakePattern()
                        HapticID = ".earthquakePattern()"
                        
                    }
                    Button("Play Heartbeat Haptic") {
                        HapticFeedback()
                            .heartbeatPattern()
                        HapticID = ".heartbeatPattern()"
                        
                    }
                    Button("Play Echo Haptic") {
                        HapticFeedback()
                            .echoPattern()
                        HapticID = ".echoPattern()"
                        
                    }
                    Button("Play SOS Haptic") {
                        HapticFeedback()
                            .sosSignalPattern()
                        HapticID = ".sosSignalPattern()"
                        
                    }
                    Button("Play Ripple Haptic") {
                        HapticFeedback()
                            .rippleEffectPattern()
                        HapticID = ".rippleEffectPattern()"
                        
                    }
                    Button("Play Error Haptic") {
                        HapticFeedback()
                            .error()
                        HapticID = ".error()"
                    }
                    
                    Button("Play Warning Haptic") {
                        HapticFeedback()
                            .warning()
                        HapticID = ".warning()"
                    }
                    Button("Play Selection Haptic") {
                        HapticFeedback()
                            .selection()
                        HapticID = ".selection()"
                    }
                    Button("Play Light Impact Haptic") {
                        HapticFeedback()
                            .light()
                        HapticID = ".light()"
                    }
                    Button("Play Medium Impact Haptic") {
                        HapticFeedback()
                            .medium()
                        HapticID = ".medium()"
                    }
                    Button("Play Heavy Impact Haptic") {
                        HapticFeedback()
                            .heavy()
                        HapticID = ".heavy()"
                    }
                    Button("Play Custom Light Haptic") {
                        HapticFeedback()
                            .customLightPattern()
                        HapticID = ".customLightPattern()"
                    }
                    
                    Button("Play Light and Medium Haptic") {
                        HapticFeedback()
                            .lightAndMediumPattern()
                        HapticID = ".lightAndMediumPattern()"
                    }
                    
                    Button("Play Heavy and Warning Haptic") {
                        HapticFeedback()
                            .heavyAndWarningPattern()
                        HapticID = ".heavyAndWarningPattern()"
                    }
                    
                    Button("Play Tension and Release Haptic") {
                        HapticFeedback()
                            .tensionAndReleasePattern()
                        HapticID = ".tensionAndReleasePattern()"
                    }
                    
                    Button("Play Double Selection Haptic") {
                        HapticFeedback()
                            .doubleSelectionPattern()
                        HapticID = ".doubleSelectionPattern()"
                    }
                    
                    Button("Play Complex Feedback Haptic") {
                        HapticFeedback()
                            .complexFeedbackPattern()
                        HapticID = ".complexFeedbackPattern()"
                    }
                    
                    Button("Play Chain Reaction Haptic") {
                        HapticFeedback()
                            .chainReactionPattern()
                        HapticID = ".chainReactionPattern()"
                    }
                }
            }
            
            Form {
                Section ("Haptic ID (Tap to copy or share)") {
                    Menu (HapticID){
                        ShareLink(item: HapticID) {
                            Label("Share Haptic ID", systemImage: "square.and.arrow.up")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        Button (action: {
                            UIPasteboard.general.string = HapticID
                            HapticFeedback()
                                .success()
                        }) {
                            HStack {
                                Text ("Copy Haptic ID")
                                Image (systemName: "doc.on.doc")
                            }
                        }
                    }
                    Button ("Create Haptic Code") {
                        isShowingSheet = true
                    }
                }
                
            }
            .frame(height: 150)
            .scrollDisabled(true)
            .sheet(isPresented: $isShowingSheet){
                CreateHapticCode(HapticID: $HapticID)
            }
        }
    }
}
