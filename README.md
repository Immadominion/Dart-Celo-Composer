<!-- TITLE -->
<p align="center">
  <img width="100px" src="https://github.com/celo-org/celo-composer/blob/main/images/readme/celo_isotype.svg" align="center" alt="Celo" />
 <h2 align="center">Celo Composer Dart CLI</h2>
 <p align="center">Build, deploy, and iterate quickly on decentralized applications using Celo with Dart.</p>
</p>
  <p align="center">
    <a href="https://github.com/your-org/celo-composer-dart/graphs/stars">
      <img alt="GitHub Contributors" src="https://img.shields.io/github/stars/your-org/celo-composer-dart?color=FCFF52" />
    </a>
    <a href="https://github.com/your-org/celo-composer-dart/graphs/contributors">
      <img alt="GitHub Contributors" src="https://img.shields.io/github/contributors/your-org/celo-composer-dart?color=E7E3D4" />
    </a>
    <a href="https://github.com/your-org/celo-composer-dart/issues">
      <img alt="Issues" src="https://img.shields.io/github/issues/your-org/celo-composer-dart?color=E7E3D4" />
    </a>
    <a href="https://github.com/your-org/celo-composer-dart/pulls">
      <img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr/your-org/celo-composer-dart?color=E7E3D4" />
    </a>
    <a href="https://opensource.org/license/mit/">
      <img alt="MIT License" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
    </a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->

<div>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
      <ol>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#prerequisites">Prerequisites</a></li>
     </ol>
    <li><a href="#how-to-use-celo-composer-dart">How to use Celo Composer Dart</a></li>
        <ol>
          <li><a href="#install-dependencies">Install Dependencies</a></li>
          <li><a href="#deploy-a-smart-contract">Deploy a Smart Contract</a></li>
          <li><a href="#deploy-your-dapp-locally">Deploy your Dapp Locally</a></li>
          <li><a href="#add-ui-components">Add UI Components</a></li>
          <li><a href="#deploy-with-vercel">Deploy with Vercel</a></li>
          <li><a href="#supported-frameworks">Supported Frameworks</a></li>
          <li><a href="#supported-templates">Supported Templates</a></li>
        </ol>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#support">Support</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</div>

<!-- ABOUT THE PROJECT -->

## About The Project

Celo Composer Dart CLI allows you to quickly build, deploy, and iterate on decentralized applications using Celo with Dart. It provides a number of frameworks, templates, deployment and component support, and Celo specific functionality to help you get started with your next dApp.

It is the perfect lightweight starter-kit for any hackathon and for quickly testing out integrations and deployments on Celo.

<p align="right">(<a href="#top">back to top</a>)</p>

## Built With

Celo Composer Dart CLI is built on Celo to make it simple to build dApps using a variety of front-end frameworks, and libraries.

- [Celo](https://celo.org/)
- [Solidity](https://docs.soliditylang.org/en/v0.8.19/)
- [Dart](https://dart.dev/)
- [web3dart](https://pub.dev/packages/web3dart)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Prerequisites

- Dart SDK (v2.14.0 or higher)
- Git (v2.38 or higher)

## How to use Celo Composer Dart

The easiest way to start with Celo Composer Dart is using the CLI tool. This CLI tool lets you quickly start building dApps on Celo, including several templates. To get started, just run the following command, and follow the steps:

- Step 1

```bash
dart run lib/commands/create.dart -n my_project_name
```

- Step 2: Provide the Project Name: You will be prompted to enter the name of your project.

```text
What is your project name:
```

- Step 3: Choose to Use a Template: You will be asked if you want to use a template. Select `Yes` or `No`.

```text
Do you want to use a template? (Y/n)
```

- Step 4: Select a Template: If you chose to use a template, you will be prompted to select a template from the list provided.

```text
- Minipay
- Valora
```

- Step 5: Provide the Project Owner's Name: You will be asked to enter the project owner's name.

```text
Project Owner name:
```

- Step 6: Wait for Project Creation: The CLI will now create the project based on your inputs. This may take a few minutes.

- Step 7: Follow the instructions to start the project. The same will be displayed on the console after the project is created.

```text
🚀 Your starter project has been successfully created!
```

## Install Dependencies

Once your custom dApp has been created, just install dependencies:

```bash
   dart pub get
```

## Deploy a Smart Contract

Find the detailed instructions on how to run your smart contract in the `README.md` file of the generated project.

For quick development follow these three steps:

1. Change `lib/env.template` to `lib/env.dart` and add your `PRIVATE_KEY` into the `.env` file.
2. Make sure your wallet is funded when deploying to testnet or mainnet. You can get test tokens for deploying it on Alfajores from the [Celo Faucet](https://faucet.celo.org/alfajores).
3. Run the following commands from the project folder to deploy your smart contract to the Celo Testnet Alfajores:

```bash
dart run lib/deploy.dart --network alfajores
```

## Deploy your Dapp Locally

Find the detailed instructions on how to run your frontend in the `README.md` file of the generated project.

Before you start the project, please follow these steps:

1. Rename the file:
   `lib/env.template` to `lib/env.dart`

2. Open the newly renamed `env.dart` file and add your WalletConnect Cloud Project ID from [WalletConnect Cloud](https://cloud.walletconnect.com/)

Once you've done that, you're all set to start your project!

Run the following commands from the project folder to start the project:

```bash
   dart run
```

Thank you for using Celo Composer Dart! If you have any questions or need further assistance, please refer to the README or reach out to our team.

**_🔥Voila, you have a dApp ready to go. Start building your dApp on Celo._**

## Add UI Components

To keep the Celo Composer Dart as lightweight as possible we didn't add any components but rather a guide on how to add the components you need yourself with a very simple to use components library. To learn how to add UI components, refer to the [UI Components Guide](./docs/UI_COMPONENTS.md).

## Deploy with Vercel

The Celo Composer Dart is a great tool for hackathons and fast deployments. We created a guide for you, using the Vercel CLI to create a live deployment in minutes. For detailed instructions on deploying the app using Vercel CLI, refer to the [Deployment Guide](./docs/DEPLOYMENT_GUIDE.md).

## Supported Frameworks

### Dart

- Support for Website and Progressive Web Application.
- Works with all major crypto wallets.

Check [Dart docs](https://dart.dev/guides) to learn more about it.

### Solidity

- Robust framework for building and testing smart contracts.
- Compatible with various Ethereum development tools and plugins.

Check [Solidity docs](https://docs.soliditylang.org/en/v0.8.19/) to learn more about it.

## Supported Templates

### Minipay

- Pre-built template for creating a mini-payment application.
- Seamless integration with Celo blockchain for handling payments.

Checkout [minipay docs](https://docs.celo.org/developer/build-on-minipay/overview) to learn more about it.

### Valora

- Template designed for Valora wallet integration.
- Facilitates easy wallet connectivity and transaction management.

Checkout [valora docs](https://docs.valora.xyz/) to learn more about it.

## Support

Join the Celo Discord server at <https://chat.celo.org>. Reach out on the dedicated repo channel [here](https://discord.com/channels/600834479145353243/941003424298856448).

<!-- ROADMAP -->

## Roadmap

See the [open issues](https://github.com/your-org/celo-composer-dart/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing

We welcome contributions from the community.

<p align="right">(<a href="#top">back to top</a>)</p>

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<!-- CONTACT -->

## Contact

- [@CeloDevs](https://twitter.com/CeloDevs)
- [Discord](https://discord.com/invite/celo)

<p align="right">(<a href="#top">back to top</a>)</p>
