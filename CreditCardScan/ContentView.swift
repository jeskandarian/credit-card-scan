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
                List{
                    Section(header: Text("Credit cards")){
                        ForEach(creditCards){ creditCard in
                            CreditCardRow(creditCard: creditCard)
                        }
                        .onDelete { indexSet in
                            print("index \(indexSet.startIndex.description)")
                            if let index = indexSet.first {
                                print("removing index \(index)")
                                creditCards.remove(at: index)
                            } else {
                                print("invalid index")
                            }
                        }
                    }
                }
                    .padding()

                NavigationLink(destination: CardScanner(cardAdder:  self)){
                    Text("Add using CardScan")
                }
                NavigationLink(destination: YhkaplanCreditCardScanner(cardAdder: self)){
                    Text("Add using Yhkaplan CreditCardScanner")
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
