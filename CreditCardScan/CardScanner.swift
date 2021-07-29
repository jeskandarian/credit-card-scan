
import Foundation
import SwiftUI
import CardScan

struct CardScanner: UIViewControllerRepresentable{
    @Binding var simpleCreditCardInfo: SimpleCreditCardInfo?
    @Environment(\.presentationMode) var presentationMode
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> CardScan.ScanViewController  {
        let vc =  ScanViewController.createViewController(withDelegate: context.coordinator)!
        
        return vc
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
        
        }
        
        func userDidScanCard(_ scanViewController: ScanViewController, creditCard: CreditCard) {
            let simpleCard = SimpleCreditCardInfo(ccNumber: creditCard.number)
            parent.simpleCreditCardInfo = simpleCard
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func userDidSkip(_ scanViewController: ScanViewController) {
            
        }
        
        
    }
}
