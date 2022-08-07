
//  BookDataStore.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/3/22.
//

import Foundation

class BookDataStore {
    
    static var books: [BookInfo] = [
        
        BookInfo(
            title: "Atomic Habits",
            authors: "James Clear",
            description:"The #1 New York Times bestseller. Over 4 million copies sold! Tiny Changes, Remarkable Results No matter your goals, Atomic Habits offers a proven framework for improving--every day. James Clear, one of the world's leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results. If you're having trouble changing your habits, the problem isn't you. The problem is your system. Bad habits repeat themselves again and again not because you don't want to change, but because you have the wrong system for change. You do not rise to the level of your goals. You fall to the level of your systems. Here, you'll get a proven system that can take you to new heights. Clear is known for his ability to distill complex topics into simple behaviors that can be easily applied to daily life and work. Here, he draws on the most proven ideas from biology, psychology, and neuroscience to create an easy-to-understand guide for making good habits inevitable and bad habits impossible. Along the way, readers will be inspired and entertained with true stories from Olympic gold medalists, award-winning artists, business leaders, life-saving physicians, and star comedians who have used the science of small habits to master their craft and vault to the top of their field. Learn how to: • make time for new habits (even when life gets crazy); • overcome a lack of motivation and willpower; • design your environment to make success easier; • get back on track when you fall off course; ...and much more. Atomic Habits will reshape the way you think about progress and success, and give you the tools and strategies you need to transform your habits--whether you are a team looking to win a championship, an organization hoping to redefine an industry, or simply an individual who wishes to quit smoking, lose weight, reduce stress, or achieve any other goal.",
            pageCount: 310,
            averageRating: 4.0,
            imageLinks: BookInfo.BookImage(
                thumbnail:
                    URL(
                        string: "http://books.google.com/books/content?id=XfFvDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")!)
        ),
        
        BookInfo(
            title: "The Great Gatsby",
            authors: "F. Scott Fitzgerald",
            description: "A deluxe trade paperback edition of The Great Gatsby, a true classic of 20th-century literature and one of America’s best-loved and iconic novels. This edition of The Great Gatsby has been updated by F. Scott Fitzgerald scholar James L.W. West III to include the author’s final revisions and features a note on the composition and text, a personal foreword by Fitzgerald’s granddaughter, Eleanor Lanahan—and an introduction by two-time National Book Award winner Jesmyn Ward. Featuring the iconic original cover art and French flaps, this is a must-have for all Gatsby fans. The Great Gatsby, Fitzgerald’s third book, stands as the supreme achievement of his career. First published in 1925, this quintessential novel of the Jazz Age has been acclaimed by generations of readers. The story of the mysteriously wealthy Jay Gatsby and his love for the beautiful Daisy Buchanan, of lavish parties on Long Island at a time when The New York Times noted “gin was the national drink and sex the national obsession,” it is an exquisitely crafted tale of America in the 1920s.",
            pageCount: 192,
            averageRating: 3.8,
            imageLinks: BookInfo.BookImage(thumbnail: URL(
                        string: "http://books.google.com/books/content?id=DDoEEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")!)
        ),
        
        
        
        BookInfo(
            title: "Jane Eyre",
            authors: "Charlotte Bronte",
            description: "Bronte’s novel about a shy, quiet governess who becomes a tutor in a great house and falls in love with its lonely and mysterious master is one of the great classics of English literature. Unique in its attention to the thoughts and feelings of a female protagonist, Jane Eyre was ahead of its time as a proto-feminist text. When it was published in 1847, however, Bronte was attacked by critics for what they felt was anti-Christian sentiment in her unflinching critique of the oppressions of Victorian society.",
            pageCount: 580,
            averageRating: 4.2,
            imageLinks: BookInfo.BookImage(thumbnail: URL(string: "http://books.google.com/books/content?id=lSMGAAAAQAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")!)
        ),
        
        
        BookInfo(
            title: "Untamed",
            authors: "Glennon Doyle",
            description: "#1 NEW YORK TIMES BESTSELLER * \"Packed with incredible insight about what it means to be a woman today.\"--Reese Witherspoon (Reese's Book Club x Hello Sunshine Book Pick) In her most revealing and powerful memoir yet, the activist, speaker, bestselling author, and \"patron saint of female empowerment\" (People) explores the joy and peace we discover when we stop striving to meet others' expectations and start trusting the voice deep within us. \"Untamed will liberate women--emotionally, spiritually, and physically. It is phenomenal.\"--Elizabeth Gilbert, author of City of Girls and Eat Pray Love This is how you find yourself. There is a voice of longing inside each woman. We strive so mightily to be good: good partners, daughters, mothers, employees, and friends. We hope all this striving will make us feel alive. Instead, it leaves us feeling weary, stuck, overwhelmed, and underwhelmed. We look at our lives and wonder: Wasn't it all supposed to be more beautiful than this? We quickly silence that question, telling ourselves to be grateful, hiding our discontent--even from ourselves. For many years, Glennon Doyle denied her own discontent. Then, while speaking at a conference, she looked at a woman across the room and fell instantly in love. Three words flooded her mind: There She Is. At first, Glennon assumed these words came to her from on high. But she soon realized they had come to her from within. This was her own voice--the one she had buried beneath decades of numbing addictions, cultural conditioning, and institutional allegiances. This was the voice of the girl she had been before the world told her who to be. Glennon decided to quit abandoning herself and to instead abandon the world's expectations of her. She quit being good so she could be free. She quit pleasing and started living. Soulful and uproarious, forceful and tender, Untamed is both an intimate memoir and a galvanizing wake-up call. It is the story of how one woman learned that a responsible mother is not one who slowly dies for her children, but one who shows them how to fully live. It is the story of navigating divorce, forming a new blended family, and discovering that the brokenness or wholeness of a family depends not on its structure but on each member's ability to bring her full self to the table. And it is the story of how each of us can begin to trust ourselves enough to set boundaries, make peace with our bodies, honor our anger and heartbreak, and unleash our truest, wildest instincts so that we become women who can finally look at ourselves and say: There She Is. Untamed shows us how to be brave. As Glennon insists: The braver we are, the luckier we get.",
            pageCount: 563,
            averageRating: 3.5,
            imageLinks: BookInfo.BookImage(thumbnail: URL(string: "http://books.google.com/books/content?id=sPmxzQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api")!)
        ),
        
        BookInfo(
            title: "Midnight Sun",
            authors: "Stepheie Meyer",
            description: "#1 bestselling author Stephenie Meyer makes a triumphant return to the world of Twilight with this highly anticipated companion: the iconic love story of Bella and Edward told from the vampire's point of view. When Edward Cullen and Bella Swan met in Twilight, an iconic love story was born. But until now, fans have heard only Bella's side of the story. At last, readers can experience Edward's version in the long-awaited companion novel, Midnight Sun. This unforgettable tale as told through Edward's eyes takes on a new and decidedly dark twist. Meeting Bella is both the most unnerving and intriguing event he has experienced in all his years as a vampire. As we learn more fascinating details about Edward's past and the complexity of his inner thoughts, we understand why this is the defining struggle of his life. How can he justify following his heart if it means leading Bella into danger? In Midnight Sun, Stephenie Meyer transports us back to a world that has captivated millions of readers and brings us an epic novel about the profound pleasures and devastating consequences of immortal love. An instant #1 New York Times BestsellerAn instant #1 USA Today BestsellerAn instant #1 Wall Street Journal BestsellerAn instant #1 IndieBound BestsellerApple Audiobook August Must-Listens Pick \"People do not want to just read Meyer's books; they want to climb inside them and live there.\" -- Time \"A literary phenomenon.\" -- New York Times",
            pageCount: 662,
            averageRating: 4.0,
            imageLinks: BookInfo.BookImage(thumbnail: URL(string: "http://books.google.com/books/content?id=F6bgDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")!)
        ),
        
        BookInfo(
            title: "Becoming",
            authors: "Michelle Obmama",
            description: "An intimate, powerful, and inspiring memoir by the former First Lady of the United States #1 NEW YORK TIMES BESTSELLER • WATCH THE EMMY-NOMINATED NETFLIX ORIGINAL DOCUMENTARY • OPRAH’S BOOK CLUB PICK • NAACP IMAGE AWARD WINNER • ONE OF ESSENCE’S 50 MOST IMPACTFUL BLACK BOOKS OF THE PAST 50 YEARS In a life filled with meaning and accomplishment, Michelle Obama has emerged as one of the most iconic and compelling women of our era. As First Lady of the United States of America—the first African American to serve in that role—she helped create the most welcoming and inclusive White House in history, while also establishing herself as a powerful advocate for women and girls in the U.S. and around the world, dramatically changing the ways that families pursue healthier and more active lives, and standing with her husband as he led America through some of its most harrowing moments. Along the way, she showed us a few dance moves, crushed Carpool Karaoke, and raised two down-to-earth daughters under an unforgiving media glare. In her memoir, a work of deep reflection and mesmerizing storytelling, Michelle Obama invites readers into her world, chronicling the experiences that have shaped her—from her childhood on the South Side of Chicago to her years as an executive balancing the demands of motherhood and work, to her time spent at the world’s most famous address. With unerring honesty and lively wit, she describes her triumphs and her disappointments, both public and private, telling her full story as she has lived it—in her own words and on her own terms. Warm, wise, and revelatory, Becoming is the deeply personal reckoning of a woman of soul and substance who has steadily defied expectations—and whose story inspires us to do the same.",
            pageCount: 426,
            averageRating: 4.5,
            imageLinks: BookInfo.BookImage(thumbnail: URL(string: "http://books.google.com/books/content?id=hi17DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")!)
        ),
        
        BookInfo(
            title: "Get Out of Your Head",
            authors: "Jennie Allen",
            description: "Bestselling author and Bible teacher, Jennie Allen steps through the book of Philippians breaking down the simple, but difficult truth of allowing ourselves and our minds to be transformed in the name of Christ.",
            pageCount: 256,
            averageRating: 4.5,
            imageLinks: BookInfo.BookImage(thumbnail: URL(string: "http://books.google.com/books/content?id=j33HDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")!)
        ),
        
        BookInfo(
            title: "Educated",
            authors: "Tara Westover",
            description: "#1 NEW YORK TIMES, WALL STREET JOURNAL, AND BOSTON GLOBE BESTSELLER • One of the most acclaimed books of our time: an unforgettable memoir about a young woman who, kept out of school, leaves her survivalist family and goes on to earn a PhD from Cambridge University “Extraordinary . . . an act of courage and self-invention.”—The New York Times NAMED ONE OF THE TEN BEST BOOKS OF THE YEAR BY THE NEW YORK TIMES BOOK REVIEW • ONE OF PRESIDENT BARACK OBAMA’S FAVORITE BOOKS OF THE YEAR • BILL GATES’S HOLIDAY READING LIST • FINALIST: National Book Critics Circle’s Award In Autobiography and John Leonard Prize For Best First Book • PEN/Jean Stein Book Award • Los Angeles Times Book Prize Born to survivalists in the mountains of Idaho, Tara Westover was seventeen the first time she set foot in a classroom. Her family was so isolated from mainstream society that there was no one to ensure the children received an education, and no one to intervene when one of Tara’s older brothers became violent. When another brother got himself into college, Tara decided to try a new kind of life. Her quest for knowledge transformed her, taking her over oceans and across continents, to Harvard and to Cambridge University. Only then would she wonder if she’d traveled too far, if there was still a way home. “Beautiful and propulsive . . . Despite the singularity of [Westover’s] childhood, the questions her book poses are universal: How much of ourselves should we give to those we love? And how much must we betray them to grow up?”—Vogue NAMED ONE OF THE BEST BOOKS OF THE YEAR BY The Washington Post • O: The Oprah Magazine • Time • NPR • Good Morning America • San Francisco Chronicle • The Guardian • The Economist • Financial Times • Newsday • New York Post • theSkimm • Refinery29 • Bloomberg • Self • Real Simple • Town & Country • Bustle • Paste • Publishers Weekly • Library Journal • LibraryReads • Book Riot • Pamela Paul, KQED • New York Public Library",
            pageCount: 189,
            averageRating: 4.0,
            imageLinks: BookInfo.BookImage(thumbnail: URL(string: "http://books.google.com/books/content?id=2ObWDgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")!)
        )
    ]
}
