//
//  ContentView.swift
//  dark-mord-practice
//
//  Created by jinsei_shima on 2019/06/04.
//  Copyright © 2019 jinsei_shima. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var isOn: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text("Hello World").navigationBarTitle(Text("Title"))
            Button(action: {}, label: { Text("Button") })
            Toggle(isOn: $isOn, label: { EmptyView() })
            PresentationButton(
                Text("Present"),
                destination: DetailView()
            )
        }.padding(16)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct DetailView : View {

    var body: some View {
        VStack {
            Text("Detail")
        }
    }
}

