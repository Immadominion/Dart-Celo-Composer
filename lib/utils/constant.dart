import 'package:chalkdart/chalk.dart';

const String baseUrl = "https://github.com/celo-org/celo-composer/";

const Map<String, String> availablePackages = {
  'hardhat': 'Hardhat',
  'flutter-app': 'Flutter',
  'subgraphs': 'TheGraph',
};

const Map<String, String> packageNameMap = {
  'hardhat': 'hardhat',
  'flutter-app': 'flutter-app',
  'subgraphs': 'subgraphs',
};

Map<String, dynamic> getProjectJson(String projectName, String author) {
  return {
    'author': author,
    'bugs': {
      'url': 'https://github.com/celo-org/celo-composer/issues',
    },
    'description': 'Custom Celo Composer project.',
    'homepage': 'https://github.com/celo-org/celo-composer/blob/main/README.md',
    'keywords': ['celo-composer', 'celo'],
    'license': 'MIT',
    'name': projectName,
    'private': true,
    'repository': {
      'type': 'git',
      'url': 'git+https://github.com/celo-org/celo-composer.git',
    },
    'scripts': {},
    'version': '1.0.0',
  };
}

String getTemplateUrl(String template) {
  switch (template) {
    case 'Minipay':
      return 'https://github.com/celo-org/minipay-template.git';
    case 'Valora':
      return 'https://github.com/celo-org/valora-template.git';
    default:
      return 'https://github.com/celo-org/minipay-template.git';
  }
}

void displayInstructions() {
  print(chalk.green
      .bold('\n🚀 Your starter project has been successfully created!\n'));

  print(
      chalk.bold('Before you start the project, please follow these steps:\n'));

  print('${chalk.cyan('1.')} Rename the file:');
  print(chalk.yellow('   lib/env.template.dart'));
  print('   to');
  print(chalk.yellow('   lib/env.dart\n'));

  print(
      '${chalk.cyan('2.')} Open the newly renamed ${chalk.yellow('env.dart')} file and add all the required environment variables.\n');

  print(chalk.bold(
      'Once you\'ve done that, you\'re all set to start your project!\n'));

  print(chalk.green.bold(
      'Run the following commands from the project folder to start the project:\n'));
  print(chalk.yellow('   dart pub get'));
  print(chalk.yellow('   dart run\n'));

  print(chalk.green(
      'For detailed instructions on deploying the project using Vercel CLI, please refer to the Deployment Guide:'));
  print(chalk.blue(
      'https://github.com/celo-org/celo-composer/blob/main/docs/DEPLOYMENT_GUIDE.md'));

  print(chalk
      .green('For adding UI components, please refer to the following guide:'));
  print(chalk.blue(
      'https://github.com/celo-org/celo-composer/blob/main/docs/UI_COMPONENTS.md\n'));

  print(
      '${chalk.green('Thank you for using Celo Composer!')} If you have any questions or need further assistance, please refer to the README or reach out to our team.\n');

  print(chalk.blue.bold('Happy coding! 🎉\n'));
}
