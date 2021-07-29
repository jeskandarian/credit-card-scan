import Foundation
import SwiftUI
import CreditCardScanner

struct YhkaplanCreditCardScanner: UIViewControllerRepresentable {
    var cardAdder: CardAdder
    @Environment(\.presentationMode) var presentationMode
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }

    func makeUIViewController(context: Context) -> CreditCardScannerViewController  {
        CreditCardScannerViewController(delegate: context.coordinator)
    
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, CreditCardScannerViewControllerDelegate {
        func creditCardScannerViewControllerDidCancel(_ viewController: CreditCardScannerViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didErrorWith error: CreditCardScannerError) {
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didFinishWith card: CreditCard) {
            let simpleCard = SimpleCreditCardInfo(creditCard: card)
            parent.cardAdder.addCard(simpleCard)
            parent.presentationMode.wrappedValue.dismiss()

        }
        
        var parent: YhkaplanCreditCardScanner

        init(_ parent: YhkaplanCreditCardScanner){
            self.parent = parent
        }
        
        
        

//        func userDidCancel(_ scanViewController: ScanViewController) {
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//
//        func userDidScanCard(_ scanViewController: ScanViewController, creditCard: CreditCard) {
//            let simpleCard = SimpleCreditCardInfo(creditCard: creditCard)
//            parent.cardAdder.addCard(simpleCard)
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//
//        func userDidSkip(_ scanViewController: ScanViewController) {
//            parent.presentationMode.wrappedValue.dismiss()
//        }


    }
}
