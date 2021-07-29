//
//  ContentView.swift
//  CreditCardScan
//
//  Created by Jay Eskandarian on 7/28/21.
//

import SwiftUI
import CardScan

struct ContentView: View {
    @State private var showingCardScanner = false
    @State private var simpleCreditCardInfoInput: SimpleCreditCardInfo?
    
    func loadNewSimpleCreditCardInfo(){
        guard let cc =  simpleCreditCardInfoInput else {return}
        print("add new creditcard \(cc.ccNumber)")
        simpleCreditCardInfoInput = nil
    }
    
    
    var body: some View {
        VStack{
            Text("Hello, world!")
                .padding()
            
            Button("New with CardScan") {
                self.showingCardScanner = true
            }
            NavigationLink("nav to cardscan", destination: CardScanner(simpleCreditCardInfo: self.$simpleCreditCardInfoInput)) 
        }
        .sheet(isPresented: $showingCardScanner, onDismiss: loadNewSimpleCreditCardInfo) {
            CardScanner(simpleCreditCardInfo: self.$simpleCreditCardInfoInput)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
