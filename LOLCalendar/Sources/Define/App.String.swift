//
//  App.String.swift
//  LOLCalendar
//
//  Created by 김민국 on 2020/11/05.
//

extension App {
    enum String {
        static let appName = ""
        
    }
    enum Url {
        //&range[begin_at]=2020-01-01T00:00:00Z,2020-12-31T23:59:59Z
        static let leagueURL = "https://api.pandascore.co/leagues/%d/matches?token=%@&page[size]=50&page[number]=%d"
        static let recentTournamentIDURL = "https://api.pandascore.co/leagues/%d/matches?token=%@&range[begin_at]=2020-01-01T00:00:00Z,2020-12-31T23:59:59Z&page[size]=1"
        static let brancketURL = "https://api.pandascore.co/tournaments/%d/brackets?token=%@"
        static let teamsURL = "https://api.pandascore.co/teams/%d?token=%@"
        static let opponentsURL = "https://api.pandascore.co/matches/%d/opponents?token=%@"
        static let rostersURL = "https://api.pandascore.co/tournaments/%d/rosters?token=%@"
    }
    enum Token {
        static let token = ""
    }
}
