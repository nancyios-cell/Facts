//
//  ContentView.swift
//  Facts
//
//  Created by Nancy on 10/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            List(0..<5) { item in
                Image("ic_img")
                VStack(alignment: .leading, spacing: 2.0) {
                    Text("BeaversBeaversBeaversBeavers")
                        .font(.title2)
                    Text("Eare illegal. Cats are fineEare illegal. Cats are fineEare illegal. Cats are fineEare illegal. Cats are fine")
                        .font(.subheadline)
                        .foregroundColor(Color(red: 86.0/225.0, green: 86.0/225.0, blue: 86.0/225.0, opacity: 1.0))
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
            
    }
}
