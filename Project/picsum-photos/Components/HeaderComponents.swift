//
//  HeaderComponents.swift
//  picsum-photos
//
//  Created by giffy on 22/01/26.
//

import SwiftUI

struct HeaderComponents: View {

    var body: some View {
        HStack {
            Spacer()

            Text("Picsum Photos")
                .font(.headline)
                .fontWeight(.semibold)

            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color(.systemBackground))
    }
}
