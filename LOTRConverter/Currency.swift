//
//  Currency.swift
//  LOTRConverter
//
//  Created by ITBCA on 09/09/25.
//
import Foundation
import SwiftUI

enum Currency : Double, CaseIterable, Identifiable {

    case copperPenny = 6400 ,
         silverPenny = 64,
         silverPiece = 16,
         goldPiece = 4,
         goldPenny = 1

    var id: Currency { self }

    var image: ImageResource {
        switch self {
        case .copperPenny: .copperpenny
        case .silverPenny: .silverpenny
        case .silverPiece: .silverpiece
        case .goldPiece: .goldpiece
        case .goldPenny: .goldpenny
        }
    }

    var name: String {
        switch self {
        case .copperPenny: "Copper Penny"
        case .silverPenny: "Silver Penny"
        case .silverPiece: "Silver Piece"
        case .goldPenny: "Gold Penny"
        case .goldPiece: "Gold Piece"
        }
    }


    func convert(_ amountString: String, to currency: Currency)-> String {
        guard let doubleAmount = Double(amountString) else {
            return ""
        }

        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        return String(convertedAmount)
    }
}
