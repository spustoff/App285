//
//  MatchesView.swift
//  App285
//
//  Created by IGOR on 16/12/2023.
//

import SwiftUI

struct MatchesView: View {
    
    @StateObject var viewModel = MatchesViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        AddMatchView(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .medium))
                    })
                }
                
                Text("Matches")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    ForEach(viewModel.sviews, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.current_sviews = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim").opacity(viewModel.current_sviews == index ? 1 : 0)))
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(0.1)))
                
                if viewModel.matches.isEmpty {
                    
                    VStack {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.bottom, 9)
                        
                        Text("You don't have")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("added game")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                    
                } else {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack {
                            
                            ForEach(viewModel.matches, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedMatch = index
                                    
                                }, label: {
                                    
                                    VStack(spacing: 9) {
                                        
                                        Text(index.matchName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                        
                                        Image(systemName: "soccerball")
                                            .foregroundColor(.white.opacity(0.2))
                                            .font(.system(size: 40, weight: .regular))
                                    }
                                })
                                .padding()
                                .frame(width: 100)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                .background(RoundedRectangle(cornerRadius: 10).stroke(viewModel.selectedMatch == index ? Color("prim") : Color.gray))
                                .padding(5)
                            }
                        }
                    }
                    .frame(height: 120)
                }
                
                Text("Played matches")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if viewModel.matches.isEmpty {
                    
                    VStack {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .padding(.bottom)
                        
                        Text("You don't have any")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("played matches")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
    
                        HStack(spacing: 9) {
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(viewModel.selectedMatch?.matchDate ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    HStack {
                                        
                                        Text(viewModel.selectedMatch?.matchStatus ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                            .padding(4)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                                        
                                        Text("Amount: $\(viewModel.selectedMatch?.matchProfit ?? 0)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .medium))
                                    }
                                    
                                    HStack {
                                        
                                        Text("\(viewModel.selectedMatch?.matchBet ?? 0)")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 12, weight: .medium))
                                            .padding(5)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(Color("bg3")))
                                        
                                        Text("\(viewModel.selectedMatch?.matchPlayers ?? 0)")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 12, weight: .medium))
                                            .padding(5)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(Color("bg3")))
                                    }
                                }
                                
                                Spacer()
                                
                            }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    }
                }
            }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchMatches()
        }
    }
}

#Preview {
    MatchesView()
}
