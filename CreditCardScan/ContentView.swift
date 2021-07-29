//
//  ContentView.swift
//  CreditCardScan
//
//  Created by Jay Eskandarian on 7/28/21.
//

import SwiftUI
import CardScan

protocol CardAdder{
    func addCard(_ simpleCreditCardInfo: SimpleCreditCardInfo)
}


struct ContentView: View, CardAdder {
    @State private var showingCardScanner = false

    
    func addCard(_ simpleCreditCardInfo: SimpleCreditCardInfo){

        print("add new creditcard \(simpleCreditCardInfo.ccNumber)")

    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Hello, world!")
                    .padding()
                
                NavigationLink(destination: CardScanner(cardAdder:  self)){
                    Text("Add using CardScan")
                }
            }
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
