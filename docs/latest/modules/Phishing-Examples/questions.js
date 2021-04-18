

test.AddQuestion( new Question ("com.scorm.OpenAT.interactions.Phishing-Examples_1",
    "Verifying a sender's email address is sufficient.", 
    QUESTION_TYPE_TF,
    null,
    "False",
    "obj_Phishing-Examples")
    );      

test.AddQuestion( new Question ("com.scorm.OpenAT.interactions.Phishing-Examples_2",
    "The big red alert banner on my email client is okay to ignore.", 
    QUESTION_TYPE_TF,
    null,
    "False",
    "obj_Phishing-Examples")
    );      

test.AddQuestion( new Question ("com.scorm.OpenAT.interactions.Phishing-Examples_3",
    "When is it okay to open attachments in email?", 
    QUESTION_TYPE_CHOICE, 
    new Array("Always.","Only when from a known contact.","Never.","Only when expected and from a known contact."),
    "Only when expected and from a known contact.",
    "obj_Phishing-Examples")
    );      


