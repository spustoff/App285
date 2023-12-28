//
//  GamesView.swift
//  App285
//
//  Created by IGOR on 15/12/2023.
//

import SwiftUI

struct GamesView: View {
    
    @StateObject var viewModel = GamesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("Games")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Winnings")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("0")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Winnings")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("0")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                }
                
                HStack {
                    
                    Text("Created games")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        AddGame(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "plus.circle")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                    })
                }
                
                if viewModel.games.isEmpty {
                    
                    VStack {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .medium))
                        
                        Text("You don’t have any created games")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach(viewModel.games, id: \.self) { index in
                            
                            VStack(spacing: 15) {
                                
                                Text(index.gameName ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Image(systemName: "soccerball")
                                    .foregroundColor(.white.opacity(0.2))
                                    .font(.system(size: 70))
                                
                                HStack {
                                    
                                    Text("Played: \(index.gameTP) times")
                                        .foregroundColor(.white)
                                        .font(.system(size: 7, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 30)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.3)))
                                    
                                    Text("Winning %: \(index.gameWR)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 7, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 30)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.3)))
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        }
                    })
                }
            }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchGames()
        }
    }
}

#Preview {
    GamesView()
}
