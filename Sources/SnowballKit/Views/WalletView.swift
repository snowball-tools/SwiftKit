//
//  WalletView.swift
//  
//
//  Created by Vivian Phung on 5/4/23.
//

import SwiftUI

struct WalletView: View {
    @State private var address = "your_ethereum_address_here"
    @State private var tokens = [Token]()
    @State private var selectedCurrency = "USD"
    @State private var exchangeRates = [String: Double]()
    
    var body: some View {
        VStack {
            Text("Wallet Address: \(address)")
            
            Picker("Currency", selection: $selectedCurrency) {
                ForEach(exchangeRates.keys.sorted(), id: \.self) { currency in
                    Text(currency).tag(currency)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .onAppear(perform: fetchExchangeRates)
            
            List(tokens) { token in
                TokenRow(token: token, selectedCurrency: selectedCurrency, exchangeRate: exchangeRates[selectedCurrency] ?? 1)
            }
            .onAppear(perform: fetchTokens)
        }
    }
    
    func fetchTokens() {
        // Implement your function to fetch the tokens for the given address
    }
    
    func fetchExchangeRates() {
        // Implement your function to fetch the exchange rates for various currencies
    }
}

struct TokenRow: View {
    var token: Token
    var selectedCurrency: String
    var exchangeRate: Double
    
    var body: some View {
        HStack {
            Text(token.symbol)
            Spacer()
            Text("\(token.balance) \(token.symbol)")
            Text("\(token.valueInUSD * exchangeRate, specifier: "%.2f") \(selectedCurrency)")
        }
    }
}

struct Token: Identifiable {
    let id: Int
    let symbol: String
    let balance: Double
    let valueInUSD: Double
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
