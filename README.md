# pacific_kode_job_app

##This project is to help users to find a job.

##Features:
    #BLoC
    #API Integration with REST
    #Save favorites in local storage
    #Scrollable listviews
    #Search/Filter
    #Support Dark/Light modes

##Setup Instructions
    -Android Studio or VS Code with flutter and dart plugins
    -Real mobile device or emulator
    -Git
    -Dart SDK
    -[Flutter SDK](https://docs.flutter.dev/get-started)
    -For Windows : Install flutter and set the path in environmental variables
    -[REST API] (https://jsonbin.io/) the API hosted in a free mocking site, it will
        only valid for 24 hours and 100 read counts.
    - [JSON File] (https://drive.google.com/file/d/1X3QBGSoZdLg6ZbEuEAVhtIMivDXguFV1/view?usp=sharing) Please download the Response
        JSON file for any reference.
    
##Architecture
    -The BLoC architecture pattern is used to separate the Business Logic and the UI.
    -The event is triggered form the UI and it will process through the bloc and fetching the response
        via repository and HTTP API client. 
    - According to the response, the bloc emits the related state and it will catch using listners
        implemented in the UI.
    -If the state is success the data bind to the UI.

##Time Duration: 5 hours
