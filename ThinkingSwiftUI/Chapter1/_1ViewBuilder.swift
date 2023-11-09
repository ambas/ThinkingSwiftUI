//
//  _1ViewBuilder.swift
//  ThinkingSwiftUI
//
//  Created by Ambas Chobsanti on 9/11/23.
//

import SwiftUI

struct _1ViewBuilder: View {
    @State var isShowText = false
    var body: some View {
        HStack(spacing: 20) {
            Greeting()
            Spacer()
            Goodbyle()
                .background(.blue)
                .border(.black)
            if isShowText {
                Text("Sample")
            }
        }
    }
    
    struct Greeting: View {
        var body: some View {
            Image(systemName: "hand.wave")
            Text("Hello")
        }
    }
    
    struct Goodbyle: View {
        var body: some View {
            Group {
                Image(systemName: "hand.wave")
                Text("Goodbye")
            }
        }
    }
}

#Preview {
    _1ViewBuilder()
}
