import SwiftUI
import shared

struct ContentView: View {
    @State private var showingAlert = false
	let greet = Greeting().greeting()

	var body: some View {
        VStack {
            Spacer()
            Text(greet)
            Spacer()
            Button("Crash - pass unfrozen object to another thread") {
                let unfrozenObject = Greeting().getUnfrozenObject()
                
                DispatchQueue.global().async {
                    let string = unfrozenObject.myString
                }
            }
            Spacer()
            Button("Bueno - pass frozen object to another thread") {
                let frozenObject = Greeting().getFrozenImmutableObject()
                
                DispatchQueue.global().async {
                    let string = frozenObject.myString
                    showingAlert = true
                }
            }
            Spacer()
            Button("Crash - Mutate frozen object") {
                Greeting().mutateFrozenMutableObject()
            }
            Spacer()
        }.alert("Bueno", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
