

test.AddQuestion( new Question ("com.scorm.OpenAT.interactions.Password-Managers_1",
    "True or False: Humans usually create strong passwords.", 
    QUESTION_TYPE_TF,
    null,
    "False",
    "obj_Password-Managers")
    );      

test.AddQuestion( new Question ("com.scorm.OpenAT.interactions.Password-Managers_2",
    "True or False: Reusing passwords for multiple accounts is a bad security practice.", 
    QUESTION_TYPE_TF,
    null,
    "True",
    "obj_Password-Managers")
    );      

test.AddQuestion( new Question ("com.scorm.OpenAT.interactions.Password-Managers_3",
    "True or False: In addition to using password managers, you should use multi-factor authentication whenever you can.", 
    QUESTION_TYPE_TF,
    null,
    "True",
    "obj_Password-Managers")
    );      

test.AddQuestion( new Question ("com.scorm.OpenAT.interactions.Password-Managers_4",
    "Which of the following is not a technique or tool adversaries use to attack weak password practices?", 
    QUESTION_TYPE_CHOICE, 
    new Array("Brute Force Attacks","Credential Stuffing","Password Lists","Keystroke Loggers"),
    "Keystroke Loggers",
    "obj_Password-Managers")
    );      


