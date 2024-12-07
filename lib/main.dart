import 'dart:io';
import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption('projectName', abbr: 'n', help: 'Name of the project')
    ..addFlag('useTemplate',
        abbr: 't', help: 'Use a template', defaultsTo: false);

  final argResults = parser.parse(arguments);

  final projectName = argResults['projectName'];
  final useTemplate = argResults['useTemplate'];

  if (projectName == null) {
    print('Please provide a project name using -n option.');
    exit(1);
  }

  print('Creating project: $projectName');
  if (useTemplate) {
    print('Using template...');
    // Clone template repository and set up project
  } else {
    // Set up a basic Flutter project
  }
}
