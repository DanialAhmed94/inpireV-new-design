import 'package:dartz/dartz.dart';
import 'package:public_housing/api/provider/api_provider.dart';
import 'package:public_housing/screens/auth/model/login_model.dart';
import 'package:public_housing/screens/inspire-v-newdesign/auth/model/login_model_inspireV.dart';

import '../../../../api/provider/status_objects.dart';
import '../../../auth/model/inspector_model.dart';
import '../model/client_model_inspireV.dart';
import '../model/inspector_model_inspireV.dart';



class LoginRepositoryInspireV {
  final ApiProviders _provider = ApiProviders();

  LoginRepositoryInspireV();

  Future<Either<Failure, LoginmodelInspireV>> login(mapJson) async {
    var response = await _provider.loginRequest1(mapJson);
    return response.fold((l) => Left(l), (r) => Right(r));
  }

  Future<Either<Failure, InspectorModelInspireV>> createInspector(
      {required String name}) async {
    var response = await _provider.createInspectorRequest1(name: name);
    return response.fold((l) => Left(l), (r) => Right(r));
  }

  Future<Either<Failure, List<InspireTenant>>> fetchTenants() async {
    var response = await _provider.fetchTenants();
    return response.fold(
          (l) => Left(l),
          (r) => Right(r),
    );
  }
}
