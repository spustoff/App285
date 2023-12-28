//
//  R2.swift
//  App285
//
//  Created by IGOR on 19/12/2023.
//

import SwiftUI

struct R2: View {
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                
                VStack(spacing: 10) {
                    
                    Text("Great statistics")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("Be in focus with your winnings and loses")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R3()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(width: 230, height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
            }
        }
    }
}


#Preview {
    R2()
}
