//
//  NavigationContainer.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import SwiftUI

struct NavigationContainer<Content: View>: View {
    @Bindable var router: AppCoordinator
    @ViewBuilder var content: () -> Content

    init(
        @ViewBuilder content: @escaping () -> Content,
        router: AppCoordinator
    ) {
        self.router = router
        self.content = content
    }

    var body: some View {
        NavigationStack(path: $router.navigationStackPath) {
            content()
                .navigationDestination(for: Destination.self) { destination in
                    router.view(for: destination)
                }
        }
        .sheet(item: $router.presentingSheet) { sheet in
            router.view(for: sheet)
        }
        .fullScreenCover(item: $router.presentingFullScreenCover) { fullScreen in
            router.view(for: fullScreen)
        }
    }
}

