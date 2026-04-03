//
//  View6.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import SwiftUI

struct View6: View {
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("View 6")
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
    View6()
}
