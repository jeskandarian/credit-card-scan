

import Foundation
import CardScan
import CreditCardScanner

struct SimpleCreditCardInfo: Identifiable{
    let id = UUID()
    var exipiration: String {
        get{
            guard let year = expirationYear,  let month = expirationMonth else {
                return ""
            }
            return "\(String(format: "%02d", month))/\(year)"
        }
    }
    var ccNumber: String
    var expirationYear: Int?
    var expirationMonth: Int?
    var cardholderName: String?
}

extension SimpleCreditCardInfo{
    init(creditCard: CardScan.CreditCard){
        self.ccNumber = creditCard.number
        
        if let year = Int(creditCard.expiryYear ?? ""){
            self.expirationYear = year
        }
        if let month = Int(creditCard.expiryMonth ?? "") {
            self.expirationMonth = month
        }
        cardholderName = creditCard.name
    }
    
    init(creditCard: CreditCardScanner.CreditCard){
        ccNumber = creditCard.number ?? ""
        cardholderName = creditCard.name
        if let month = creditCard.expireDate?.month {
            expirationMonth = month
        }
        
        if let year = creditCard.expireDate?.year {
            self.expirationYear = year
        }
    }
}
