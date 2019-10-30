require 'rest-client'
require 'pry'
require 'JSON'


mcz = User.find_or_create_by(id: 1, email: 'marisa@email.com', first_name: 'marisa', last_name: 'canan')

proj = Project.find_or_create_by(id: 1, title: 'Did you know...?', subtitle: 'random trivia', user: mcz)



  seed_data_1 = [
    {"category":"Entertainment: Television",
      "type":"multiple",
      "difficulty":"easy",
      "question":"In the TV show &#039;M*A*S*H&#039;, what was the nickname of Corporal Walter O&#039;Reilly?",
       "correct_answer":"Radar",
       "incorrect_answers":["Hawkeye",
         "Hot Lips",
         "Trapper"]},

    {"category":"Animals",
      "type":"multiple",
      "difficulty":"hard",
      "question":"Which species of Brown Bear is not extinct?",
      "correct_answer":"Syrian Brown Bear",
      "incorrect_answers":["California Grizzly Bear",
        "Atlas Bear",
        "Mexican Grizzly Bear"]},

    {"category":"Science: Mathematics",
      "type":"multiple",
      "difficulty":"hard",
      "question":"How many zeptometres are inside one femtometre?",
      "correct_answer":"1,000,000",
      "incorrect_answers":["10", "1,000,000,000", "1000"]},

    {"category":"Art",
      "type":"multiple",
      "difficulty":"hard",
      "question":"Albrecht D&uuml;rer&#039;s birthplace and place of death were in...",
      "correct_answer":"N&uuml;rnberg",
      "incorrect_answers":["Augsburg", "Bamberg", "Berlin"]},

    {"category":"Entertainment: Video Games",
      "type":"multiple",
      "difficulty":"easy",
      "question":"What is the default alias that Princess Garnet goes by in Final Fantasy IX?",
      "correct_answer":"Dagger",
      "incorrect_answers":["Dirk", "Garnet", "Quina"]},

    {"category":"Science & Nature",
      "type":"multiple",
      "difficulty":"medium",
      "question":"A positron is an antiparticle of a what?",
      "correct_answer":"Electron",
      "incorrect_answers":["Neutron", "Proton", "Photon"]},

    {"category":"Entertainment: Japanese Anime & Manga",
      "type":"multiple",
      "difficulty":"easy",
      "question":"On what medium was &quot;Clannad&quot; first created?",
      "correct_answer":"Visual novel",
      "incorrect_answers":["Anime", "Manga", "Light novel"]},

    {"category":"Entertainment: Film",
      "type":"multiple",
      "difficulty":"easy",
      "question":"What was Bruce Campbell&#039;s iconic one-liner after getting a chainsaw hand in Evil Dead 2?",
      "correct_answer":"Groovy.",
      "incorrect_answers":["Gnarly.", "Perfect.", "Nice."]},

    {"category":"Entertainment: Television",
      "type":"multiple",
      "difficulty":"medium",
      "question":"On the NBC show Community what was Star Burns&#039; real name?",
      "correct_answer":"Alex",
      "incorrect_answers":["Todd", "Neal", "Grimus"]},

    {"category":"Entertainment: Music",
      "type":"multiple",
      "difficulty":"easy",
      "question":"Which music publication is often abbreviated to NME?",
      "correct_answer":"New Musical Express",
      "incorrect_answers":["New Metro Entertainment", "Next Musical Enterprise", "North Manchester Express"]}]



#
d.each do |obj|

  p = Prompt.find_or_create_by(prompt_type: "multiple-choice", project: proj, content: obj[:question])

  # if p.valid?
    a = Answer.create(prompt: p, correct: true, content: obj[:correct_answer])
    # a.content = obj[:correct_answer]

    w_one = Answer.create(prompt: p, correct: false, content: obj[:incorrect_answers][0])
    # w_one.content = obj[:incorrect_answers][0]
    w_two = Answer.create(prompt: p, correct: false, content: obj[:incorrect_answers][1])
    # w_two.content = obj[:incorrect_answers][1]
    w_three = Answer.create(prompt: p, correct: false, content: obj[:incorrect_answers][2])
    # w_three.content = obj[:incorrect_answers][2]
  # end
end







# api 10 multiple choice questions w/ answers
# 'https://opentdb.com/api.php?amount=10&category=27&type=multiple'
#
#

# d = RestClient::Request.execute(method: :get, url: 'https://opentdb.com/api.php?amount=1&category=27&type=multiple')
#
# data = JSON.parse(d)
#
# objects = data['results']
