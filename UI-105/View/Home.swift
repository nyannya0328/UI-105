//
//  Home.swift
//  UI-105
//
//  Created by にゃんにゃん丸 on 2021/01/16.
//

import SwiftUI

struct Home: View {
    @StateObject var model = HomeViewModel()
    @Environment(\.colorScheme) var scheme
    @Namespace var animation
    
    var columns = Array(repeating: GridItem(.flexible(),spacing:8), count: 2)
    var body: some View {
        
        
        ZStack{
            
            VStack(spacing:0){
                
                HStack(spacing:10){
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "person.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                        
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.primary)
                        
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        model.isdark.toggle()
                        
                    }, label: {
                        Image(systemName: model.isdark ?  "moon.fill" : "gear")
                            .font(.title)
                            .foregroundColor(.red)
                            .padding(8)
                            
                    
                    })
                    
                }
                .padding(.horizontal)
                .padding(.vertical,8)
                .overlay(
                    
                    Text("Dark")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.primary)
                )
                .background(scheme == .dark ? Color.black : Color.white)
                .shadow(color: Color.primary.opacity(0.05), radius: 5, x: 0, y: 5)
                
                
                
                ScrollView{
                    
                    
                    LazyVGrid(columns: columns, content: {
                        
                        ForEach(videos){video in
                            
                            VideoPlayerView(player: video.player)
                                
                                .cornerRadius(15)
                                .matchedGeometryEffect(id: video.id, in: animation)
                                .scaleEffect(model.showplayer && model.selectedVideo.id == video.id ? model.scale : 1)
                                .frame(width : (UIScreen.main.bounds.width - 45) / 2, height:250)
                                
                                .onTapGesture {
                                    withAnimation{
                                        model.selectedVideo = video
                                        model.showplayer.toggle()
                                    }
                                }
                                .zIndex(0)
                                
                                
                            
                        }
                       
                    })
                    .padding()
                    
                }
                
            }
            
            if model.showplayer{
                
                VideoPlayerView(player: model.selectedVideo.player)
                    .cornerRadius(10)
                    .scaleEffect(model.scale)
                    .matchedGeometryEffect(id: model.selectedVideo.id, in: animation)
                    .offset(model.offset)
                    .gesture(DragGesture().onChanged(onChange(value:)).onEnded(onEnd(value:)))
                   
                    .onAppear(perform: {
                        model.selectedVideo.player.play()
                    })
                    
                    .ignoresSafeArea(.all, edges: .all).zIndex(3)
                
                
            }
            
            
            
        }
        .preferredColorScheme(model.isdark ? .dark : .light)
        
    }
    
    func onChange(value:DragGesture.Value){
        
        if value.translation.height > 0{
            model.offset = value.translation
            let screenHeight = UIScreen.main.bounds.height - 50
            let progress = model.offset.height / screenHeight
            
            if 1 - progress > 0.5{
                model.scale = 1 - progress
                
            }
            
            
           
        }
        
        
    }
    
    func onEnd(value:DragGesture.Value){
        
        withAnimation(.default){
            
            if value.translation.height > 300{
                
                model.selectedVideo.player.pause()
                model.showplayer = false
                
            }
            
            model.offset = .zero
            model.scale = 1
        }
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
