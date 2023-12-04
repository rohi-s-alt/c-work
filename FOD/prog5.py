from random import choice as c

element = {
    'Sentence_starter' : [
        'About 100 years ago', 
        'In the 20 BC', 
        'Once upon a time', 
        'In recent time'
        ] ,
    
    'character' : [
        ' there lived a king.', 
        ' there was a man named Jack.', 
        ' there lived a farmer.',
        ' there was a student.'
        ] ,

    'time' : [
        ' One day', 
        ' One full-moon night',
        ' Day before yesterday'
        ] ,

    'story_plot' : [
        ' he was passing by', 
        ' he was going for a picnic to',
        ' he was tired to go to'
        ] ,

    'place' : [
        ' the mountains', 
        ' the garden',
        ' the school'
        ] ,

    'second_character' : [
        ' he saw a man', 
        ' he saw a young lady',
        ' he saw his teacher'
        ] ,

    'age' : [
        ' who seemed to be in late 20s', 
        ' who seemed very old and feeble', 
        ' who seemed very angry'
        ] ,
    
    'work' : [
        ' searching something.', 
        ' digging a well on roadside.',
        ' coming forward to scold him.'
        ] 
    }

print(
    c(element['Sentence_starter']) + 
    c(element['character']) + 
    c(element['time']) + 
    c(element['story_plot']) + 
    c(element['place']) + 
    c(element['second_character']) + 
    c(element['age']) + 
    c(element['work'])
    )