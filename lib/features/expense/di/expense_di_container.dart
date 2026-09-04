import '../../../core/data/network/dio_client.dart';
import '../../../core/di/core_di_container.dart';
import '../data/datasource/remote/expense_remote_data_source.dart';
import '../data/datasource/remote/expense_remote_data_source_impl.dart';
import '../data/repository/expense_repository_impl.dart';
import '../domain/repository/expense_repository.dart';
import '../domain/usecase/create_expense_usecase.dart';
import '../domain/usecase/delete_expense_usecase.dart';
import '../domain/usecase/get_expense_detail_usecase.dart';
import '../domain/usecase/get_expenses_usecase.dart';
import '../domain/usecase/update_expense_usecase.dart';
import '../domain/usecase/upload_receipt_usecase.dart';
import '../presentation/logic/expenses_cubit.dart';


Future<void> initExpenses() async {
  // data
  sl.registerLazySingleton<ExpensesRemoteDataSource>(
        () => ExpensesRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );
  sl.registerLazySingleton<ExpensesRepository>(
        () => ExpensesRepositoryImpl(remoteDataSource: sl<ExpensesRemoteDataSource>()),
  );

  // domain
  sl.registerLazySingleton(() => GetExpensesUseCase(sl<ExpensesRepository>()));
  sl.registerLazySingleton(() => GetExpenseDetailUseCase(sl<ExpensesRepository>()));
  sl.registerLazySingleton(() => CreateExpenseUseCase(sl<ExpensesRepository>()));
  sl.registerLazySingleton(() => UpdateExpenseUseCase(sl<ExpensesRepository>()));
  sl.registerLazySingleton(() => DeleteExpenseUseCase(sl<ExpensesRepository>()));
  sl.registerLazySingleton(() => UploadReceiptUseCase(sl<ExpensesRepository>()));

  // presentation
  sl.registerFactory<ExpensesCubit>(
        () => ExpensesCubit(
      getExpensesUseCase: sl<GetExpensesUseCase>(),
      deleteExpenseUseCase: sl<DeleteExpenseUseCase>(),
      createExpenseUseCase: sl<CreateExpenseUseCase>(),
      uploadReceiptUseCase: sl<UploadReceiptUseCase>(),
    ),
  );

}