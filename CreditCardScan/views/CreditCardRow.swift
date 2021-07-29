//
//  CreditCardRow.swift
//  CreditCardScan
//
//  Created by Jay Eskandarian on 7/28/21.
//

import SwiftUI

struct CreditCardRow: View {
    let creditCard: SimpleCreditCardInfo
    var body: some View {
        Text(self.creditCard.ccNumber)
    }
}

struct CreditCardRow_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardRow(creditCard: SimpleCreditCardInfo(ccNumber: "1234"))
    }
}
