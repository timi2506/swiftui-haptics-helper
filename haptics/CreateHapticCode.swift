import SwiftUI
import Splash
import WebKit

// The code Block functionality in this file was made with the help of ChatGPT

struct CreateHapticCode: View {
    @Environment(\.openURL) var openURL
    @Binding var HapticID: String
    var HapticButtonCode: String {
        """
        Button("Play Haptic") {
            HapticFeedback()
                \(HapticID)
        }
        """
    }
    var HapticCode: String {
        """
        HapticFeedback()
                \(HapticID)
        """
    }
    var HapticButtonCodeExample: String {
        """
        import SwiftUI
        import HapticEase

        struct ContentView: View {
            var body: some View {
                VStack {
                        Button("Play Haptic") {
                            HapticFeedback()
                                \(HapticID)
                            }
                }
            }
        }
        """
    }

    var body: some View {
        
        List {
            Section ("Button Code"){
            
                // Show the HTML content inside the WebView
                WebView(htmlContent: highlightCode(HapticButtonCode))
                    .edgesIgnoringSafeArea(.all)
            
            .cornerRadius(5) // Rounded corners for the VStack
            .frame(height: 70) // Limit the maximum width of the VStack
            
            Button("Copy Button Code"){
                UIPasteboard.general.string = HapticButtonCode
            }
        }
            Section ("Haptic Code"){
           
                // Show the HTML content inside the WebView
                WebView(htmlContent: highlightCode(HapticCode))
                    .edgesIgnoringSafeArea(.all)
            
            .cornerRadius(5) // Rounded corners for the VStack
            .frame(height: 55) // Limit the maximum width of the VStack
            
            Button("Copy Haptic Code"){
                UIPasteboard.general.string = HapticCode
            }
                
        }
            Section("Example Usage") {
                // Show the HTML content inside the WebView
                WebView(htmlContent: highlightCode(HapticButtonCodeExample))
                    .edgesIgnoringSafeArea(.all)
            
            .cornerRadius(5) // Rounded corners for the VStack
            .frame(height: 215) // Limit the maximum width of the VStack
            
            Button("Copy Example Code"){
                UIPasteboard.general.string = HapticButtonCodeExample
            }
                
        }
            Section("Custom"){
                Button("Open GitHub Wiki"){
                    openURL(URL(string: "https://github.com/emreeilhan/HapticEase/wiki")!)
                }
            }
    }
        
    }
    // Function to highlight the code using Splash
        private func highlightCode(_ code: String) -> String {
            // Initialize the highlighter with HTML output format
            let highlighter = SyntaxHighlighter(format: HTMLOutputFormat())
            
            // Highlight the code using the highlighter
            let highlightedCode = highlighter.highlight(code)
            
            // Embed CSS for syntax highlighting in the HTML
            return embedCSSInHTML(highlightedCode)
        }
    private func embedCSSInHTML(_ highlightedCode: String) -> String {
        let css = """
        <style>
            body {
                font-family: 'Courier New', Courier, monospace;
                margin: 0;
                padding: 0;
                background-color: #1E1E1E;
            }

            pre {
                padding: 16px;
                margin: 0;
                background-color: #2D2D2D;
                color: #D4D4D4;
                border-radius: 8px;
                overflow-x: auto;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                font-size: 30px; /* Increase the font size */
                line-height: 1.4; /* Adjust line height for better readability */
            }

            /* Syntax highlighting styles */
            .keyword { color: #569cd6; font-weight: bold; }
            .string { color: #d69d85; }
            .type { color: #4ec9b0; font-style: italic; }
            .comment { color: #6a9955; font-style: italic; }
            .function { color: #dcdcaa; font-weight: bold; }
            .number { color: #b5cea8; }

            pre::-webkit-scrollbar {
                height: 8px;
            }
            pre::-webkit-scrollbar-thumb {
                background-color: #555;
                border-radius: 4px;
            }
            pre::-webkit-scrollbar-track {
                background-color: #333;
            }

            @media (max-width: 600px) {
                pre {
                    padding: 12px;
                    font-size: 16px; /* Slightly smaller font size for small screens */
                }
            }
        </style>
        """
        
        return """
        <html>
        <head>
            \(css)
        </head>
        <body>
            <pre>\(highlightedCode)</pre>
        </body>
        </html>
        """
    }
}

// WKWebView wrapper for displaying HTML content
struct WebView: UIViewRepresentable {
    var htmlContent: String

    func makeUIView(context: Context) -> WKWebView {
        // Create the WKWebView instance
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Load the HTML content into the WebView
        uiView.loadHTMLString(htmlContent, baseURL: nil)
    }
}
