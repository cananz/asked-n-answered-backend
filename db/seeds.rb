require 'rest-client'
require 'pry'
require 'JSON'

# --- USER {email:string, first_name:string, last_name:string, avatar:string}---
mcz = User.find_or_create_by(id: 1, email: 'marisa@email.com', first_name: 'marisa', last_name: 'canan')

# --------PROJECT {title:string, subtitle:string, user_id}--------
proj = Project.find_or_create_by(id: 2, title: "Let's Play", subtitle: 'How well do you know your favorite board games?', user: mcz)
# Project.find_or_create_by(id: 1, title: 'Did you know...?', subtitle: 'random trivia', user: mcz)

# --------PROMPT {content:string, prompt_type:string, project_id} --------
# --------ANSWER {content:string, prompt_id, correct:boolean} --------


# <<<<<<<<<<<<<>>>>>>>>>>>>> JSON COPY/PASTED FROM API <<<<<<<<<<<<<>>>>>>>>>>>>>
  # seed_data_1 = [
  #   {"category":"Entertainment: Television",
  #     "type":"multiple",
  #     "difficulty":"easy",
  #     "question":"In the TV show &#039;M*A*S*H&#039;, what was the nickname of Corporal Walter O&#039;Reilly?",
  #      "correct_answer":"Radar",
  #      "incorrect_answers":["Hawkeye",
  #        "Hot Lips",
  #        "Trapper"]},
  #
  #   {"category":"Animals",
  #     "type":"multiple",
  #     "difficulty":"hard",
  #     "question":"Which species of Brown Bear is not extinct?",
  #     "correct_answer":"Syrian Brown Bear",
  #     "incorrect_answers":["California Grizzly Bear",
  #       "Atlas Bear",
  #       "Mexican Grizzly Bear"]},
  #
  #   {"category":"Science: Mathematics",
  #     "type":"multiple",
  #     "difficulty":"hard",
  #     "question":"How many zeptometres are inside one femtometre?",
  #     "correct_answer":"1,000,000",
  #     "incorrect_answers":["10", "1,000,000,000", "1000"]},
  #
  #   {"category":"Art",
  #     "type":"multiple",
  #     "difficulty":"hard",
  #     "question":"Albrecht D&uuml;rer&#039;s birthplace and place of death were in...",
  #     "correct_answer":"N&uuml;rnberg",
  #     "incorrect_answers":["Augsburg", "Bamberg", "Berlin"]},
  #
  #   {"category":"Entertainment: Video Games",
  #     "type":"multiple",
  #     "difficulty":"easy",
  #     "question":"What is the default alias that Princess Garnet goes by in Final Fantasy IX?",
  #     "correct_answer":"Dagger",
  #     "incorrect_answers":["Dirk", "Garnet", "Quina"]},
  #
  #   {"category":"Science & Nature",
  #     "type":"multiple",
  #     "difficulty":"medium",
  #     "question":"A positron is an antiparticle of a what?",
  #     "correct_answer":"Electron",
  #     "incorrect_answers":["Neutron", "Proton", "Photon"]},
  #
  #   {"category":"Entertainment: Japanese Anime & Manga",
  #     "type":"multiple",
  #     "difficulty":"easy",
  #     "question":"On what medium was &quot;Clannad&quot; first created?",
  #     "correct_answer":"Visual novel",
  #     "incorrect_answers":["Anime", "Manga", "Light novel"]},
  #
  #   {"category":"Entertainment: Film",
  #     "type":"multiple",
  #     "difficulty":"easy",
  #     "question":"What was Bruce Campbell&#039;s iconic one-liner after getting a chainsaw hand in Evil Dead 2?",
  #     "correct_answer":"Groovy.",
  #     "incorrect_answers":["Gnarly.", "Perfect.", "Nice."]},
  #
  #   {"category":"Entertainment: Television",
  #     "type":"multiple",
  #     "difficulty":"medium",
  #     "question":"On the NBC show Community what was Star Burns&#039; real name?",
  #     "correct_answer":"Alex",
  #     "incorrect_answers":["Todd", "Neal", "Grimus"]},
  #
  #   {"category":"Entertainment: Music",
  #     "type":"multiple",
  #     "difficulty":"easy",
  #     "question":"Which music publication is often abbreviated to NME?",
  #     "correct_answer":"New Musical Express",
  #     "incorrect_answers":["New Metro Entertainment", "Next Musical Enterprise", "North Manchester Express"]}]

 # seed_data_2 = [
 #  {
 #      "category": "Entertainment: Board Games",
 #      "type": "multiple",
 #      "difficulty": "easy",
 #      "question": "In a standard game of Monopoly, what colour are the two cheapest properties?",
 #      "correct_answer": "Brown",
 #      "incorrect_answers": [
 #          "Green",
 #          "Yellow",
 #          "Blue"
 #      ]
 #  },
 #  {
 #      "category": "Entertainment: Board Games",
 #      "type": "multiple",
 #      "difficulty": "easy",
 #      "question": "How many dots are on a single die?",
 #      "correct_answer": "21",
 #      "incorrect_answers": [
 #          "24",
 #          "15",
 #          "18"
 #      ]
 #  },
 #  {
 #      "category": "Entertainment: Board Games",
 #      "type": "multiple",
 #      "difficulty": "medium",
 #      "question": "The board game, Nightmare was released in what year?",
 #      "correct_answer": "1991",
 #      "incorrect_answers": [
 #          "1992",
 #          "1989",
 #          "1995"
 #      ]
 #  },
 #  {
 #      "category": "Entertainment: Board Games",
 #      "type": "multiple",
 #      "difficulty": "medium",
 #      "question": "How many points is the Z tile worth in Scrabble?",
 #      "correct_answer": "10",
 #      "incorrect_answers": [
 #          "8",
 #          "5",
 #          "6"
 #      ]
 #  },
 #  {
 #      "category": "Entertainment: Board Games",
 #      "type": "multiple",
 #      "difficulty": "easy",
 #      "question": "The board game Monopoly takes its street names from which real American city?",
 #      "correct_answer": "Atlantic City, New Jersey",
 #      "incorrect_answers": [
 #          "Las Vegas, Nevada",
 #          "Duluth, Minnesota",
 #          "Charleston, South Carolina"
 #      ]
 #  },
 #  {
 #      "category": "Entertainment: Board Games",
 #      "type": "multiple",
 #      "difficulty": "hard",
 #      "question": "The board game &quot;Ra&quot; was designed by which designer? ",
 #      "correct_answer": "Reiner Knizia",
 #      "incorrect_answers": [
 #          "Bruno Cathala",
 #          "Uwe Rosenburg",
 #          "Allison Kline"
 #      ]
 #  },
 #  {
 #      "category": "Entertainment: Board Games",
 #      "type": "multiple",
 #      "difficulty": "hard",
 #      "question": "What was the development code name for the &quot;Weatherlight&quot; expansion for &quot;Magic: The Gathering&quot;, released in 1997?",
 #      "correct_answer": "Mocha Latte",
 #      "incorrect_answers": [
 #          "Decaf",
 #          "Frappuccino",
 #          "Macchiato"
 #      ]
 #  },
 #  {
 #      "category": "Entertainment: Board Games",
 #      "type": "multiple",
 #      "difficulty": "hard",
 #      "question": "In Magic: The Gathering, what was a tribute card to Jamie Wakefield&#039;s late wife Marilyn, who loved horses?",
 #      "correct_answer": "Timbermare",
 #      "incorrect_answers": [
 #          "Loyal Pegasus",
 #          "Vryn Wingmare",
 #          "Sungrace Pegasus"
 #      ]
 #  },
 #  {
 #      "category": "Entertainment: Board Games",
 #      "type": "multiple",
 #      "difficulty": "easy",
 #      "question": "When was the board game Twister, released to the public?",
 #      "correct_answer": "April 1966",
 #      "incorrect_answers": [
 #          "September 1965",
 #          "January 1969",
 #          "February 1966"
 #      ]
 #  },
 #  {
 #      "category": "Entertainment: Board Games",
 #      "type": "multiple",
 #      "difficulty": "medium",
 #      "question": "In what year was the card game Magic: the Gathering first introduced?",
 #      "correct_answer": "1993",
 #      "incorrect_answers": [
 #          "1987",
 #          "1998",
 #          "2003"
 #      ]
 #  }]

