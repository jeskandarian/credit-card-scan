//
//  ContentView.swift
//  CreditCardScan
//
//  Created by Jay Eskandarian on 7/28/21.
//

import SwiftUI
import CardScan

protocol CardAdder{
    mutating func addCard(_ simpleCreditCardInfo: SimpleCreditCardInfo)
}


struct ContentView: View, CardAdder {
    @State private var showingCardScanner = false
    @State var creditCards: [SimpleCreditCardInfo] = [
        SimpleCreditCardInfo(ccNumber: "0123"),
        SimpleCreditCardInfo(ccNumber: "0456")
    ]
    
    mutating func addCard(_ simpleCreditCardInfo: SimpleCreditCardInfo){
        print("add new creditcard \(simpleCreditCardInfo.ccNumber)")
        if(creditCards.filter{$0.ccNumber == simpleCreditCardInfo.ccNumber}.count > 0){
            print("credit card already exists")
            return
        }
        creditCards.append(simpleCreditCardInfo)
        print("creditCard list size: \(self.creditCards.count)")
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                List(creditCards){creditCard in
                    CreditCardRow(creditCard: creditCard)
                }
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
