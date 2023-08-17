<!-- readme top tag -->

<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<h1 align="center">Nota</h1>
<br />

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
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- [![MIT License][license-shield]][license-url] -->

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#demo">Demo</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#packages-used">Packages used</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

## Demo

<div name="demo" align="center">

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<h3>Create notes with rich text editing tools!</h3>

![createNote](https://github.com/itsmosalah/nota/assets/88220582/fcd8036e-adba-496f-bec3-af1b7dcd8995)

<br/>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<h3>Create labels to organize your notes and filter them with ease!</h3>

![filteringByLabels](https://github.com/itsmosalah/nota/assets/88220582/3615a168-ffa3-4ed7-b390-7d5e10aa5537)

<br/>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<h3>Set your favorite theme and enable dark mode!</h3>

![themeOptions](https://github.com/itsmosalah/nota/assets/88220582/66bf4d3c-5ec2-4298-9184-51618a6f8688)

</div>

<!-- GETTING STARTED -->

## Getting Started

This is a simple mobile app fully made with Flutter. To run the project locally:

-   Make sure to have the latest version of [Flutter](https://docs.flutter.dev/get-started/install) installed on your machine.
-   Download the project files either by cloning or downloading the project as ZIP.
-   Install the dependencies with `flutter pub get`.
-   Make sure to have a physical Android device with USB drivers installed or an Android emulator to run this app on.
    **Important note: This app has only been tested on Android 12.**

### Prerequisites

-   [Flutter](https://docs.flutter.dev/get-started/install)

### Installation

1. Clone the repo
    ```sh
    git clone https://github.com/itsmosalah/nota.git
    ```
2. Install dependencies using flutter pub
    ```sh
    flutter pub get
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- PACKAGES USED -->

## Packages used

<div name="packages-used">

-   [flutter_bloc](https://pub.dev/packages/flutter_bloc) | for state management.
-   [flutter_quill](https://pub.dev/packages/flutter_quill) | for rich text editing.
-   [sqflite](https://pub.dev/packages/sqflite) | for local database.
-   [path](https://pub.dev/packages/path) | for finding local database path.
-   [flutter_colorpicker](https://pub.dev/packages/flutter_colorpicker) | for picking custom colors when creating labels.
-   [theme_provider](https://pub.dev/packages/theme_provider) | for providing theme data across the app.

</div>

<!-- ROADMAP -->

## Roadmap

-   [x] Create Notes and save them in local database.
-   [x] Create Labeling system with label filters.
-   [x] Add themes options with dark mode.
-   [ ] Add options to customize the notes order.
    -   [ ] Add sorting options.
    -   [ ] Add an option to pin notes.
-   [ ] Create unit and widget tests.
-   [ ] Create a documentation for project design.

See the [open issues](https://github.com/itsmosalah/nota/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

Mohamed Abdelrahman - mohamed.s.abdelrahman02@gmail.com -

Project Link: [https://github.com/itsmosalah/nota](https://github.com/itsmosalah/nota)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/itsmosalah/nota.svg?style=for-the-badge
[contributors-url]: https://github.com/itsmosalah/nota/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/itsmosalah/nota.svg?style=for-the-badge
[forks-url]: https://github.com/itsmosalah/nota/network/members
[stars-shield]: https://img.shields.io/github/stars/itsmosalah/nota.svg?style=for-the-badge
[stars-url]: https://github.com/itsmosalah/nota/stargazers
[issues-shield]: https://img.shields.io/github/issues/itsmosalah/nota.svg?style=for-the-badge
[issues-url]: https://github.com/itsmosalah/nota/issues
[license-shield]: https://img.shields.io/github/license/itsmosalah/nota.svg?style=for-the-badge
[license-url]: https://github.com/itsmosalah/nota/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/mosalah02
