import 'dart:io';
import 'package:args/args.dart';
import 'package:emojis/emoji.dart';
import 'package:path/path.dart' as path;
import 'package:chalkdart/chalk.dart';
import 'package:prompts/prompts.dart' as prompts;
import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';
import 'package:cli_spinner/cli_spinner.dart';

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('projectName', abbr: 'n', help: 'Name of the project')
    ..addFlag('useTemplate',
        abbr: 't', help: 'Use a template', defaultsTo: false);

  final argResults = parser.parse(arguments);

  final projectName = argResults['projectName'];
  final useTemplate = argResults['useTemplate'];

  Spinner loading(String message) {
    final spinner = Spinner(message);
    spinner.start();
    return spinner;
  }

  if (projectName == null) {
    print('Please provide a project name using -n option.');
    exit(1);
  }

  final packages = ['flutter-app'];

  final hardhatRequired =
      prompts.getBool('Do you want to use Hardhat?', defaultsTo: true);
  if (hardhatRequired) packages.add('hardhat');

  final ownerName =
      prompts.get('Project Owner name: ', validate: (String input) {
    return input.trim().isNotEmpty;
  });

  final pwd = Directory.current.path;
  final outputDir = path.join(pwd, projectName);

  if (await Directory(outputDir).exists()) {
    print('Project directory already exists: $outputDir');
    exit(1);
  }

  final spinner = loading('Generating custom Flutter project...');
  try {
    await copyPackagesDirectory(pwd, projectName);

    final projectDir = path.join(pwd, projectName);
    final packageJsonPath = path.join(projectDir, 'pubspec.yaml');
    final packageData = await File(packageJsonPath).readAsString();
    final packageJson = Map<String, dynamic>.from(loadYaml(packageData));
    packageJson['name'] = projectName;
    packageJson['author'] = ownerName;

    final yamlWriter = YAMLWriter();
    await File(packageJsonPath).writeAsString(yamlWriter.write(packageJson));

    final gitDir = path.join(Directory.current.path, projectName, '.git');
    await Directory(gitDir).delete(recursive: true);
    await runCommand('git', ['init', '--quiet', '--initial-branch=main'],
        workingDirectory: path.join(Directory.current.path, projectName));
    await runCommand('git', ['add', '.'],
        workingDirectory: path.join(Directory.current.path, projectName));
    await runCommand('git', ['commit', '-m', 'Initial commit'],
        workingDirectory: path.join(Directory.current.path, projectName));

    spinner.stop();
    print('${Emoji.byName('hundredPoints')} ${chalk.green(' Done!')}');
    displayInstructions();
  } catch (error) {
    print(error);
    print('Error generating project');
  }
}

Future<void> runCommand(String command, List<String> arguments,
    {String? workingDirectory}) async {
  final result =
      await Process.run(command, arguments, workingDirectory: workingDirectory);
  if (result.exitCode != 0) {
    throw Exception(
        'Command failed: $command ${arguments.join(' ')}\n${result.stderr}');
  }
}

Future<void> copyPackagesDirectory(String sourceDir, String projectName) async {
  final sourcePackagesDir = path.join(sourceDir, 'packages/flutter_app');
  final targetPackagesDir = path.join(sourceDir, projectName);

  if (await Directory(sourcePackagesDir).exists()) {
    await Directory(targetPackagesDir).create(recursive: true);
    await for (var entity
        in Directory(sourcePackagesDir).list(recursive: true)) {
      if (entity is File) {
        final newPath =
            entity.path.replaceFirst(sourcePackagesDir, targetPackagesDir);
        await File(newPath).create(recursive: true);
        await entity.copy(newPath);
      } else if (entity is Directory) {
        final newPath =
            entity.path.replaceFirst(sourcePackagesDir, targetPackagesDir);
        await Directory(newPath).create(recursive: true);
      }
    }
  }
}

void displayInstructions() {
  print(chalk.green
      .bold('\n🚀 Your Flutter project has been successfully created!\n'));

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
