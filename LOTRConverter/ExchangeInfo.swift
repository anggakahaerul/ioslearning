//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by ITBCA on 08/09/25.
//

import SwiftUI

struct ExchangeInfo: View {


    @Environment(\.dismiss) var dismiss

//property wrap read values from view environment. exposed certain value that already built into our environment

    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                    .padding()

                Text("here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known curencies in the ntire world except one. We accept all major credit cards and have a wide range of currencies available. Below is a simple guide to our currency exchange rates")
                    .font(.title3)
                    .padding()
                ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)

                ExchangeRate(leftImage: .goldpenny, text: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpiece)

                ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                ExchangeRate(leftImage: .silverpenny, text: "1 Silver views: 100 Copper Pennies", rightImage: .copperpenny)



                // separate from each other, it has own unique instance
    // we can customize the data with property

                //which types of property need to be.

                Button("Done"){
                    dismiss()
                    //why parenthesis
                    //this property has value connected into it
                }
                    .buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)

            }.padding()
                .foregroundStyle(.black)

        }
    }
}

#Preview {
    ExchangeInfo()
}

