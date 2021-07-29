

import Foundation

struct SimpleCreditCardInfo: Identifiable{
    let id = UUID()
    
    var ccNumber: String
    var expirationYear: Int?
    var expirationMonth: Int?
    var cardholderName: String?
}

