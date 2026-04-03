//
//  View7.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import SwiftUI

struct View7: View {
    var body: some View {
        ZStack {
            Color.pink.opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("View 7")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Button("Navigate") {
                    // No action for now
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    View7()
}
