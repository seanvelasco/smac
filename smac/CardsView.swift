//
//  CardsView.swift
//  smac
//
//  Created by Sean Velasco on 9/11/24.
//

import SwiftUI
import CoreImage.CIFilterBuiltins


struct CreditCard<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.blue)
            .aspectRatio(1.58577250834, contentMode: .fill)
            .frame(minWidth: 323, minHeight: 204)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .shadow(radius: 8)
            .overlay(content)
    }
}

struct AdvantageCardView: View {
    var body: some View {
        CreditCard {
        }
        .frame(maxWidth: 323, maxHeight: 204)

    }
}

struct LinkAdvantageCardPlaceholderView: View {
    var body: some View {
        CreditCard {
            Label {
                Text("Link Existing Card")
            } icon: {
                Image(systemName: "plus")
            }
        }
        .frame(maxWidth: 323, maxHeight: 204)

    }
}

struct LinkAdvantageCardView: View {
    @State private var cardNumber = ""
    var body: some View {
        VStack {
            Text("What's your card number?")
            Text("You may link any existing card to consolidate all points under one account.")
            TextField("Enter 16-digit Card Number", text: $cardNumber)
                .keyboardType(.numberPad)
            Text("By linking your existing card, you agree to SMAC's Terms of Service and Privacy Policy.").font(.caption)
        }
    }
}

struct CardsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    ForEach(0..<2) { card in
                        AdvantageCardView()
                    }
                    LinkAdvantageCardPlaceholderView()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Cards")
                        .fontWeight(.medium)
                }
                ToolbarItem {
                    Button {
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    CardsView()
}
