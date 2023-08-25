//
//  ScannerCoordinator.swift
//  BarcodeScanner
//
//  Created by Mahmoud Aziz on 25/08/2023.
//

import Foundation

// MARK: - ScannerCoordinator
final class ScannerCoordinator: NSObject, ScannerVCDelegate {
  private let scannerView: ScannerView
  
  init(scannerView: ScannerView) {
    self.scannerView = scannerView
  }
  
  func didFind(barcode: String) {
    scannerView.scannedCode = barcode
  }
  
  func didSurface(error: CameraError) {
    switch error {
    case .invalidDeviceInput:
      scannerView.alertItem = AlertContext.invalidDeviceInput
    case .invalidScannedValue:
      scannerView.alertItem = AlertContext.invalidScannedType
    }
  }
}
