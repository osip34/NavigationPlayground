//
//  View10.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import SwiftUI

struct View10: View {
    var body: some View {
        ZStack {
            Color.cyan.opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("View 10")
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
    View10()
}
