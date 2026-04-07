//
//  ViewFactory.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 04.04.2026.
//

import SwiftUI

protocol ViewFactory {
    func makeView1(onNavigate: @escaping () -> Void, onClose: @escaping () -> Void) -> AnyView
    func makeView2(onNavigate: @escaping () -> Void, onClose: @escaping () -> Void) -> AnyView
    func makeView3(onNavigate: @escaping () -> Void, onClose: @escaping () -> Void) -> AnyView
    func makeView4(onNavigate: @escaping () -> Void, onClose: @escaping () -> Void) -> AnyView
    func makeView5(onNavigate: @escaping () -> Void, onClose: @escaping () -> Void) -> AnyView
}

final class DefaultViewFactory: ViewFactory {
    func makeView1(onNavigate: @escaping () -> Void, onClose: @escaping () -> Void) -> AnyView {
        AnyView(View1(onNavigate: onNavigate, onClose: onClose))
    }
    
    func makeView2(onNavigate: @escaping () -> Void, onClose: @escaping () -> Void) -> AnyView {
        AnyView(View2(onNavigate: onNavigate, onClose: onClose))
    }
    
    func makeView3(onNavigate: @escaping () -> Void, onClose: @escaping () -> Void) -> AnyView {
        AnyView(View3(onNavigate: onNavigate, onClose: onClose))
    }
    
    func makeView4(onNavigate: @escaping () -> Void, onClose: @escaping () -> Void) -> AnyView {
        AnyView(View4(onNavigate: onNavigate, onClose: onClose))
    }
    
    func makeView5(onNavigate: @escaping () -> Void, onClose: @escaping () -> Void) -> AnyView {
        AnyView(View5(onNavigate: onNavigate, onClose: onClose))
    }
}
