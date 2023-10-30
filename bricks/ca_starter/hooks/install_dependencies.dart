import 'dart:io';

import 'package:mason/mason.dart';

class InstallDependencies {
  static final errorAlready = "is already in";
  static Future<void> installAllDependencies(HookContext context) async {
    await _addGetIt(context);
    await _addInjectable(context);
    await _addInjectableGen(context);
    await _addFlutterBloc(context);
    await _addDartz(context);
    await _addDio(context);
    await _addDioSmartRetry(context);
    await _addBuildRunner(context);
    await _addFlutterGen(context);
    await _addSmartDialog(context);
    await _addLogger(context);
    await _addGoogleFont(context);
    await _addSharedPreferences(context);
  }

  static Future<void> _addGetIt(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING get_it');
    var cmdGetIt = await Process.run('flutter', ['pub', 'add', 'get_it']);

    if (cmdGetIt.exitCode == 0) {
      installDone.complete('DONE Installing get_it!');
    } else {
      if (cmdGetIt.stderr.toString().contains(errorAlready)) {
        installDone.complete(cmdGetIt.stderr);
      } else {
        installDone.fail(cmdGetIt.stderr);
      }
    }
  }

  static Future<void> _addInjectable(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING injectable');
    var installFlutterGen =
        await Process.run('flutter', ['pub', 'add', 'injectable']);

    if (installFlutterGen.exitCode == 0) {
      installDone.complete('DONE Installing injectable!');
    } else {
      if (installFlutterGen.stderr.toString().contains(errorAlready)) {
        installDone.complete(installFlutterGen.stderr);
      } else {
        installDone.fail(installFlutterGen.stderr);
      }
    }
  }

  static Future<void> _addInjectableGen(HookContext context) async {
    final installDone =
        context.logger.progress('INSTALLING injectable_generator');
    var installFlutterGen = await Process.run(
        'flutter', ['pub', 'add', '-d', 'injectable_generator']);

    if (installFlutterGen.exitCode == 0) {
      installDone.complete('DONE Installing injectable_generator!');
    } else {
      if (installFlutterGen.stderr.toString().contains(errorAlready)) {
        installDone.complete(installFlutterGen.stderr);
      } else {
        installDone.fail(installFlutterGen.stderr);
      }
    }
  }

  static Future<void> _addFlutterBloc(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING flutter_bloc');
    var installFlutterBloc =
        await Process.run('flutter', ['pub', 'add', 'flutter_bloc']);

    if (installFlutterBloc.exitCode == 0) {
      installDone.complete('DONE Installing flutter_bloc!');
    } else {
      if (installFlutterBloc.stderr.toString().contains(errorAlready)) {
        installDone.complete(installFlutterBloc.stderr);
      } else {
        installDone.fail(installFlutterBloc.stderr);
      }
    }
  }

  static Future<void> _addDartz(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING dartz');
    var installDartz = await Process.run('flutter', ['pub', 'add', 'dartz']);

    if (installDartz.exitCode == 0) {
      installDone.complete('DONE Installing dartz!');
    } else {
      if (installDartz.stderr.toString().contains(errorAlready)) {
        installDone.complete(installDartz.stderr);
      } else {
        installDone.fail(installDartz.stderr);
      }
    }
  }

  static Future<void> _addDio(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING dio');
    var installDio = await Process.run('flutter', ['pub', 'add', 'dio']);

    if (installDio.exitCode == 0) {
      installDone.complete('DONE Installing dio!');
    } else {
      if (installDio.stderr.toString().contains(errorAlready)) {
        installDone.complete(installDio.stderr);
      } else {
        installDone.fail(installDio.stderr);
      }
    }
  }

  static Future<void> _addDioSmartRetry(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING dio_smart_retry');
    var installFlutterGen =
        await Process.run('flutter', ['pub', 'add', 'dio_smart_retry']);

    if (installFlutterGen.exitCode == 0) {
      installDone.complete('DONE Installing dio_smart_retry!');
    } else {
      if (installFlutterGen.stderr.toString().contains(errorAlready)) {
        installDone.complete(installFlutterGen.stderr);
      } else {
        installDone.fail(installFlutterGen.stderr);
      }
    }
  }

  static Future<void> _addBuildRunner(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING build_runner');
    var installBuildRunner =
        await Process.run('flutter', ['pub', 'add', '-d', 'build_runner']);

    if (installBuildRunner.exitCode == 0) {
      installDone.complete('DONE Installing build_runner!');
    } else {
      if (installBuildRunner.stderr.toString().contains(errorAlready)) {
        installDone.complete(installBuildRunner.stderr);
      } else {
        installDone.fail(installBuildRunner.stderr);
      }
    }
  }

  static Future<void> _addFlutterGen(HookContext context) async {
    final installDone =
        context.logger.progress('INSTALLING flutter_gen_runner');
    var installFlutterGen =
        await Process.run('flutter', ['pub', 'add', 'flutter_gen_runner']);

    if (installFlutterGen.exitCode == 0) {
      installDone.complete('DONE Installing flutter_gen_runner!');
    } else {
      if (installFlutterGen.stderr.toString().contains(errorAlready)) {
        installDone.complete(installFlutterGen.stderr);
      } else {
        installDone.fail(installFlutterGen.stderr);
      }
    }
  }

  static Future<void> _addSmartDialog(HookContext context) async {
    final installDone =
        context.logger.progress('INSTALLING flutter_smart_dialog');
    var installFlutterGen =
        await Process.run('flutter', ['pub', 'add', 'flutter_smart_dialog']);

    if (installFlutterGen.exitCode == 0) {
      installDone.complete('DONE Installing flutter_smart_dialog!');
    } else {
      if (installFlutterGen.stderr.toString().contains(errorAlready)) {
        installDone.complete(installFlutterGen.stderr);
      } else {
        installDone.fail(installFlutterGen.stderr);
      }
    }
  }

  static Future<void> _addLogger(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING logger');
    var installFlutterGen =
        await Process.run('flutter', ['pub', 'add', 'logger']);

    if (installFlutterGen.exitCode == 0) {
      installDone.complete('DONE Installing logger!');
    } else {
      if (installFlutterGen.stderr.toString().contains(errorAlready)) {
        installDone.complete(installFlutterGen.stderr);
      } else {
        installDone.fail(installFlutterGen.stderr);
      }
    }
  }

  static Future<void> _addGoogleFont(HookContext context) async {
    final installDone = context.logger.progress('INSTALLING google_fonts');
    var installFlutterGen =
        await Process.run('flutter', ['pub', 'add', 'google_fonts']);

    if (installFlutterGen.exitCode == 0) {
      installDone.complete('DONE Installing google_fonts!');
    } else {
      if (installFlutterGen.stderr.toString().contains(errorAlready)) {
        installDone.complete(installFlutterGen.stderr);
      } else {
        installDone.fail(installFlutterGen.stderr);
      }
    }
  }

  static Future<void> _addSharedPreferences(HookContext context) async {
    final installDone =
        context.logger.progress('INSTALLING shared_preferences');
    var installFlutterGen =
        await Process.run('flutter', ['pub', 'add', 'shared_preferences']);

    if (installFlutterGen.exitCode == 0) {
      installDone.complete('DONE Installing shared_preferences!');
    } else {
      if (installFlutterGen.stderr.toString().contains(errorAlready)) {
        installDone.complete(installFlutterGen.stderr);
      } else {
        installDone.fail(installFlutterGen.stderr);
      }
    }
  }
}
