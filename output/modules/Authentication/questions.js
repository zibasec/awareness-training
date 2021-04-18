

test.AddQuestion( new Question ("com.scorm.ZibaSec.interactions.Authentication_1",
    "True or False: Usernames and passwords are the most secure way to authenticate?", 
    QUESTION_TYPE_TF,
    null,
    "False",
    "obj_Authentication")
    );      

test.AddQuestion( new Question ("com.scorm.ZibaSec.interactions.Authentication_2",
    "If you have to use something you know to authenticate, then passphrases are a good approach?", 
    QUESTION_TYPE_TF,
    null,
    "True",
    "obj_Authentication")
    );      

test.AddQuestion( new Question ("com.scorm.ZibaSec.interactions.Authentication_3",
    "Which of the following is the most secure method to authenticate?", 
    QUESTION_TYPE_CHOICE, 
    new Array("Something you know (passwords and passphrases)","Something you are (biometrics)","Something you have (for example, FIDO2 tokens)","Using multiple factors."),
    "Using multiple factors.",
    "obj_Authentication")
    );      


