//
//  iTunesViewModel.swift
//  iTunesPlayer
//
//  Created by Gabriel on 9/9/21.
//

import SwiftUI

class APIViewModel: ObservableObject {
  @Published var results = [Result]()

  func loadData(artistName: String) {
    let artistNameFormatted = artistName.replacingOccurrences(of: " ", with: "+")

    // URL
    guard let url = URL(string: "https://itunes.apple.com/search?term=\(artistNameFormatted)&entity=song") else {
      print("Invalid URL")
      return
    }

    // URL Request
    let request = URLRequest(url: url)

    // Create URLSession and dataTask
    URLSession.shared.dataTask(with: request) { data, response, error in
      if let data = data {
        if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
          DispatchQueue.main.async {
            self.results = decodedResponse.results
          }

          return
        }
      }
      // If we didn't return yet, an error occurred
      print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
    }
    // Fire off the dataTask
    .resume()

  }

}

struct Response: Codable {
  let results: [Result]
}

struct Result: Codable {
  let trackId: Int
  let trackName: String
  let artistName: String

  let artworkUrl100: String
}
