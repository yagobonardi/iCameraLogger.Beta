import SwiftUI
import Cocoa
import Foundation

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: startLogger){
                Text("start logger")
            }
        }
        .padding()
    }
}

func startLogger() {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/bin/bash")
    let commandToRun = "log stream --predicate 'eventMessage contains \"FaceTime HD\"'"
    process.arguments = ["-c", commandToRun]

    do {
        try process.run()
        process.waitUntilExit()
    } catch {
        print("Erro ao executar o comando: \(error)")
    }
}

#Preview {
    ContentView()
}
