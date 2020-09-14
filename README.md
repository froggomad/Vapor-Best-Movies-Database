<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
***
***
***
*** To avoid retyping too much info. Do a search and replace for the following:
*** github_username, repo_name, twitter_handle, email
-->





<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/froggomad/Vapor-Best-Movies-Database">
    <img src="https://vapor.codes/img/logo.7c12f228.png" alt="Logo" width="80" height="80">
  </a>
  <a href="https://github.com/froggomad/Vapor-Best-Movies-Database">
    <img src="https://i.pinimg.com/originals/e5/c2/52/e5c252e15c98f80ee030e1ef6f04bef6.png" alt="Logo" width="80" height="80">
  </a>
  
  

  <h3 align="center">Best Movies Database</h3>

  <p align="center">
    Featuring actors, movies, and a Many-to-many relationship between them.
    <br />
    <a href="https://github.com/froggomad/Vapor-Best-Movies-Database/tree/master/Documentation"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://best-movies-db.herokuapp.com/movies">View Movies</a>
	·
	<a href="https://best-movies-db.herokuapp.com/actors">View Actors</a>
    ·
    <a href="https://github.com/froggomad/Vapor-Best-Movies-Database/issues">Report Bug</a>
    ·
    <a href="https://github.com/froggomad/Vapor-Best-Movies-Database/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#initial-setup)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project

![GET Movies][product-screenshot]

### Built With

* [Vapor 4](https://vapor.codes/)
* [Swift 5](https://developer.apple.com/swift/)
* [Xcode 11.6](https://developer.apple.com/xcode/)



<!-- GETTING STARTED -->
## Getting Started

To get up and running follow these simple steps.

### Prerequisites

This is what you need to use this repo.
* Swift 5
* Vapor 4

## Initial Setup

1. Setup New Vapor Project with Postgres in Terminal
  - `$:` vapor new MyCoolProjectName
  - `use fluent?:` Y
  - `choose database type:` 1. Postgres

2. [Database Setup](Documentation/DBSetup.md)

3. [Heroku Deployment](Documentation/HerokuSetup.md)




<!-- USAGE EXAMPLES -->
## Usage

* [GET Movies](https://best-movies-db.herokuapp.com/movies)

* [POST Movie](https://best-movies-db.herokuapp.com/movies) - Include `{"title":"foo"}` in your request body

* [GET Actors](https://best-movies-db.herokuapp.com/actors)

* [POST Actors](https://best-movies-db.herokuapp.com/actors) - Include `{"name":"foo"}` in your request body

* Link Actor To Movie (and vice-versa) - https://best-movies-db.herokuapp.com/movies/`movie_id`/actors/`actor_id`



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/froggomad/Vapor-Best-Movies-Database/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Kenny Dubroff - [@KennyDubroff](https://twitter.com/KennyDubroff) - kenny.dubroff@kennydubroff.com

Project Link: [https://github.com/froggomad/Vapor-Best-Movies-Database](https://github.com/froggomad/Vapor-Best-Movies-Database)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [Ray Wenderlich Server-Side Swift](https://www.raywenderlich.com/server-side-swift)
* [Mohammad Azam](https://www.udemy.com/user/mohammad-azam-2/)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/froggomad/Vapor-Best-Movies-Database.svg?style=flat-square
[contributors-url]: https://github.com/froggomad/Vapor-Best-Movies-Database/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/froggomad/Vapor-Best-Movies-Database.svg?style=flat-square
[forks-url]: https://github.com/froggomad/Vapor-Best-Movies-Database/network/members
[stars-shield]: https://img.shields.io/github/stars/froggomad/Vapor-Best-Movies-Database.svg?style=flat-square
[stars-url]: https://github.com/froggomad/Vapor-Best-Movies-Database/stargazers
[issues-shield]: https://img.shields.io/github/issues/froggomad/Vapor-Best-Movies-Database.svg?style=flat-square
[issues-url]: https://github.com/froggomad/Vapor-Best-Movies-Database/issues
[license-shield]: https://img.shields.io/github/license/froggomad/Vapor-Best-Movies-Database.svg?style=flat-square
[license-url]: https://github.com/froggomad/Vapor-Best-Movies-Database/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/froggomad
[product-screenshot]: images/best-movies-Insomnia.png

