//
//  ViewFactory.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 04.04.2026.
//

import SwiftUI

protocol ViewFactory {
    func makeView(for destination: Destination, coordinator: AppCoordinator) -> AnyView
}

final class DefaultViewFactory: ViewFactory {
    func makeView(for destination: Destination, coordinator: AppCoordinator) -> AnyView {
        switch destination {
        case .home:
            return AnyView(makeView1(coordinator: coordinator))
        case .details:
            return AnyView(makeView2(coordinator: coordinator))
        case .firstCover:
            return AnyView(makeView3(coordinator: coordinator))
        }
    }
    
    private func makeView1(coordinator: AppCoordinator) -> some View {
        View1(
            onNavigate: { [weak coordinator] in
                coordinator?.navigateToDetails()
            },
            onClose: { [weak coordinator] in
                coordinator?.popToRoot()
            }
        )
    }
    
    private func makeView2(coordinator: AppCoordinator) -> some View {
        View2(
            onNavigate: { [weak coordinator] in
                coordinator?.navigateToFirstCover()
            },
            onClose: { [weak coordinator] in
                coordinator?.popToRoot()
            }
        )
    }
    
    private func makeView3(coordinator: AppCoordinator) -> some View {
        View3(
            onNavigate: {},
            onClose: { [weak coordinator] in
                coordinator?.popToRoot()
            }
        )
    }
}