# <<<<<<<<>>>>>>>> PASS IN ARRAY OF PROMPT & 4 ANSWERS OBJECTS <<<<<<<<>>>>>>>>
d.each do |obj|
  p = Prompt.find_or_create_by(prompt_type: "multiple-choice", project: proj, content: obj[:question])

    # a =
    Answer.create(prompt: p, correct: true, content: obj[:correct_answer])
    # a.content = obj[:correct_answer]
    # w_one =
    Answer.create(prompt: p, correct: false, content: obj[:incorrect_answers][0])
    # w_one.content = obj[:incorrect_answers][0]
    # w_two =
    Answer.create(prompt: p, correct: false, content: obj[:incorrect_answers][1])
    # w_two.content = obj[:incorrect_answers][1]
    # w_three =
    Answer.create(prompt: p, correct: false, content: obj[:incorrect_answers][2])
    # w_three.content = obj[:incorrect_answers][2]
end













# ***********************KEEP BETWEEN THESE COMMENTED OUT***********************
# api 10 multiple choice questions w/ answers
# 'https://opentdb.com/api.php?amount=10&category=27&type=multiple'

# fetched = RestClient::Request.execute(method: :get, url: 'https://opentdb.com/api.php?amount=10&category=27&type=multiple')
# data = JSON.parse(fetched)
# seed_data = data['results']
# binding.pry
# ***********************KEEP BETWEEN THESE COMMENTED OUT***********************
