//
//  ContentView.swift
//  StackedCards_loopingCards
//
//  Created by Jose Alberto Rosario Castillo on 22/12/24.
//

import SwiftUI

struct ImageModel:Identifiable {
    var id: String = UUID().uuidString
    var altText: String
    var image: String
}

let images: [ImageModel] = [
    .init(altText: "Mo Eid", image: "Picture001"),
    .init(altText: "Codioful 2", image: "Picture002"),
    .init(altText: "Cotombro", image: "Picture003"),
    .init(altText: "Anni", image: "Picture004")
]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                GeometryReader {
                    let width = $0.size.width
                    LoopingStack(maxTranslationWidth: width) {
                        ForEach(images) { image in
                            Image(image.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 250, height: 400)
                                .clipShape(.rect(cornerRadius: 30))
                                .padding(5)
                                .background {
                                    RoundedRectangle(cornerRadius: 35)
                                        .fill(.background)
                                }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(height: 420)
            }
            .navigationTitle("Looping Stacked Cards")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray.opacity(0.2))
        }
    }
}

#Preview {
    ContentView()
}
