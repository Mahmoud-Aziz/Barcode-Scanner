//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Mahmoud Aziz on 25/08/2023.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
  @Binding var scannedCode: String
  @Binding var alertItem: AlertItem?
  
  func makeUIViewController(context: Context) -> ScannerVC {
    ScannerVC(scannerDelegate: context.coordinator)
  }
  
  func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
  
  func makeCoordinator() -> ScannerCoordinator {
    ScannerCoordinator(scannerView: self)
  }
}
