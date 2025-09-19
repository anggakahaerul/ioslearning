 //
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by ITBCA on 08/09/25.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency : Currency
    //Scope
    var body: some View {
        //CurrencyIcon
        LazyVGrid (columns: [GridItem(), GridItem(),GridItem()]){
            ForEach(Currency.allCases) { currency in

                if self.currency == currency {
                    CurrencyIcon(CurrencyCoin: currency.image, CurrencyName: currency.name)
                        .shadow(color : .black, radius: 10)
                        .overlay{
                            RoundedRectangle(
                                cornerRadius: 25
                            )
                            .stroke(lineWidth: 3)
                            .opacity(0.5)
                        }
                }
                else {
                    CurrencyIcon(CurrencyCoin: currency.image, CurrencyName: currency.name)
                        .onTapGesture {
                            self.currency = currency
                            print("IconGrid Currency : \(self.currency)")
                        }
                }
            }
        }

    }
}

#Preview {
    @Previewable @State var currency : Currency = .copperPenny
    IconGrid(currency: $currency)
}
