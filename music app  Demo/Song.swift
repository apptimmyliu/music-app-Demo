//
//  Song.swift
//  music app  Demo
//
//  Created by Timmy on 2024/3/5.
//

import Foundation

struct Song {
    // 歌曲檔案
    let song: String
    // 歌曲名稱
    let songName: String
    // 歌手
    let singer: String
    //  歌曲圖片
    let cover: String
}
// 定義歌曲陣列，包含三首歌曲的資訊
 var songs = [
    Song(song: "SPOTLIGHT", songName: "SPOTLIGHT", singer: "頑童", cover: "pic1"),
    Song(song: "洋蔥", songName: "洋蔥", singer: "五月天", cover: "pic2"),
    Song(song: "Love Story", songName: "Love Story", singer: "Taylor Swift", cover: "pic3")]

