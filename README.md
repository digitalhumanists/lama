<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[Contributors][contributors-url]
·
[Forks][forks-url]
·
[Issues][issues-url]
·
[License][license-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/raw/main/images/logo.png">
    <img src="https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/raw/main/images/logo.png" alt="Logo" width="300" height="125">
  </a>

  <h3 align="center">LAMA - your friendly and easy git script</h3>

  <p align="center">
    LAMA (= Linguistic Automation Management Assistent) was created in the project [INEL](https://inel.corpora.uni-hamburg.de) to simplify and error-proof using [git](git-scm.com)
for linguists/non-tech collaborators. 
    <br />
    <br />
    <a href="https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/issues">Report Bug</a>
    ·
    <a href="https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [Using LAMA](#usaging-lama)
* [Contributing](#contributing)
* [License](#license)
* [Authors](#authors)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project

LAMA (= Linguistic Automation Management Assistent) was created in the project [INEL](https://inel.corpora.uni-hamburg.de) to simplify and error-proof using [git](git-scm.com)
for linguists/non-tech people. 

While it is a very basic shell script, it was created after lots of experience of teaching non-tech people git with available GUIs as well as spending time fixing problems because of that.

The script is intended for people that do not want to learn specific git commands while still being able to collaborate with other git users on projects, especially in a setup where there are technical git maintainers and other collaborators.

Please note that with this script it is assumed that the git repository was already cloned and setup properly before. If git lfs was also set up correctly the script works correctly with lfs as well.

<!-- USAGE EXAMPLES -->
# Using LAMA

Working with LAMA consists of some steps that need to be carried out in a specific order:

## Viewing your current configuration (4)

Before starting to work, first make sure your username and email in LAMA is correct.
You can use the following option to do so:
*@ 4) Viewing your current configuration@*

The username should be your *@Firstname Lastname@* and the email should be your email address *@example@example.com@*.
You can change it using 
*@5) Setting up your configuration@*

##  Update your local repository (2)

Before starting to work on the files, you need to make sure to work on the most recent version 
of the files. You can update your copy of the files using this option:
*@2) Update your local repository@*

This checks that there are no changes to begin with and then updates your files. If there are changes 
it does not change the files. If you want to see which changes there are you can use:
*@1) See the current state of your local repository@*.

## Work on the files

Now you can start to work on the files and make changes.

## Save all your changes, add a message, publish your changes to the main repository and update your local repository (3)

When on step of the work is done, you can save your progress and make it available for the
other people working on it. You can do this with 
*@3) Save all your changes, add a message, publish your changes to the main repository and update your local repository@*

This steps additionally updates you local repository with the changes other people may have done at the same time. 

If someone else worked on the files while you made changes, the script can show the following lines:

<img src="https://sarafordnet.files.wordpress.com/2017/02/image82.png" alt="Image" width="700" >

If you see these lines, the correct commit message is already written there automatically. To confirm the message and continue with the script, press *ESC, then enter the letters :wq and press ENTER*.
If you're not able to enter the letters :wq after you pressed ESC, press the letter i instead and write :wq and press ENTER.
 

(If two people worked on the same part of the same file at once it can rarely lead to a Git conflict. If that happens, you will get a message in LAMA and a file timestamp-git-conflict.txt 
will be written in your folder. This kind of conflict needs to be solved by the technical team, so write a message if it happens to you.
But your data will still be save and it does not take long to solve this.)

## Work further on the files and Save all your changes, add a message, publish your changes to the main Git repository and update your local Git repository afterwards

Now you can work on the files again and save and publish your changes afterwards. Remember to start with the first step again if you make a pause. 

To run LAMA, double click on the LAMA-*.sh file located in the folder you want to work on. 
The menu looks like this:

<pre>
Welcome to Git with LAMA

1) See the current state of your local repository.
2) Update your local repository.
3) Save all your changes, add a message, publish your changes to the main repository and update your local repository.
4) Viewing your current configuration.
5) Setting up your configuration.
6) Help!
7) Quit

Please choose an option (1-7) or press ENTER to display menu:
</pre>

# Additional versions of LAMA 

## LAMA in German

There is a version of the LAMA script available in German [here](https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/tree/main/LAMA-German). It contains the Mattermost and corpus-services integration, but you could comment out the respective parts to use the basic version in German. There is also a German documentation of using LAMA [here](https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/tree/main/LAMA-German/LAMA _de.md).

## LAMA with Mattermost Messages

There is a more complex version of LAMA which sends messaged to Mattermost if a respective hook is provided available [here](https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/tree/main/LAMA-Mattermost). Replace the variable mattermosturl="https://your.mattermost.server.com/mattermost/hooks/HOOKSHA" with you Mattermost Webhook URL. Find out more about how to create Mattermost Webhooks [here](https://docs.mattermost.com/developer/webhooks-incoming.html).

## LAMA with corpus services

The most complex version of LAMA contains integration of the [corpus services](https://gitlab.rrz.uni-hamburg.de/corpus-services/corpus-services) tool using its jar. It is used when working with [EXMARaLDA](https://exmaralda.org/en/) corpora and git for pretty printing and normalizing of the transcription files. It also contains the Mattermost integration. See [here](https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/tree/main/LAMA-corpus-services).

<!-- LIBRARIES -->
## To be used with

[git](http://git-scm.com/)
<br />
optionally:
<br />
[Mattermost](https://mattermost.com/)
<br />
[corpus services](https://gitlab.rrz.uni-hamburg.de/corpus-services/corpus-services)

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- LICENSE -->
## License

Distributed under MIT License. See `LICENSE` for more information.

<!-- AUTHORS -->
## Authors

Anne Ferger

Daniel Jettka

<!-- CONTACT -->
## Contact

Anne Ferger - [@anneferger1](https://twitter.com/anneferger1) - anne.ferger@mail.de

Project Link: [LAMA](https://gitlab.rrz.uni-hamburg.de/corpus-services/lama)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

Contributions to the project have been made by staff from [INEL](https://inel.corpora.uni-hamburg.de).

<sub>Parts of this project have been produced in the context of the joint research funding of the German Federal Government and Federal States in the Academies’ Programme, with funding from the Federal Ministry of Education and Research and the Free and Hanseatic City of Hamburg. The Academies’ Programme is coordinated by the Union of the German Academies of Sciences and Humanities.</sub>

This README file was created on the basis of the [Best-README-Template](https://github.com/othneildrew/Best-README-Template/blob/master/README.md).
<br />
Logo created at LogoMakr.com.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=flat-square
[contributors-url]: https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/graphs/main
[forks-url]: https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/forks
[issues-url]: https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/issues
[license-url]: https://gitlab.rrz.uni-hamburg.de/corpus-services/lama/-/blob/main/LICENSE

