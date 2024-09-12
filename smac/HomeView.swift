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
            .padding(.vertical)
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

struct ShortcutView: View {
    var image: String
    var text: String
    var body: some View {
        Button {
            
        } label: {
            VStack {
                Image(systemName: image)
                    .padding()
                    .background(.tertiary)
                    .clipShape(.circle)
                Text(text)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(maxWidth: 65)
            }
        }
    }
}

struct ShortcutsViwe: View {
    var body: some View {
        HStack(alignment: .top) {
            Spacer()
            ShortcutView(image: "cart", text: "Shop")
            Spacer()
            ShortcutView(image: "tag", text: "Vouchers")
            Spacer()
            ShortcutView(image: "arrow.up.arrow.down", text: "Transfer")
            Spacer()
            ShortcutView(image: "clock", text: "History")
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct PerkCardView: View {
    let imageUrl = URL(string: "")
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
            } placeholder: {
                EmptyView()
            }
            VStack(alignment: .leading) {
                Text("10% Off".uppercased())
                    .bold()
                Text("Until Octover 31")
                    .font(.caption)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 165, height: 225, alignment: .bottom)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(.separator, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct PerksPreviewView: View {
    //    let columns: [GridItem] = [
    //        GridItem(.flexible(), spacing: 12),
    //        GridItem(.flexible(), spacing: 12)
    //    ]
    var body: some View {
        Section {
            ForEach(0..<3) { perks in
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 12) {
                            ForEach(0..<10, id: \.self) { character in
                                PerkCardView()
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .contentMargins(24, for: .scrollContent)
                } header: {
                    Text("Food Perks")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                }
            }
        } header: {
            Text("Members Only Perks")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
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
                    Divider()
                    Group {
                        ShortcutsViwe()
                            .padding()
                        PerksPreviewView()
                            .padding(.bottom)
                    }
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
