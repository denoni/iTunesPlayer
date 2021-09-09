//
//  iTunesView.swift
//  iTunesPlayer
//
//  Created by Gabriel on 9/8/21.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel = APIViewModel()
  @State private var artistNameInput = ""

  var body: some View {
    ZStack {
      Rectangle()
        .fill(Color(#colorLiteral(red: 0.1350227125, green: 0.1350227125, blue: 0.1350227125, alpha: 1)))
        .ignoresSafeArea()
        .frame(height: 80)
      HStack(spacing: 15) {
        TextField("Song name...", text: $artistNameInput)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        Button(action: { viewModel.loadData(artistName: artistNameInput) }) {
          Text("Search")
            .frame(width: 70, height: 30)
            .foregroundColor(.black)
            .background(Color.white.opacity(0.9))
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
      }.padding()
    }

    Spacer()

    List(viewModel.results, id: \.trackId) { item in
      let trackTitle = item.trackName
      let artistName = item.artistName
      let coverImageURL = item.artworkUrl100

      ZStack {
        Color.white.opacity(0.08)
          .mask(RoundedRectangle(cornerRadius: 15))
        HStack(spacing: 0) {

          VStack(alignment: .leading) {
            Text(trackTitle)
              .font(.headline)
              .lineLimit(2)
            Text(artistName)
              .font(.subheadline)
              .opacity(0.6)
              .lineLimit(1)
          }

          Spacer()

          VStack {
            Button(action: { print("Tapped play button") }) {
              Image(systemName: "play.circle.fill")
                .resizable()
                .aspectRatio(1/1, contentMode: .fit)
                .frame(width: 25)
                .scaleEffect()
            }
            Button(action: { print("Tapped pause button") }) {
              Image(systemName: "pause.circle.fill")
                .resizable()
                .aspectRatio(1/1, contentMode: .fit)
                .frame(width: 25)
            }
          }.buttonStyle(PlainButtonStyle())
          .padding(.horizontal, 10)

          ZStack {
            RoundedRectangle(cornerRadius: 15)
              .fill(Color.black.opacity(0.6))

            RemoteImage(url: coverImageURL)
              .mask(RoundedRectangle(cornerRadius: 15))
          }
          .aspectRatio(1/1, contentMode: .fit)
          .frame(width: 100)
          .mask(RoundedRectangle(cornerRadius: 15))

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
