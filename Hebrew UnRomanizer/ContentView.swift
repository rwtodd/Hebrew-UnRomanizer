//
//  ContentView.swift
//  Hebrew UnRomanizer
//
//  Created by Richard Todd on 9/15/23.
//

import SwiftUI
import RomanizedHebrew

struct ContentView: View {
    @State private var romanText = "KThR"
    
    var body: some View {
        let heb = unromanizeHebrew(romanText)
        Form {
            TextField("Romanized", text: $romanText)
            LabeledContent("Hebrew") {
                Text(heb).font(.system(.largeTitle,design: .serif))
            }
            Button("Copy To Clipboard") {
                let pbgen = NSPasteboard.general
                pbgen.clearContents()
                pbgen.setString(heb, forType: .string)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
