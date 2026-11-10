import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/errors/failures.dart';
import 'package:movies/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:movies/features/auth/domain/entities/user_entity.dart';
import 'package:movies/features/auth/domain/repositories/auth_repository.dart';
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource); 

  @override
 Future<Either<Failure, UserEntity>> signInWithEmail({required String email, required String password}) async {
    try {
      final user = await _authRemoteDataSource.signInWithEmail(email: email, password: password);
      return Right(user.toEntity());                          // ✅ success
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Login failed'));  // ❌ Firebase error
    } catch (e) {
      return Left(AuthFailure(e.toString()));                 // ❌ any other error
    }
  }

  //
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await _authRemoteDataSource.signInWithGoogle();
      return Right(user.toEntity());                          // ✅ success
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Login failed'));  // ❌ Firebase error
    } catch (e) {
      return Left(AuthFailure(e.toString()));                 // ❌ any other error
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmail({required String name, required String email, required String password, required String phone}) async {
    try {
      final user = await _authRemoteDataSource.signUpWithEmail(name: name, email: email, password: password, phone: phone);
      return Right(user.toEntity());                          // ✅ success
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Login failed'));  // ❌ Firebase error
    } catch (e) {
      return Left(AuthFailure(e.toString()));                 // ❌ any other error
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await _authRemoteDataSource.resetPassword(email);
      return const Right(null);                               // ✅ success
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Reset password failed'));  // ❌ Firebase error
    } catch (e) {
      return Left(AuthFailure(e.toString()));                 // ❌ any other error
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _authRemoteDataSource.signOut();
      return const Right(null);                               // ✅ success
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Sign out failed'));  // ❌ Firebase error
    } catch (e) {
      return Left(AuthFailure(e.toString()));                 // ❌ any other error
    }
  }
}