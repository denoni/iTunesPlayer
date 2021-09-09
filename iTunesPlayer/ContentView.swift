//
//  ContentView.swift
//  iTunesPlayer
//
//  Created by Gabriel on 9/8/21.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
  @State private var artistNameInput = ""

  var dummyData = ["Josh", "Bob", "Charlie", "Sam", "Tod"]

  var body: some View {
    HStack(spacing: 15) {
      TextField("Song name...", text: $artistNameInput)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }.padding()

    Spacer()

    List(dummyData, id: \.self) { item in
      ZStack {
        Color.white.opacity(0.08)
          .mask(RoundedRectangle(cornerRadius: 15))
        HStack(spacing: 0) {
          VStack(alignment: .leading) {
            Text(item)
              .font(.headline)
              .lineLimit(2)
            Text("Namerino")
              .opacity(0.6)
              .lineLimit(1)
          }
          Spacer()

          .padding(.horizontal, 10)
          ZStack {
            RoundedRectangle(cornerRadius: 15)
              .foregroundColor(Color.black.opacity(0.6))
          }
          .aspectRatio(1/1, contentMode: .fit)
          .frame(width: 100)

        }.padding()
      }
    }
  }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
