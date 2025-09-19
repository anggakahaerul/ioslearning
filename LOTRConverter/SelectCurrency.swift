//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by ITBCA on 08/09/25.
//

import SwiftUI

struct SelectCurrency: View {

    @Binding var topCurrency : Currency
    @Binding var bottomCurrency : Currency
    @Environment(\.dismiss) var dismiss
    //Scope

    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Select the curency you are starting with"
                )
                .fontWeight(.bold)


                IconGrid(currency: $topCurrency)

                Text("Select the curency you would like to convert too"
                ).fontWeight(.bold )

                IconGrid(currency: $bottomCurrency)

                Button ("Done"){dismiss()}
                    .buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
            }.foregroundStyle(.black)
        }.onTapGesture {
            print("Selected Top Currency \(topCurrency)")
            print("Selected Bottom Currency \(bottomCurrency)")
        }
    }
    }


#Preview {
    @Previewable @State var topCurrency : Currency = .silverPenny
    @Previewable @State var bottomCurrency : Currency = .goldPenny
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}
