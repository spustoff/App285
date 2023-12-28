//
//  SDetailView.swift
//  App285
//
//  Created by IGOR on 16/12/2023.
//

import SwiftUI

struct SDetailView: View {
    
    @StateObject var viewModel: StrategiesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                
                ZStack {
                    
                    Text(viewModel.selectedStrategy?.sName ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    
                    HStack {
                        
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
                        
                        Spacer()
                        
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        Image(systemName: "soccerball")
                            .foregroundColor(.white.opacity(0.2))
                            .font(.system(size: 90))
                            .padding()
                        
                        Text(viewModel.selectedStrategy?.currentGame ?? "423432")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .semibold))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedStrategy?.sName ?? "432")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedStrategy?.sDescription ?? "423423")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SDetailView(viewModel: StrategiesViewModel())
}
