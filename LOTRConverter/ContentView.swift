//
//  ContentView.swift
//  LOTRConverter
//
//  Created by ITBCA on 28/08/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
// view user interface (protocol rules that have to follow)
// contentview conform to view, represent user interface
// implement required body to th

    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    @State var showExchangeInfo : Bool = false
    @State var showSelectCurrency : Bool = false

    @FocusState var leftTyping
    @FocusState var rightTyping

    @State var leftCurrency = Currency.silverPiece
    @State var rightCurrency =  Currency.goldPiece
    //property show exchange instead of the view
    var body: some View {
        ZStack{
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack{
                //image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)

                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                HStack{

                    VStack{

                        HStack{
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)

                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)


                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            print(showSelectCurrency)
                        }

                        TextField("Left Amount",text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .onChange(of: leftAmount){
                                if leftTyping
                                {
                                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                                }
                            }


                    }
                    Image(systemName: "equal")
                        .foregroundStyle(.white)
                    // Equal Sign
                    VStack
                    {

                        HStack{
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)

                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }

                        TextField("Right Amount",text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .onChange(of: rightAmount) { leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                            }
                        //Coin section
                    }

                }.padding()
                    .background(.black.opacity(0.5))
                    .clipShape(.capsule)

                Spacer()
                //input
                //button

                Button{
                    showExchangeInfo.toggle()
// print("show Exchange Info Value: \(showExchangeInfo)")




                } label: {
                    Image(systemName: "info.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
                .padding(.trailing)
                .sheet(isPresented: $showExchangeInfo) {
                    ExchangeInfo()
                }
            }
            .sheet(isPresented: $showSelectCurrency){
                SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
            }
        }
    }

}

#Preview {
    ContentView()
}

//when we talk about how we organized or code and project


