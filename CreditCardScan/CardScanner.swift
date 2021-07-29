
import Foundation
import SwiftUI
import CardScan

struct CardScanner: UIViewControllerRepresentable{

    var cardAdder: CardAdder
    @Environment(\.presentationMode) var presentationMode
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> CardScan.ScanViewController  {
        ScanViewController.createViewController(withDelegate: context.coordinator)!
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, CardScan.ScanDelegate {
        var parent: CardScanner
        
        init(_ parent: CardScanner){
            self.parent = parent
        }
        
        func userDidCancel(_ scanViewController: ScanViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func userDidScanCard(_ scanViewController: ScanViewController, creditCard: CreditCard) {
            let simpleCard = SimpleCreditCardInfo(ccNumber: creditCard.number)
            parent.cardAdder.addCard(simpleCard)
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func userDidSkip(_ scanViewController: ScanViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        
    }
}
