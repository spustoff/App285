//
//  AddMatchView.swift
//  App285
//
//  Created by IGOR on 16/12/2023.
//

import SwiftUI

struct AddMatchView: View {
    
    @StateObject var viewModel: MatchesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name:")
                                .foregroundColor(viewModel.matchName.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.matchName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.matchName)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white).opacity(0.3)))
                        .padding(2)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Players:")
                                .foregroundColor(viewModel.matchPlayers.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.matchPlayers.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.matchPlayers)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .keyboardType(.decimalPad)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white).opacity(0.3)))
                        .padding(2)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Date:")
                                .foregroundColor(viewModel.matchDate.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.matchDate.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.matchDate)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white).opacity(0.3)))
                        .padding(2)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Status:")
                                .foregroundColor(viewModel.matchStatus.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.matchStatus.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.matchStatus)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white).opacity(0.3)))
                        .padding(2)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Profit:")
                                .foregroundColor(viewModel.matchProfit.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.matchProfit.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.matchProfit)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .keyboardType(.decimalPad)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white).opacity(0.3)))
                        .padding(2)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Bet:")
                                .foregroundColor(viewModel.matchBet.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.matchBet.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.matchBet)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .keyboardType(.decimalPad)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white).opacity(0.3)))
                        .padding(2)
                }
                
                Button(action: {
                    
                    viewModel.addMatch(completion: {
                        
                        viewModel.matchName = ""
                        
                        viewModel.matchPlayers = ""
                        viewModel.matchDate = ""
                        viewModel.matchStatus = ""
                        viewModel.matchProfit = ""
                        viewModel.matchBet = ""
                        
                        viewModel.fetchMatches()
                    })
                    
                    viewModel.matchValue += 1
                                        
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim2")))
                })
                .disabled(viewModel.matchName.isEmpty || viewModel.matchPlayers.isEmpty || viewModel.matchDate.isEmpty || viewModel.matchStatus.isEmpty || viewModel.matchProfit.isEmpty || viewModel.matchBet.isEmpty ? true : false)
                .opacity(viewModel.matchName.isEmpty || viewModel.matchPlayers.isEmpty || viewModel.matchDate.isEmpty || viewModel.matchStatus.isEmpty || viewModel.matchProfit.isEmpty || viewModel.matchBet.isEmpty ? 0.5 : 1)
            }
            .padding()
        }
    }
}

#Preview {
    AddMatchView(viewModel: MatchesViewModel())
}
