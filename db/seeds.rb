# require 'rest-client'
# require 'pry'


# --- USER {email:string, first_name:string, last_name:string, avatar:string}---
mcz = User.find_or_create_by(id: 1, email: 'marisa@email.com', first_name: 'marisa', last_name: 'canan')

# --------PROJECT {title:string, subtitle:string, user_id}--------
game_proj = Project.find_or_create_by(id: 2, title: "Let's Play", subtitle: 'How well do you know your favorite board games?', user: mcz)
# proj = Project.find_or_create_by(id: 1, title: 'Did you know...?', subtitle: 'random trivia', user: mcz)
tv_proj = Project.find_or_create_by(title: "Pass the Remote", subtitle: "TV Trivia", user: mcz)


# --------PROMPT {content:string, prompt_type:string, project_id} --------
# --------ANSWER {content:string, prompt_id, correct:boolean} --------

# <<<<<<<<<<<<<>>>>>>>>>>>>> JSON COPY/PASTED FROM API <<<<<<<<<<<<<>>>>>>>>>>>>>
  tv_data = [
  {
      "category":"Entertainment: Television",
      "type":"multiple",
      "difficulty":"easy",
      "question":"In the TV show M*A*S*H, what was the nickname of Corporal Walter O'Reilly?",
       "correct_answer":"Radar",
       "incorrect_answers":["Hawkeye",
         "Hot Lips",
         "Trapper"]
 },
 {
    "category": "Entertainment: Television",
    "type": "multiple",
    "difficulty": "easy",
    "question": "What TV show is about a grandfather dragging his grandson around on adventures?",
    "correct_answer": "Rick &amp; Morty",
    "incorrect_answers": [
        "Family Guy",
        "South Park",
        "American Dad"
      ]
  },
  {
     "category": "Entertainment: Television",
     "type": "multiple",
     "difficulty": "easy",
     "question": "In which state of America was the Fresh Prince of Bel-Air born and raised in?",
     "correct_answer": "Pennsylvania",
     "incorrect_answers": [
         "Florida",
         "California",
         "New Jersey"
     ]
   },
  {
      "category": "Entertainment: Television",
      "type": "multiple",
      "difficulty": "easy",
      "question": "Who played Agent Fox Mulder in the TV sci-fi drama 'The X-Files'?",
      "correct_answer": "David Duchovny",
      "incorrect_answers": [
          "Gillian Anderson",
          "Robert Patrick",
          "Mitch Pileggi"
      ]
  },
  {
      "category": "Entertainment: Television",
      "type": "multiple",
      "difficulty": "easy",
      "question": "Which of these Bojack Horseman characters is a human?",
      "correct_answer": "Todd Chavez",
      "incorrect_answers": [
          "Lennie Turtletaub",
          "Princess Carolyn",
          "Tom Jumbo-Grumbo"
      ]
  },

  {
      "category": "Entertainment: Television",
      "type": "multiple",
      "difficulty": "easy",
      "question": "Which of these characters in 'Stranger Things' has the power of Telekinesis?",
      "correct_answer": "Eleven",
      "incorrect_answers": [
          "Mike",
          "Lucas",
          "Karen"
      ]
  },
  {
      "category": "Entertainment: Television",
      "type": "multiple",
      "difficulty": "easy",
      "question": "In the television show Breaking Bad, what is the street name of Walter and Jesse's notorious product?",
      "correct_answer": "Blue Sky",
      "incorrect_answers": [
          "Baby Blue",
          "Rock Candy",
          "Pure Glass"
      ]
  },
  {
      "category": "Entertainment: Television",
      "type": "multiple",
      "difficulty": "easy",
      "question": "In the show, Doctor Who, what does T.A.R.D.I.S stand for?",
      "correct_answer": "Time And Relative Dimensions In Space",
      "incorrect_answers": [
          "Time And Resting Dimensions In Space",
          "Time And Relative Dimensions In Style",
          "Toilet Aid Rope Dog Is Soup"
      ]
  },

  {
      "category": "Entertainment: Television",
      "type": "multiple",
      "difficulty": "easy",
      "question": "What Nickelodeon game show featured a house on the set that the contestants would ransack to find hidden objects?",
      "correct_answer": "Finders Keepers",
      "incorrect_answers": [
          "Double Dare",
          "Nickelodeon Guts",
          "Nick Arcade"
      ]
  },
  {
      "category": "Entertainment: Television",
      "type": "multiple",
      "difficulty": "easy",
      "question": "Grant Gustin plays which superhero on the CW show of the same name?",
      "correct_answer": "The Flash",
      "incorrect_answers": [
          "The Arrow",
          "Black Canary",
          "Daredevil"
      ]
  },
  {
      "category": "Entertainment: Television",
      "type": "multiple",
      "difficulty": "easy",
      "question": "What NBC sitcom once saw two of its characters try to pitch NBC on a sitcom about nothing?",
      "correct_answer": "Seinfeld",
      "incorrect_answers": [
          "Frasier",
          "Becker",
          "Friends"
      ]
  },
  {
    "category": "Entertainment: Television",
    "type": "multiple",
    "difficulty": "easy",
    "question": "Which of the following won the first season of American Idol in 2002?",
    "correct_answer": "Kelly Clarkson",
    "incorrect_answers": [
        "Justin Guarini",
        "Ruben Studdard",
        "Chris Daughtry"
    ]
  }
]

 game_data = [
  {
      "category": "Entertainment: Board Games",
      "type": "multiple",
      "difficulty": "easy",
      "question": "In a standard game of Monopoly, what colour are the two cheapest properties?",
      "correct_answer": "Brown",
      "incorrect_answers": [
          "Green",
          "Yellow",
          "Blue"
      ]
  },
  {
      "category": "Entertainment: Board Games",
      "type": "multiple",
      "difficulty": "easy",
      "question": "How many dots are on a single die?",
      "correct_answer": "21",
      "incorrect_answers": [
          "24",
          "15",
          "18"
      ]
  },
  {
      "category": "Entertainment: Board Games",
      "type": "multiple",
      "difficulty": "medium",
      "question": "The board game, Nightmare was released in what year?",
      "correct_answer": "1991",
      "incorrect_answers": [
          "1992",
          "1989",
          "1995"
      ]
  },
  {
      "category": "Entertainment: Board Games",
      "type": "multiple",
      "difficulty": "medium",
      "question": "How many points is the Z tile worth in Scrabble?",
      "correct_answer": "10",
      "incorrect_answers": [
          "8",
          "5",
          "6"
      ]
  },
  {
      "category": "Entertainment: Board Games",
      "type": "multiple",
      "difficulty": "easy",
      "question": "The board game Monopoly takes its street names from which real American city?",
      "correct_answer": "Atlantic City, New Jersey",
      "incorrect_answers": [
          "Las Vegas, Nevada",
          "Duluth, Minnesota",
          "Charleston, South Carolina"
      ]
  },
  {
      "category": "Entertainment: Board Games",
      "type": "multiple",
      "difficulty": "hard",
      "question": "The board game &quot;Ra&quot; was designed by which designer? ",
      "correct_answer": "Reiner Knizia",
      "incorrect_answers": [
          "Bruno Cathala",
          "Uwe Rosenburg",
          "Allison Kline"
      ]
  },
  {
      "category": "Entertainment: Board Games",
      "type": "multiple",
      "difficulty": "easy",
      "question": "When was the board game Twister, released to the public?",
      "correct_answer": "April 1966",
      "incorrect_answers": [
          "September 1965",
          "January 1969",
          "February 1966"
      ]
  },
  {
      "category": "Entertainment: Board Games",
      "type": "multiple",
      "difficulty": "medium",
      "question": "In what year was the card game Magic: the Gathering first introduced?",
      "correct_answer": "1993",
      "incorrect_answers": [
          "1987",
          "1998",
          "2003"
      ]
  }]


