//
//  StatisticsView.swift
//  App285
//
//  Created by IGOR on 16/12/2023.
//

import SwiftUI

struct StatisticsView: View {
    
    @AppStorage("matchValue") var matchValue: Int = 0
    @AppStorage("CreatedGames") var CreatedGames: [String] = []

    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("Statistics")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            HStack {
                                
                                Image(systemName: "arrow.up.right.square.fill")
                                    .foregroundColor(Color("prim2"))
                                
                                Spacer()
                                
                                Text("+\(String(format: "%.f", Double(.random(in: 11...44))))%")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 12, weight: .regular))
                                    .padding(4)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.1)))
                            }
                            
                            Text("Profit")
                                .foregroundColor(.gray.opacity(0.6))
                                .font(.system(size: 12, weight: .bold))
                            
                            Text("+ $\(String(format: "%.f", Double(.random(in: 11...444))))")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
               
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            HStack {
                                
                                Image(systemName: "arrow.down.right.square.fill")
                                    .foregroundColor(.red)
                                
                                Spacer()
                                
                                Text("+\(String(format: "%.f", Double(.random(in: 11...44))))%")
                                    .foregroundColor(.red)
                                    .font(.system(size: 12, weight: .regular))
                                    .padding(4)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.1)))
                            }
                            
                            Text("Profit")
                                .foregroundColor(.gray.opacity(0.6))
                                .font(.system(size: 12, weight: .bold))
                            
                            Text("- $\(String(format: "%.f", Double(.random(in: 11...444))))")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
               
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 15) {

                            Text("Matches")
                                .foregroundColor(.gray.opacity(0.6))
                                .font(.system(size: 12, weight: .bold))
                            
                            Text("\(matchValue)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
               
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        VStack(alignment: .leading, spacing: 15) {

                            Text("Win-rate, %:")
                                .foregroundColor(.gray.opacity(0.6))
                                .font(.system(size: 12, weight: .bold))
                            
                            Text("\(String(format: "%.f", Double(.random(in: 31...64))))")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
               
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    }
                    
                    Image("graph")
                        .padding()
                        .padding(.top)
                        .overlay (
                            
                            VStack(spacing: 10) {
                               
                                Text("Most played game")
                                    .foregroundColor(.gray.opacity(0.6))
                                    .font(.system(size: 13, weight: .medium))
                                
                                ForEach(CreatedGames.prefix(1), id: \.self) { index in
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium))
                                }
                            }
                        )
                }
            }
            .padding()
        }
    }
}

#Preview {
    StatisticsView()
}
