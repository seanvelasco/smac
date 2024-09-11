//
//  HomeView.swift
//  smac
//
//  Created by Sean Velasco on 9/11/24.
//

import SwiftUI


struct CardCarouselView: View {
    var cards: [AdvantageCard] = []
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 24) {
                ForEach(cards, id: \.self) { card in
                    AdvantageCardView()
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .contentMargins(34, for: .scrollContent)
//        .contentMargins(.horizontal, 34)
    }
}

struct PointsPreview: View {
    var cards: [AdvantageCard] = []
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(cards, id: \.self) { card in
                    AdvantageCardView()
                    HStack {
                        
                    }
                }
            }
            .padding([.top, .bottom])
            .frame(maxWidth: .infinity)
        }
    }
}

struct CardPreviewSheetView: View {
    var card: AdvantageCard
    var body: some View {
        Section {
            Text("\(card.cardNumber)")
        } header: {
            Text("Card number")
        } footer: {
            Text("Valid Until")
        }
    }
}

struct HomeView: View {
    private var cards: [AdvantageCard] = [
        AdvantageCard(
            id: 8880_8771_9936_4121,
            cardNumber: 8880_8771_9936_4124, tier: AdvantageCardTier.regular, pointsValue: 80.18, spendValue: 36_000),
        AdvantageCard(
            id: 8880_8771_9936_4122,
            cardNumber: 8880_8771_9936_4124, tier: AdvantageCardTier.regular, pointsValue: 80.18, spendValue: 36_000),
        AdvantageCard(
            id: 8880_8771_9936_4123,
            cardNumber: 8880_8771_9936_4124, tier: AdvantageCardTier.regular, pointsValue: 80.18, spendValue: 36_000),
        AdvantageCard(
            id: 8880_8771_9936_4124,
            cardNumber: 8880_8771_9936_4124, tier: AdvantageCardTier.regular, pointsValue: 80.18, spendValue: 36_000)
    ]
    @State private var points: Double = 0
    @State private var displayPointsPreview = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    CardCarouselView(cards: cards)
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.blue, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(String(format: "%.2f points", cards[0].pointsValue))
                        .foregroundStyle(.white)
                        .font(.title2)
                        .fontWeight(.medium)
                }
                ToolbarItem {
                    Button {
                        displayPointsPreview = true
                    } label: {
                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .sheet(isPresented: $displayPointsPreview) {
//            PointsPreview(cards: cards)
            CardPreviewSheetView(card: cards[0])
                .presentationDetents([.height(700)])
//                .presentationCornerRadius(0)
                .presentationDragIndicator(.visible)
//                .interactiveDismissDisabled(true)
        }
    }
}

#Preview {
    HomeView()
}
