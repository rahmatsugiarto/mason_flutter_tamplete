import 'dart:io';

import 'package:mason/mason.dart';

class InstallDependencies {
  static Future<void> installAllDependencies(HookContext context) async {
    await _addGetIt(context);
    await _addFlutterBloc(context);
    await _addDartz(context);
    await _addDio(context);
    await _addBuildRunner(context);
    await _addFlutterGen(context);
  }

  static Future<void> _addGetIt(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING get_it');
    var cmdGetIt = await Process.run('flutter', ['pub', 'add', 'get_it']);

    if (cmdGetIt.exitCode == 0) {
      installDone.complete('DONE Installing get_it!');
    } else {
      installDone.fail(cmdGetIt.stderr);
    }
  }

  static Future<void> _addFlutterBloc(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING flutter_bloc');
    var installFlutterBloc =
        await Process.run('flutter', ['pub', 'add', 'flutter_bloc']);

    if (installFlutterBloc.exitCode == 0) {
      installDone.complete('DONE Installing flutter_bloc!');
    } else {
      installDone.fail(installFlutterBloc.stderr);
    }
  }

  static Future<void> _addDartz(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING dartz');
    var installDartz = await Process.run('flutter', ['pub', 'add', 'dartz']);

    if (installDartz.exitCode == 0) {
      installDone.complete('DONE Installing dartz!');
    } else {
      installDone.fail(installDartz.stderr);
    }
  }

  static Future<void> _addDio(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING dio');
    var installDio = await Process.run('flutter', ['pub', 'add', 'dio']);

    if (installDio.exitCode == 0) {
      installDone.complete('DONE Installing dio!');
    } else {
      installDone.fail(installDio.stderr);
    }
  }

  static Future<void> _addBuildRunner(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING build_runner');
    var installBuildRunner = await Process.run('flutter', ['pub', 'add', 'build_runner']);

    if (installBuildRunner.exitCode == 0) {
      installDone.complete('DONE Installing build_runner!');
    } else {
      installDone.fail(installBuildRunner.stderr);
    }
  }

  static Future<void> _addFlutterGen(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING flutter_gen_runner');
    var installFlutterGen =
        await Process.run('flutter', ['pub', 'add', 'flutter_gen_runner']);

    if (installFlutterGen.exitCode == 0) {
      installDone.complete('DONE Installing flutter_gen_runner!');
    } else {
      installDone.fail(installFlutterGen.stderr);
    }
  }
}