# <<<<<<<<>>>>>>>> PASS IN ARRAY OF PROMPT & 4 ANSWERS OBJECTS <<<<<<<<>>>>>>>>
tv_data.each do |obj|
  prompt = Prompt.find_or_create_by(prompt_type: "multiple-choice", project: tv_proj, content: obj[:question])


    Answer.find_or_create_by(prompt: prompt, correct: true, content: obj[:correct_answer])

    Answer.find_or_create_by(prompt: prompt, correct: false, content: obj[:incorrect_answers][0])

    Answer.find_or_create_by(prompt: prompt, correct: false, content: obj[:incorrect_answers][1])

    Answer.find_or_create_by(prompt: prompt, correct: false, content: obj[:incorrect_answers][2])

end


game_data.each do |obj|
  prompt = Prompt.find_or_create_by(prompt_type: "multiple-choice", project: game_proj, content: obj[:question])


    Answer.find_or_create_by(prompt: prompt, correct: true, content: obj[:correct_answer])

    Answer.find_or_create_by(prompt: prompt, correct: false, content: obj[:incorrect_answers][0])

    Answer.find_or_create_by(prompt: prompt, correct: false, content: obj[:incorrect_answers][1])

    Answer.find_or_create_by(prompt: prompt, correct: false, content: obj[:incorrect_answers][2])

end










# ***********************KEEP BETWEEN THESE COMMENTED OUT***********************
# api 10 multiple choice questions w/ answers
# 'https://opentdb.com/api.php?amount=10&category=27&type=multiple'

# ***********************KEEP BETWEEN THESE COMMENTED OUT***********************
