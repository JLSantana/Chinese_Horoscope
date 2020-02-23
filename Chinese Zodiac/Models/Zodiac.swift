//
//  Zodiac.swift
//  Chinese Zodiac
//
//  Created by user164578 on 2/22/20.
//  Copyright © 2020 user164578. All rights reserved.
//

import Foundation

struct Zodiac {
    let description: String
    let sign: Sign
    let element: Element?
    
    var afinity: String {
        var afinity: String
        
        switch sign {
        case .dog, .rat, .tiger, .dragon, .horse, .monkey:
            afinity = "Yang"
        case .rooster, .goat, .snake, .rabbit, .ox, .pig:
            afinity = "Yin"
        }
        
        return afinity
    }
    
    enum Sign: String {
        case rat = "Rat"
        case ox = "Ox"
        case tiger = "Tiger"
        case rabbit = "Rabbit"
        case dragon = "Dragon"
        case snake = "Snake"
        case horse = "Horse"
        case goat = "Goat"
        case monkey = "Monkey"
        case rooster = "Rooster"
        case dog = "Dog"
        case pig = "Pig"
    }
    
    enum Element: String {
        case metal = "Metal"
        case water = "Water"
        case wood = "Wood"
        case earth = "Earth"
        case fire = "Fire"
    }
    
    init(sign: Sign) {
        self.sign = sign
        element = nil
        description = Zodiac.getDescription(sign: sign)
    }
    
    init?(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"

        let yearExtracted = Int(dateFormatter.string(from: date))
        dateFormatter.dateFormat = "MM"
        let monthExtracted = Int(dateFormatter.string(from: date))
        dateFormatter.dateFormat = "dd"
        let dayExtracted = Int(dateFormatter.string(from: date))

        guard let year = yearExtracted, let month = monthExtracted, let day = dayExtracted else {return nil}
        
        switch year {
        case 1990:
            sign = (day <= 26 ? .snake : .horse)
        case 1991:
            sign = (day <= 15 && month <= 2 ? .horse : .goat)
        case 1992:
            sign = (day <= 3 && month <= 2 ? .goat: .monkey)
        case 1993:
            sign = (day <= 22 && month <= 1 ? .monkey : .rooster)
        case 1994:
            sign = (day <= 9 && month <= 2 ? .rooster : .dog)
        case 1995:
            sign = (day <= 30 && month <= 1 ? .dog : .pig)
        case 1996:
            sign = (day <= 18 && month <= 2 ? .pig : .rat)
        case 1997:
            sign = (day <= 7 && month <= 2 ? .rat : .ox)
        case 1998:
            sign = (day <= 27 && month <= 1 ? .ox : .tiger)
        case 1999:
            sign = (day <= 15 && month <= 2 ? .tiger : .rabbit)
        case 2000:
            sign = (day <= 4 && month <= 2 ? .rabbit : .dragon)
        default:
            sign = .dog
        }
        
        description = Zodiac.getDescription(sign: sign)
        element = Zodiac.getElement(year: year)
    }
    
    static func getDescription(sign: Sign) -> String {
        let description: String
        
        switch sign {
        case .rat:
            description = "Rats are quick-witted, resourceful, and smart but lack courage. With rich imaginations and sharp observations, they can take advantage of various opportunities well."
        case .ox:
            description = "Oxes are known for diligence, dependability, strength and determination. Having an honest nature, Oxes are strongly patriotic, have ideals and ambitions for life, and attach importance to family and work."
        case .tiger:
            description = "People born in a year of the Tiger are brave, competitive, unpredictable, and confident. They are very charming and well-liked by others. But sometimes they are likely to be impetuous, irritable, and overindulged."
        case .dragon:
            description = "Gifted with innate courage, tenacity, and intelligence, Dragons are enthusiastic and confident. They are not afraid of challenges, and willing to take risks."
        case .snake:
            description = "Snakes represent the symbol of wisdom. They are intelligent and wise. They are good at communication but say little. Snakes are usually regarded as great thinkers."
        case .horse:
            description = "People born in a year of the Horse are extremely animated, active and energetic. Horses love to be in a crowd, and they can usually be seen on such occasions as concerts, theater performances, meetings, sporting events, and parties."
        case .goat:
            description = "People born in a year of the Goat are generally believed to be gentle, mild-mannered, shy, stable, sympathetic, amicable, and brimming with a strong sense of kindheartedness and justice."
        case .monkey:
            description = "People born in a year of the Monkey have magnetic personalities and are witty and intelligent. Personality traits like mischievousness, curiosity, and cleverness make them very naughty."
        case .rooster:
            description = "People born in a year of the Rooster are very observant. Hardworking, resourceful, courageous, and talented, Roosters are very confident in themselves."
        case .dog:
            description = "Dogs are loyal and honest, amiable and kind, cautious and prudent. Due to having a strong sense of loyalty and sincerity, Dogs will do everything for the person who they think is most important."
        case .pig:
            description = "Pigs are diligent, compassionate, and generous. They have great concentration: once they set a goal, they will devote all their energy to achieving it. Though Pigs rarely seek help from others, they will not refuse to give others a hand. Pigs never suspect trickery, so they are easily fooled."
        case .rabbit:
            description = "To outsiders, the Rabbit’s kindness may make them seem soft and weak. In truth, the Rabbit’s quiet personality hides their confidence and strength. They are steadily moving towards their goal, no matter what negativity the others give them. With their good reasoning skills and attention to detail, they make great scholars. They are socializers with an attractive aura. However, they find it hard to open up to others and often turn to escapism. A plain and routine life is not their style. Though conservative and careful in their actions, they need surprises every so often to spice things up."
            
        }
        
        return description
    }
    
    static func getElement(year: Int) -> Element? {
        var element: Element? = nil
        
        if let integer = Int(String(year).last!.description) {
            switch integer {
            case 0...1:
                element = .metal
            case 2...3:
                element = .water
            case 4...5:
                element = .wood
            case 6...7:
                element = .fire
            case 8...9:
                element = .earth
            default:
                element = nil
            }
        }
        
        return element
    }
}
