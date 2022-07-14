//
//  PreviewProvider.swift
//  MarvelAPISearch
//
//  Created by Siddharth Mittal on 05/07/22.
//

import SwiftUI

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    private init() { }
    
    let testCharacter = Character(id: 1009220,
                                  name: "Captain America",
                                  description: "Vowing to serve his country any way he could, young Steve Rogers took the super soldier serum to become America's one-man army. Fighting for the red, white and blue for over 60 years, Captain America is the living, breathing symbol of freedom and liberty.",
                                  thumbnail: Thumbnail(
                                    path: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087",
                                    ext: "jpg"
                                  ),
                                  urls: [
                                    Url(
                                      type: "detail",
                                      url: "http://marvel.com/comics/characters/1009220/captain_america?utm_campaign=apiRef&utm_source=00b8da3271c7a7da5a0b2357f54fab14"
                                    ),
                                    Url(
                                      type: "wiki",
                                      url: "http://marvel.com/universe/Captain_America_(Steve_Rogers)?utm_campaign=apiRef&utm_source=00b8da3271c7a7da5a0b2357f54fab14"
                                    ),
                                    Url(
                                      type: "comiclink",
                                      url: "http://marvel.com/comics/characters/1009220/captain_america?utm_campaign=apiRef&utm_source=00b8da3271c7a7da5a0b2357f54fab14"
                                    )
                                  ]
                            )
    
    let testComic: Comic = Comic(id: 10000,
                                title: "Love Romances (1949) #93",
                                issueNumber: 93,
                                urls: [
                                  Url(
                                    type: "detail",
                                    url: "http://marvel.com/comics/issue/9891/love_romances_1949_93?utm_campaign=apiRef&utm_source=85a2617a16e84744592859bda3d15a8b"
                                  ),
                                ],
                                variantDescription: "",
                                thumbnail: Thumbnail(
                                  path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available",
                                  ext: "jpg"
                                )
                            )
    
    let testEvent: Event = Event(id: 116,
                                 title: "Acts of Vengeance!",
                                 description: "Loki sets about convincing the super-villains of Earth to attack heroes other than those they normally fight in an attempt to destroy the Avengers to absolve his guilt over inadvertently creating the team in the first place.",
                                 urls: [
                                   Url(
                                     type: "detail",
                                     url: "http://marvel.com/comics/events/116/acts_of_vengeance?utm_campaign=apiRef&utm_source=00b8da3271c7a7da5a0b2357f54fab14"
                                   ),
                                   Url(
                                     type: "wiki",
                                     url: "http://marvel.com/universe/Acts_of_Vengeance!?utm_campaign=apiRef&utm_source=00b8da3271c7a7da5a0b2357f54fab14"
                                   )
                                 ],
                                 start: "1989-12-10 00:00:00",
                                 end: "2008-01-04 00:00:00",
                                 thumbnail: Thumbnail(
                                   path: "http://i.annihil.us/u/prod/marvel/i/mg/9/40/51ca10d996b8b",
                                   ext: "jpg"
                                 )
                            )
    
    let testSerie: Serie = Serie(id: 31445,
                                 title: "Fantastic Four by Dan Slott Vol. 1 (2021)",
                                 description: nil,
                                 urls: [
                                    Url(
                                        type: "detail",
                                        url: "http://marvel.com/comics/series/31445/_fantastic_four_by_dan_slott_vol_1_2021?utm_campaign=apiRef&utm_source=00b8da3271c7a7da5a0b2357f54fab14"
                                    ),
                                ],
                                startYear: 2021,
                                endYear: 2021,
                                rating: "",
                                thumbnail: Thumbnail(
                                    path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available",
                                    ext: "jpg"
                                )
                            )
}


extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}
