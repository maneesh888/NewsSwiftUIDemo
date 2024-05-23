//
//  Modifiers.swift
//  NewsSwiftUIDemo
//
//  Created by Maneesh on 15/05/2024.
//

import SwiftUI
import DEWASecrets


extension View {
    func addLeadingCloseButton( action: @escaping () -> (Void)) -> some View {
        modifier(NavigationCloseButton(action:action))
    }
    
    func applyNaviagationTheme() -> some View {
        modifier(NavigationViewTheme())
    }
}

extension View {
    func navigationBarColor(backgroundColor: UIColor, titleColor: UIColor) -> some View {
        return self.modifier(NavigationBarColorModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}


struct NavigationCloseButton: ViewModifier {
    var action: () -> (Void)
    func body(content: Content) -> some View {
        content
            .navigationBarItems(leading: Button(action: action, label: {
                Image(systemName: "xmark")
                    .foregroundColor(DewaPallete.primary.color)
            }))
    }
}

struct NavigationViewTheme: ViewModifier {
  
    func body(content: Content) -> some View {
        content
            .accentColor(DewaPallete.primary.color)
            
    }
}


struct NavigationBarColorModifier: ViewModifier {
    var backgroundColor: UIColor
    var titleColor: UIColor

    init(backgroundColor: UIColor, titleColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor

        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        content
            .onAppear {
                UINavigationBar.appearance().backgroundColor = self.backgroundColor
                UINavigationBar.appearance().tintColor = self.titleColor
            }
    }
}
