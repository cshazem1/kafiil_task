

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kafiil_task/kafiil_task.dart';

import 'bloc_observer.dart';
import 'core/service_located.dart';
import 'features/auth/data/models/auth_model/auth_model.dart';


void main() {
  Bloc.observer = MyBlocObserver();



  // Setup GetIt before running the app
  ServiceLocated().setup();
  runApp( KafiilTask());
}

