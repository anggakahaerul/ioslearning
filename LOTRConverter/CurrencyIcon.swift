//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by ITBCA on 08/09/25.
//

import SwiftUI

struct CurrencyIcon: View {
    var CurrencyCoin: ImageResource
    var CurrencyName: String

    var body: some View {

        ZStack{
            VStack{


                ZStack (alignment:.bottom){
                    //Currency image
                    Image(CurrencyCoin)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)


                    Text(CurrencyName)
                        .padding(3)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .background(.brown.opacity(0.75))

                    //Currency Name
                }
                .padding(3)
                .frame(width:100, height: 100)
                .background(.brown)
                .clipShape(.rect(cornerRadius:25))


            }}
    }
}

#Preview {
    CurrencyIcon(CurrencyCoin: .copperpenny, CurrencyName: "Yuhu")
}
