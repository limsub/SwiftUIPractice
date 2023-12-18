//
//  SearchMovieView.swift
//  SwiftUIPractice
//
//  Created by 임승섭 on 12/18/23.
//

import SwiftUI

struct SearchMovieView: View {
    
    @State private var searchQuery = ""
    
    let movie = [
        Movie(name: "ab"),
        Movie(name: "abcd"),
        Movie(name: "cdef"),
        Movie(name: "acd"),
        Movie(name: "ab"),
        Movie(name: "a"),
        Movie(name: "bcde"),
        Movie(name: "ice cream"),
        Movie(name: "eam"),
        Movie(name: "bcd"),
        Movie(name: "cade"),
        Movie(name: "bace"),
        Movie(name: "cbde"),
        Movie(name: "abcdefghijklmnop"),
        Movie(name: "mnop"),
    ]
    
    var filterMovie: [Movie] {
        return (searchQuery.isEmpty) ? movie
        : movie.filter { $0.name.uppercased().contains(searchQuery.uppercased()) }
    }
    
    
    
    var body: some View {
        NavigationView {  // will be deprecated -> NavigationStack 사용
            
            List {
                ForEach(filterMovie, id: \.self) { movie in
                    
                    NavigationLink {
                        SearchDetailView(movie: movie)
                    } label: {
                        HStack {
                            Circle()
                                .foregroundColor(movie.color)
                            
                            Text(movie.name)
                        }
                        .frame(height: 60)
                    }

                }
            }
            .navigationTitle("뮤비 검색 화면")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        print("툴바 버튼 클릭")
                    } label : {
                        Image(systemName: "star.fill")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        print("툴바 버튼 클릭2")
                    } label: {
                        Image(systemName: "person")
                    }
                }
            }
            .searchable(
                text: $searchQuery,
                placement: .navigationBarDrawer,
                prompt: "검색어를 입력해주세요"
            )
            .onSubmit(of: .search) {
                print("검색 버튼 눌렸다 : \(searchQuery)")
            }
            
            
        }
    }
}

struct SearchDetailView: View {
    var movie: Movie
    
    var body: some View {
        VStack {
            Button {
                print("hi")
            } label: {
                Circle()
                    .foregroundColor(movie.color)
                    .frame(width: 200, height: 200)
                
                Text(movie.name)
                    .font(.largeTitle)
            }
        }
    }
}


#Preview {
    SearchMovieView()
}
