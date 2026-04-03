//
//  NavigationContainer.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import SwiftUI

/// ``NavigationStack`` container that works with the ``Router``
/// to resolve the routes based on the ``Router``'s state
struct NavigationContainer<Content: View>: View {
    // The navigation container itself it's in charge of the lifecycle
    // of the router.
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
        // it's important that the these modifiers are **outside** the `NavigationStack`
        // otherwise the content closure will be called infinitely freezing the app
        .sheet(item: $router.presentingSheet) { sheet in
            router.view(for: sheet)
        }
        .fullScreenCover(item: $router.presentingFullScreenCover) { fullScreen in
            router.view(for: fullScreen)
        }
    }
}

//    @ViewBuilder func navigationView(for destination: SheetDestination, from router: Router) -> some View {
//        NavigationContainer(parentRouter: router) { view(for: destination) }
//    }
//
//    @ViewBuilder func navigationView(for destination: FullScreenDestination, from router: Router) -> some View {
//        NavigationContainer(parentRouter: router) { view(for: destination) }
//    }

//#Preview {
//    NavigationContainer(parentRouter: .previewRouter()) {
//        Text("Hello")
//    }
//}

