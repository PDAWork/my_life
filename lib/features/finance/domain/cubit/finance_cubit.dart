import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_life/features/finance/domain/entity/finance_tool.dart';
import 'package:my_life/features/finance/domain/repository/i_finance_repository.dart';

class FinanceCubit extends Cubit<List<FinanceTool>> {
  FinanceCubit(IFinanceRepository repository) : super(repository.tools);
}
