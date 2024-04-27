# Notaki - A Note-taking Application

## Introduction

Notaki is a note-taking web-application using Django framework. Including basic and light-weight functionalities.   <br />

For more information, follow the usages [here](#Functionalities)

## Installation

### Prerequisites

Before installing the application, make sure you have the following dependencies installed using ```pip install <package_name>``` :

- **libmysqlclient-dev**: for installing mysqlclient.
- **mysqlclient**: for connecting to local MySQL.
- **langchain**: for utilities of langchain library.
- **google-cloud-speech**: for speech-to-text note taking.
- **google-cloud-translate**: for translating the note content.
- **langchain-openai**: for supporting langchain in using OpenAI API.

### XAMPP Setup

1. Download and install XAMPP from [here](https://www.apachefriends.org/index.html).
2. Import the ```note_management.sql``` included in the repository.

### Running the Server

To run the server, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/phamphukhanh/ai-intergrated-note
    cd <repository_directory>
    ```

2. Install dependencies:

    ```bash
    pip install -r requirements.txt
    ```

3. Start the server:
    ```bash
    python manage.py runserver
    ```
    or
    ```bash
    python3 manage.py runserver
    ``` 
The server should now be running locally on your machine.

## Functionalities
Notice: The openaikey.py (OpenAI) and googlekey.json (Google Cloud) will not be included, you must add your keys in order to use integrated features. The files are placed in the main directory.<br />
Explore some basic functionalities such as:
  - Sign up/Sign in
  - Adding a new note
  - Deleting a note
  - Modifying an existed note
  - Searching for notes
  - Taking note by speech-to-text
  - Translating a note content
  - Summarizing a note content
