//
//  AdvantageCardModel.swift
//  smac
//
//  Created by Sean Velasco on 9/11/24.
//

import Foundation

let REQUIRED_PRESTIGE_SPEND_AMOUNT = 150_000.00

enum AdvantageCardTier {
    case start, regular, prestige
}

struct AdvantageCard: Identifiable, Hashable {
    var id: Int
    var cardNumber: Int
    var tier: AdvantageCardTier
    var pointsValue: Double
    var spendValue: Double
}
