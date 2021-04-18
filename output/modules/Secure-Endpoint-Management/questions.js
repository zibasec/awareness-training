

test.AddQuestion( new Question ("com.scorm.ZibaSec.interactions.Mobile-Endpoint-Security_1",
    "True or False: Attackers  can attack mobile devices through malicious charging stations.", 
    QUESTION_TYPE_TF,
    null,
    "True",
    "obj_Mobile-Endpoint-Security")
    );      

test.AddQuestion( new Question ("com.scorm.ZibaSec.interactions.Mobile-Endpoint-Security_2",
    "True or False: SMS (or texting) is secure by default and can be trusted.", 
    QUESTION_TYPE_TF,
    null,
    "False",
    "obj_Mobile-Endpoint-Security")
    );      

test.AddQuestion( new Question ("com.scorm.ZibaSec.interactions.Mobile-Endpoint-Security_3",
    "True or False: If your mobile device battery is unexpectedly drained in a short period of time, it could be compromised.", 
    QUESTION_TYPE_TF,
    null,
    "True",
    "obj_Mobile-Endpoint-Security")
    );      

test.AddQuestion( new Question ("com.scorm.ZibaSec.interactions.Mobile-Endpoint-Security_4",
    "Which of the following is not something you should do if you suspect your mobile device is compromised?", 
    QUESTION_TYPE_CHOICE, 
    new Array("Change/reset the credentials associated with any account that was accessible on the device.","Either get the device securely wiped or inspected by a provider that is capable of assessing the security of the device.","Have the device destroyed and securely disposed of.","Keep using the device normally."),
    "Keep using the device normally.",
    "obj_Mobile-Endpoint-Security")
    );      


