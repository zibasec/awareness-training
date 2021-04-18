

test.AddQuestion( new Question ("com.scorm.OpenAT.interactions.Phishing-101_1",
    "True or False: Spear phishing targets large groups of employees?", 
    QUESTION_TYPE_TF,
    null,
    "False",
    "obj_Phishing-101")
    );      

test.AddQuestion( new Question ("com.scorm.OpenAT.interactions.Phishing-101_2",
    "True or False: Email sender addresses can be implicitly trusted?", 
    QUESTION_TYPE_TF,
    null,
    "False",
    "obj_Phishing-101")
    );      

test.AddQuestion( new Question ("com.scorm.OpenAT.interactions.Phishing-101_3",
    "Whaling is phishing targeting which group of employees?", 
    QUESTION_TYPE_CHOICE, 
    new Array("High-value: Senior Management, VP, C-Level, HR","Janitorial Staff","Contractors","Family of employees"),
    "High-value: Senior Management, VP, C-Level, HR",
    "obj_Phishing-101")
    );      


