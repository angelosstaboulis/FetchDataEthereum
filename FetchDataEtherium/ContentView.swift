//
//  ContentView.swift
//  FetchDataEtherium
//
//  Created by Angelos Staboulis on 1/6/24.
//

import SwiftUI
import web3
struct ContentView: View {
    @StateObject var viewModel = FetchViewModel()
    @State var gasPrice:String
    var body: some View {
        VStack {
             Text("Fetch Data from Ethereum BlockChain").padding(30)
            VStack{
                Text("GasPrice")
                Text("Current gas price: \(gasPrice) Gwei")
            }
             Spacer()
        }.onAppear(perform: {
                viewModel.fetchData(urlString: "https://mainnet.infura.io/v3/a5d9084317924323bd2e49e717ed9845") { fetchData in
                    gasPrice = String(describing:fetchData.gasPrice.quotientAndRemainder(dividingBy: 1000000000).quotient)
                }
        })
       
    }
}

#Preview {
    ContentView( gasPrice: "")
}
