//
//  ContentView.swift
//  SwiftUIListSelection-iOS
//
//  Created by Tom Kraina on 24/06/2019.
//  Copyright © 2019 Tom Kraina. All rights reserved.
//

import SwiftUI

struct RowContent: Identifiable {
    let id: UUID = .init()
    let text: String

    static let defaultData: [RowContent] = ["First", "Second", "Third"].map(RowContent.init(text:))
}

struct ContentView : View {

    private var data = RowContent.defaultData
    // Set conforms to SelectionManager in SwiftUI
    @State private var selection = Set<RowContent.ID>()

    var body: some View {
        // Calling .identified(by: \.id) on data makes the selection work (only on macOS?)
        // FIXME: Make selection work on iOS (is it a bug in SwiftUI?)
        List(data.identified(by: \.id), selection: $selection) { item in
            Text(item.text)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
