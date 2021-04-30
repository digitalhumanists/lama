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
  <a href="https://github.com/anneferger/lama/blob/main/logo/logo.png">
    <img src="https://github.com/anneferger/lama/blob/main/logo/logo.png" alt="Logo" width="300" height="141">
  </a>

  <h3 align="center">LAMA - your friendly and easy git script</h3>

  <p align="center">
    LAMA (Linguistic Automation Management Assistant) was initially developed in the project <a href="https://inel.corpora.uni-hamburg.de">INEL</a> to simplify and error-proof using <a href="git-scm.com">git</a> for linguists/non-tech collaborators. 
    <br />
    <br />
    <a href="https://github.com/anneferger/lama/issues">Report Bug</a>
    ·
    <a href="https://github.com/anneferger/lama/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the project](#about-the-project)
* [Setting up](#setting-up)
* [Using LAMA](#using-lama)
* [Additional versions of LAMA](#additional-versions-of-lama)
* [Contributing](#contributing)
* [License](#license)
* [Authors](#authors)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About the project

LAMA (Linguistic Automation Management Assistant) was created in the project [INEL](https://inel.corpora.uni-hamburg.de) to simplify and error-proof using [git](git-scm.com)
for linguists/non-tech people. 

While technically it is a quite basic shell script, it was created with lots of experience of teaching non-tech people using git with available GUIs as well as spending time fixing problems because of that. Therefore, on the one hand it is restricted to the most basic functionality needed for the every-day work with git, on the other hand it goes beyond git in providing the possibility to integrate processing steps to enhance data quality and for instance reduce the risk and frequency of git merge issues.

The script is intended for people that do not want to learn specific git commands while still being able to collaborate with other git users on projects, especially in a setup where there are technical git maintainers and other collaborators.

Please note that with this script it is assumed that the git repository was already cloned and setup properly before. If git lfs was also set up correctly the script works correctly with lfs as well.

# Setting up

To use the basic version you only need the file LAMA-3.1.sh. It should be placed inside of the cloned git repository you want to work with. For multiple repositories, use multiple LAMA files. If your remote repository is "origin" and the branch you want to work with "main" you don't need to change any variables, otherwise change the variables remote and branch in the LAMA script.

## Running the script

* On Windows, install the git-bash and let the git-bash open bash scripts by default, then you can just double click LAMA and follow the steps in [Using LAMA](#using-lama).
* On Linux, run the LAMA via `bash LAMA-3.1.sh` from the terminal.
* On Mac, please convert the line endings of the LAMA script to LF as EOL symbols. Also coreutils needs to be installed, e.g. using `brew install coreutils`.

Feel free to open [issues][issues-url] or send us a [message](#contact) if you run into any problems!

For more complex versions of the scripts please see [Additional versions of LAMA](#additional-versions-of-lama).

<!-- USAGE EXAMPLES -->
# Using LAMA

To run LAMA, double click on the LAMA-*.sh file located in the folder you want to work on.

The menu of LAMA looks like this:

<img src="https://github.com/anneferger/lama/blob/main/logo/menu-screenshot.png" alt="Image" width="700" >

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

<img src="https://github.com/anneferger/lama/blob/main/logo/merge-screenshot.png" alt="Image" width="700" >

If you see these lines, the correct commit message is already written there automatically. To confirm the message and continue with the script, press *ESC, then enter the letters :wq and press ENTER*.
If you're not able to enter the letters :wq after you pressed ESC, press the letter i instead and write :wq and press ENTER.
 

(If two people worked on the same part of the same file at once it can rarely lead to a Git conflict. If that happens, you will get a message in LAMA and a file timestamp-git-conflict.txt 
will be written in your folder. This kind of conflict needs to be solved by the technical team, so write a message if it happens to you.
But your data will still be save and it does not take long to solve this.)

## Work further on the files and Save all your changes, add a message, publish your changes to the main Git repository and update your local Git repository afterwards

Now you can work on the files again and save and publish your changes afterwards. Remember to start with the first step again if you make a pause. 

## "Secret" option 0 : enter any command

For administration purposes and seldomly necessary commands a "secret" option has been added to LAMA. 

When the option 0 (instead of 1-7) is entered in the selection menu, it is possible to enter any command, e.g. for cloning Git repositories or other actions not covered by the official LAMA options.

Special care has to be taken when this option is used because it gives full access to all available terminal commands (incl. file deletion)!

<pre>
Please choose an option (1-7) or press ENTER to display menu: 0
Enter your command (but take care, you have superpowers now) or just press ENTER to go back: 
> 
</pre>

# Additional versions of LAMA 

## LAMA in German

There is a version of the LAMA script available in German [here](https://github.com/anneferger/lama/tree/main/LAMA-German). It contains the Mattermost and corpus-services integration, but you could comment out the respective parts to use the basic version in German. There is also a German documentation of using LAMA [here](https://github.com/anneferger/lama/blob/main/LAMA-German/LAMA%20_de.md).

## LAMA with Mattermost Messages

There is a more complex version of LAMA which sends messaged to Mattermost if a respective hook is provided available [here](https://github.com/anneferger/lama/tree/main/LAMA-Mattermost). Replace the variable mattermosturl="https://your.mattermost.server.com/mattermost/hooks/HOOKSHA" with you Mattermost Webhook URL. Find out more about how to create Mattermost Webhooks [here](https://docs.mattermost.com/developer/webhooks-incoming.html).

## LAMA with corpus services

The most complex version of LAMA contains integration of the [corpus services](https://github.com/anneferger/corpus-services) tool using its jar. It is used when working with [EXMARaLDA](https://exmaralda.org/en/) corpora and git for pretty printing and normalizing of the transcription files. It also contains the Mattermost integration. See [here](https://github.com/anneferger/lama/tree/main/LAMA-corpus-services).

<!-- LIBRARIES -->
## To be used with

[git](http://git-scm.com/)
<br />
optionally:
<br />
[Mattermost](https://mattermost.com/)
<br />
[corpus services](https://github.com/anneferger/corpus-services)

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/anneferger/lama/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Feel free to open [issues][issues-url] or send us a [message](#contact) if you run into any problems!

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

Project Link: [LAMA](https://github.com/anneferger/lama)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

Contributions to the project have been made by staff from [INEL](https://inel.corpora.uni-hamburg.de).

<sub>Parts of this project have been produced in the context of the joint research funding of the German Federal Government and Federal States in the Academies’ Programme, with funding from the Federal Ministry of Education and Research and the Free and Hanseatic City of Hamburg. The Academies’ Programme is coordinated by the Union of the German Academies of Sciences and Humanities.</sub>

This README file was created on the basis of the [Best-README-Template](https://github.com/othneildrew/Best-README-Template/blob/master/README.md).
<br />
Logo created at [LogoMakr.com](https://logomakr.com/).

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=flat-square
[contributors-url]: https://github.com/anneferger/lama/graphs/contributors
[forks-url]: https://github.com/anneferger/lama/-/forks
[issues-url]: https://github.com/anneferger/lama/issues
[license-url]: https://github.com/anneferger/lama/blob/main/LICENSE

