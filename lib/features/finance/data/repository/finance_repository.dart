import 'package:my_life/features/finance/domain/entity/finance_tool.dart';
import 'package:my_life/features/finance/domain/repository/i_finance_repository.dart';

final class FinanceRepository implements IFinanceRepository {
  const FinanceRepository();
  @override
  List<FinanceTool> get tools => const [FinanceTool.mortgage];
}
