//
//  SearchBarView.swift
//  
//
//  Created by Alex Nagy on 17.01.2021.
//

import SwiftUI

@available(iOS 14.0, *)
public struct SearchBarView: View {
    
    var title: String
    @Binding var text: String
    private var showsCancelButton: Bool
    private var cancelButtonLabel: () -> AnyView
    private var showsClearSearchButton: Bool
    private var clearSearchButtonLabel: () -> AnyView
    private var backgroundView: () -> AnyView
    private var spacing: CGFloat
    private var onEditingChanged: (Bool) -> Void
    private var onCommit: () -> Void
    private let onCancel: () -> Void
    
    public init(title: String = "Search...",
         text: Binding<String>,
         onCancel: @escaping () -> ()) {
        self.title = title
        self._text = text
        self.showsCancelButton = true
        self.cancelButtonLabel = { AnyView(Text("Cancel")) }
        self.showsClearSearchButton = true
        self.clearSearchButtonLabel =  { AnyView(Image(systemName: "xmark.circle.fill").foregroundColor(Color(.systemGray3))) }
        self.backgroundView = { AnyView(Color(.systemBackground)) }
        self.spacing = 8
        self.onEditingChanged = {_ in}
        self.onCommit = {}
        self.onCancel = onCancel
    }
    
    public init(title: String = "Search...",
         text: Binding<String>,
         showsCancelButton: Bool = true,
         cancelButtonLabel: @escaping () -> AnyView = { AnyView(Text("Cancel")) },
         showsClearSearchButton: Bool = true,
         clearSearchButtonLabel: @escaping () -> AnyView = { AnyView(Image(systemName: "xmark.circle.fill").foregroundColor(Color(.systemGray3))) },
         backgroundView: @escaping () -> AnyView = { AnyView(Color(.systemBackground)) },
         spacing: CGFloat = 8,
         onEditingChanged: @escaping (Bool) -> Void = {_ in},
         onCommit: @escaping () -> Void = {},
         onCancel: @escaping () -> () = {}) {
        self.title = title
        self._text = text
        self.showsCancelButton = showsCancelButton
        self.cancelButtonLabel = cancelButtonLabel
        self.showsClearSearchButton = showsClearSearchButton
        self.clearSearchButtonLabel = clearSearchButtonLabel
        self.backgroundView = backgroundView
        self.spacing = spacing
        self.onEditingChanged = onEditingChanged
        self.onCommit = onCommit
        self.onCancel = onCancel
    }
    
    public var body: some View {
        HStack(spacing: spacing) {
            TextField(title, text: $text, onEditingChanged: onEditingChanged, onCommit: onCommit)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            if text != "", showsClearSearchButton {
                Button {
                    text = ""
                } label: {
                    clearSearchButtonLabel()
                }
            }
            if showsCancelButton {
                Button {
                    onCancel()
                } label: {
                    cancelButtonLabel()
                }
            }
        }
        .padding()
        .background(backgroundView().ignoresSafeArea())
    }
}

