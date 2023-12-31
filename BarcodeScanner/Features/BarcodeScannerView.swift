//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Mahmoud Aziz on 17/08/2023.
//

import SwiftUI

struct BarcodeScannerView: View {
  @StateObject var viewModel = BarcodeScannerViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        ScannerView(scannedCode: $viewModel.scannedCode,
                    alertItem: $viewModel.alertItem)
        .frame(maxWidth: .infinity, maxHeight: 300)
        
        Spacer()
          .frame(height: 60)
        
        Label("Scanned barcode:",
              systemImage: "barcode.viewfinder")
        .font(.title)
        .fontWeight(.semibold)
        .padding()
        
        Text(viewModel.statusText)
          .font(.largeTitle)
          .bold()
          .foregroundColor(viewModel.statusTextColor)
        
      }.navigationTitle("Barcode Scanner")
        .alert(item: $viewModel.alertItem) { alertItem in
          Alert(title: Text(alertItem.title),
                message: Text(alertItem.message),
                dismissButton: alertItem.dismissButton)
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    BarcodeScannerView()
      .preferredColorScheme(.dark)
  }
}
