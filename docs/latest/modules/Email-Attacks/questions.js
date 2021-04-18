

test.AddQuestion( new Question ("com.scorm.OpenAT.interactions.Email-Attacks_1",
    "True or False: You can detect all email attacks by looking for grammatical errors.", 
    QUESTION_TYPE_TF,
    null,
    "False",
    "obj_Email-Attacks")
    );      

test.AddQuestion( new Question ("com.scorm.OpenAT.interactions.Email-Attacks_2",
    "True or False: Your email account is usually the most important account.", 
    QUESTION_TYPE_TF,
    null,
    "True",
    "obj_Email-Attacks")
    );      

test.AddQuestion( new Question ("com.scorm.OpenAT.interactions.Email-Attacks_3",
    "What should you not do to secure your email account?", 
    QUESTION_TYPE_CHOICE, 
    new Array("Use multi-factor authentication.","Click on links you weren't expecting.","Use strong passwords/passphrases.","Do not reuse credentials between your email and other accounts."),
    "Click on links you weren't expecting.",
    "obj_Email-Attacks")
    );      


