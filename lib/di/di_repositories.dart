import 'package:my_life/features/finance/data/repository/finance_repository.dart';
import 'package:my_life/features/finance/domain/repository/i_finance_repository.dart';

final class DiRepositories {
  final IFinanceRepository financeRepository = const FinanceRepository();
}
